---------------------------------------------------------------------------
--! @file spi_slave.vhd
--! @author Sergejs Umnovs
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.data_types.all;
use work.functions.all;

--! @brief Asynchronous SPI interface slave component. Clock signal is taken from
--!   SPI master.  SPI Master may send and receive data in a specific bit and word
--!   order.  You can configure the SPI slave to have one or more serial data bits.
--!   This allows to use such protocols as QSPI.  Input and output parallel data
--!   ports are aslv ports. Input data consists of words which are made of symbols.
--!   Word count, word length and symbol length are deduced from signals, two
--!   additional constants are calculated from these values, which hold symbol count
--!   in a single word and total symbol count. These variables are used in other
--!   signals.
--!
--! For example:
--! Word count:     4
--! Word length:    8
--! Symbol length:  1
--!
--! Symbol count in a single word:  8 / 1 = 8
--! Total symbol count:             8 * 4 = 32
--! In this case symbols are essentially bits 
--!                       input data:       0x12              34              56              78  
--!                       words:      |     word_3    |     word_2    |     word_1    |     word_0    |
--!                       symbols:    |0|0|0|1|0|0|1|0|0|0|1|1|0|1|0|0|0|1|0|1|0|1|1|0|0|1|1|1|1|0|0|0|
--!
--! The SPI slave uses a PIPO shift register from EDI IC Design IP library to realize sending and receiving.
--! The SPI slave sends serial data starting from most significant word and most significant symbol
--! and receives serial data by inserting incoming symbols into shift register from least significant symbol.
--! You can the actual data order by reversing words and/or symbols using i_rev_* signals.
entity spi_slave is
  port(
    clk               : in sl;    --! System clock, not used
    arst              : in sl;    --! Asynchronous reset

    -- n-spi interface
    i_mclk            : in  sl;   --! SPI clock
    i_mosi            : in  slv;  --! SPI Master Out Slave In
    o_miso            : out slv;  --! SPI Master In Slave Out
    i_msel            : in  sl;   --! SPI Chip Select

    -- external data (input) interface, for data loading
    i_load            : in  sl;   --! Load input data signal
    i_data            : in  aslv; --! Parallel input port
    o_ready           : out sl;   --! Indicates readiness of the slave to load parallel data

    -- external data (output) interface
    o_valid           : out sl;   --! Indicates validity of received data from master
    o_data            : out aslv  --! Parallel output port
  );
end entity;

architecture RTL of spi_slave is
  constant WORD_COUNT : natural := i_data'length;
  constant WORD_LENGTH : natural := i_data(0)'length;
  constant SYMBOL_LENGTH : natural := i_mosi'length;
  constant SYMBOL_COUNT_IN_WORD : natural := WORD_LENGTH / SYMBOL_LENGTH;
  constant TOTAL_SYMBOL_COUNT : natural := WORD_COUNT * SYMBOL_COUNT_IN_WORD;

  signal i_data_deconstructed : aslv(0 to TOTAL_SYMBOL_COUNT-1)(SYMBOL_LENGTH-1 downto 0) := (others => (others => '0'));
  signal i_data_deconstructed_preshifted : aslv(i_data_deconstructed'range)(i_data_deconstructed(0)'range) := (others => (others => '0'));
  signal i_data_preshifted : aslv(i_data'range)(i_data(0)'range) := (others => (others => '0'));
  signal valid_reg, valid_next : slv(TOTAL_SYMBOL_COUNT-1 downto 0) := (others => '0');

  signal start_txn : sl := '0';
  signal txn_done : sl := '0';
  signal start_reg, start_next : sl := '0';
  signal start_rising_edge : sl := '0';

  signal busy_reg, busy_next : sl := '0';

  signal serial_data_out : slv(SYMBOL_LENGTH-1 downto 0) := (others => '0');
  signal parallel_data_in : aslv(i_data'range)(i_data(0)'range) := (others => (others => '0'));
  signal parallel_data_out : aslv(i_data'range)(i_data(0)'range) := (others => (others => '0'));

  
begin
  
  process(i_mclk, arst)
  begin
    if arst = '1' then
      valid_reg <= (others => '0');
      start_reg <= '0';
      busy_reg  <= '0';
    elsif rising_edge(i_mclk) then
      valid_reg <= valid_next;
      start_reg <= start_next;
      busy_reg  <= busy_next;
    end if;
  end process;

  -- next-state logic
  PIPO: entity work.pipo
    port map(
      clk => i_mclk,
      rst => arst,
      en => not i_msel,

      i_load => i_load,
      
      i_data => parallel_data_in,
      o_data => parallel_data_out,

      i_sdata => i_mosi,
      o_sdata => serial_data_out
    );

  ---- to shift parallel data out right after receiving last serial symbol,
  ---- we need to immediately switch MISO to the next data bit - the transformed (with changed symbol order) data MSB.
  ---- to send the rest, we just load in preshifted data which is sent as usual

  -- deconstruct data
  process(i_data) is
    variable symbol_high : natural := 0;
    variable symbol_low : natural := 0;
  begin
    for i in 0 to WORD_COUNT-1 loop
      for j in 0 to SYMBOL_COUNT_IN_WORD-1 loop
        symbol_low := j*SYMBOL_LENGTH;
        symbol_high := (j+1)*SYMBOL_LENGTH - 1;
        i_data_deconstructed(i*SYMBOL_COUNT_IN_WORD + j) <= i_data(i)(symbol_high downto symbol_low);
      end loop;
    end loop;
  end process;

  -- prepare preshifted data
  i_data_deconstructed_preshifted(1 to i_data_deconstructed_preshifted'high) <= i_data_deconstructed(0 to i_data_deconstructed'high-1);
  i_data_deconstructed_preshifted(0) <= (others => '0');

  -- construct data
  process(i_data_deconstructed_preshifted) is
    variable symbol_high : natural := 0;
    variable symbol_low : natural := 0;
  begin
    for i in 0 to WORD_COUNT-1 loop
      for j in 0 to SYMBOL_COUNT_IN_WORD-1 loop
        symbol_low := j*SYMBOL_LENGTH;
        symbol_high := (j+1)*SYMBOL_LENGTH - 1;
        i_data_preshifted(i)(symbol_high downto symbol_low) <= i_data_deconstructed_preshifted(i*SYMBOL_COUNT_IN_WORD + j);
      end loop;
    end loop;
  end process;

  -- parallel input data will always be sent, so always make preshifted data
  parallel_data_in <= i_data_preshifted;


  -- to validate received data and get to know when to read received data,
  -- this delay shift register uses a small pulse generating circuit,
  -- which consists only of a few components that operate only on several bits
  -- instead of using a counter with many muxes a comparator and an adder

  start_txn <= not i_msel or i_load;
  start_next <= start_txn;

  -- not busy reg is here to make sure that there is only one bit in the valid shift register
  start_rising_edge <= not start_reg and (not busy_reg) and start_next;
  
  txn_done <= valid_reg(valid_reg'high);
  valid_next(0) <= start_rising_edge or (start_txn and txn_done);
  valid_next(valid_reg'high downto valid_reg'low+1) <= valid_reg(valid_reg'high-1 downto valid_reg'low);

  -- shift register feedback loop
  busy_next <= start_txn when txn_done = '1' else
               busy_reg when busy_reg = '1' else
               start_txn;

  -- outputs
  o_ready <= not busy_reg or txn_done;

  -- assert o_valid only when we are receiving
  o_valid <= txn_done;

  -- pre-set miso when loading data
  o_miso <= i_data_deconstructed(i_data_deconstructed'high) when i_load = '1' else
            serial_data_out;


  o_data <= parallel_data_out;
                     

end architecture;
