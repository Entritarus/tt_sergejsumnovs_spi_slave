module pipo_7b7b80ea99975bfa51cb6ef0ceb50ca4697ae2b8
  (input  clk,
   input  rst,
   input  en,
   input  i_load,
   input  [7:0] i_data,
   input  i_sdata,
   output [7:0] o_data,
   output o_sdata);
  reg [7:0] data_reg;
  reg [7:0] data_next;
  reg [7:0] idata_deconstructed;
  reg [7:0] odata_reconstructed;
  wire n1064_o;
  wire n1065_o;
  wire n1066_o;
  wire n1067_o;
  wire n1068_o;
  wire n1069_o;
  wire n1070_o;
  wire n1071_o;
  wire n1077_o;
  wire n1078_o;
  wire n1079_o;
  wire n1080_o;
  wire n1081_o;
  wire n1082_o;
  wire n1083_o;
  wire n1084_o;
  wire n1085_o;
  wire n1086_o;
  wire n1087_o;
  wire n1088_o;
  wire n1089_o;
  wire n1090_o;
  wire n1091_o;
  wire [7:0] n1092_o;
  wire [7:0] n1093_o;
  wire [7:0] n1094_o;
  wire n1100_o;
  wire n1101_o;
  wire n1102_o;
  wire n1103_o;
  wire n1104_o;
  wire n1105_o;
  wire n1106_o;
  wire n1107_o;
  wire n1111_o;
  wire [7:0] n1112_o;
  reg [7:0] n1113_q;
  wire [7:0] n1114_o;
  wire [7:0] n1115_o;
  assign o_data = odata_reconstructed; //(module output)
  assign o_sdata = n1111_o; //(module output)
  /* ./files_for_tt/pipo.vhdl:53:10  */
  always @*
    data_reg = n1113_q; // (isignal)
  initial
    data_reg = 8'b00000000;
  /* ./files_for_tt/pipo.vhdl:53:20  */
  always @*
    data_next = n1094_o; // (isignal)
  initial
    data_next = 8'b00000000;
  /* ./files_for_tt/pipo.vhdl:55:10  */
  always @*
    idata_deconstructed = n1114_o; // (isignal)
  initial
    idata_deconstructed = 8'b00000000;
  /* ./files_for_tt/pipo.vhdl:56:10  */
  always @*
    odata_reconstructed = n1115_o; // (isignal)
  initial
    odata_reconstructed = 8'b00000000;
  /* ./files_for_tt/pipo.vhdl:81:69  */
  assign n1064_o = i_data[0]; // extract
  /* ./files_for_tt/pipo.vhdl:81:69  */
  assign n1065_o = i_data[1]; // extract
  /* ./files_for_tt/pipo.vhdl:81:69  */
  assign n1066_o = i_data[2]; // extract
  /* ./files_for_tt/pipo.vhdl:81:69  */
  assign n1067_o = i_data[3]; // extract
  /* ./files_for_tt/pipo.vhdl:81:69  */
  assign n1068_o = i_data[4]; // extract
  /* ./files_for_tt/pipo.vhdl:81:69  */
  assign n1069_o = i_data[5]; // extract
  /* ./files_for_tt/pipo.vhdl:81:69  */
  assign n1070_o = i_data[6]; // extract
  /* ./files_for_tt/pipo.vhdl:81:69  */
  assign n1071_o = i_data[7]; // extract
  /* ./files_for_tt/pipo.vhdl:90:44  */
  assign n1077_o = idata_deconstructed[7]; // extract
  /* ./files_for_tt/pipo.vhdl:90:44  */
  assign n1078_o = idata_deconstructed[6]; // extract
  /* ./files_for_tt/pipo.vhdl:90:44  */
  assign n1079_o = idata_deconstructed[5]; // extract
  /* ./files_for_tt/pipo.vhdl:90:44  */
  assign n1080_o = idata_deconstructed[4]; // extract
  /* ./files_for_tt/pipo.vhdl:90:44  */
  assign n1081_o = idata_deconstructed[3]; // extract
  /* ./files_for_tt/pipo.vhdl:90:44  */
  assign n1082_o = idata_deconstructed[2]; // extract
  /* ./files_for_tt/pipo.vhdl:90:44  */
  assign n1083_o = idata_deconstructed[1]; // extract
  /* ./files_for_tt/pipo.vhdl:90:44  */
  assign n1084_o = idata_deconstructed[0]; // extract
  /* ./files_for_tt/pipo.vhdl:95:33  */
  assign n1085_o = data_reg[7]; // extract
  /* ./files_for_tt/pipo.vhdl:95:33  */
  assign n1086_o = data_reg[6]; // extract
  /* ./files_for_tt/pipo.vhdl:95:33  */
  assign n1087_o = data_reg[5]; // extract
  /* ./files_for_tt/pipo.vhdl:95:33  */
  assign n1088_o = data_reg[4]; // extract
  /* ./files_for_tt/pipo.vhdl:95:33  */
  assign n1089_o = data_reg[3]; // extract
  /* ./files_for_tt/pipo.vhdl:95:33  */
  assign n1090_o = data_reg[2]; // extract
  /* ./files_for_tt/pipo.vhdl:95:33  */
  assign n1091_o = data_reg[1]; // extract
  assign n1092_o = {i_sdata, n1085_o, n1086_o, n1087_o, n1088_o, n1089_o, n1090_o, n1091_o};
  assign n1093_o = {n1077_o, n1078_o, n1079_o, n1080_o, n1081_o, n1082_o, n1083_o, n1084_o};
  /* ./files_for_tt/pipo.vhdl:88:5  */
  assign n1094_o = i_load ? n1093_o : n1092_o;
  /* ./files_for_tt/pipo.vhdl:109:74  */
  assign n1100_o = data_reg[7]; // extract
  /* ./files_for_tt/pipo.vhdl:109:74  */
  assign n1101_o = data_reg[6]; // extract
  /* ./files_for_tt/pipo.vhdl:109:74  */
  assign n1102_o = data_reg[5]; // extract
  /* ./files_for_tt/pipo.vhdl:109:74  */
  assign n1103_o = data_reg[4]; // extract
  /* ./files_for_tt/pipo.vhdl:109:74  */
  assign n1104_o = data_reg[3]; // extract
  /* ./files_for_tt/pipo.vhdl:109:74  */
  assign n1105_o = data_reg[2]; // extract
  /* ./files_for_tt/pipo.vhdl:109:74  */
  assign n1106_o = data_reg[1]; // extract
  /* ./files_for_tt/pipo.vhdl:109:74  */
  assign n1107_o = data_reg[0]; // extract
  /* ./files_for_tt/pipo.vhdl:116:22  */
  assign n1111_o = data_reg[0]; // extract
  /* ./files_for_tt/pipo.vhdl:63:5  */
  assign n1112_o = en ? data_next : data_reg;
  /* ./files_for_tt/pipo.vhdl:63:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n1113_q <= 8'b00000000;
    else
      n1113_q <= n1112_o;
  /* ./files_for_tt/pipo.vhdl:61:5  */
  assign n1114_o = {n1064_o, n1065_o, n1066_o, n1067_o, n1068_o, n1069_o, n1070_o, n1071_o};
  assign n1115_o = {n1107_o, n1106_o, n1105_o, n1104_o, n1103_o, n1102_o, n1101_o, n1100_o};
endmodule

module lfsr_9d570a0e8d99e02cb348b823f461e41da66b8468
  (input  clk,
   input  rst,
   input  [7:0] i_poly,
   input  i_en,
   input  i_serial,
   input  i_load,
   input  [7:0] i_data,
   output o_serial,
   output [7:0] o_data);
  reg [7:0] shift_reg;
  reg [7:0] shift_next;
  wire n980_o;
  wire n981_o;
  wire n982_o;
  wire n983_o;
  wire n984_o;
  wire n985_o;
  wire n986_o;
  wire n987_o;
  wire n988_o;
  wire n989_o;
  wire n990_o;
  wire n991_o;
  wire n992_o;
  wire n993_o;
  wire n994_o;
  wire n995_o;
  wire n996_o;
  wire n997_o;
  wire n998_o;
  wire n999_o;
  wire n1000_o;
  wire n1001_o;
  wire n1002_o;
  wire n1003_o;
  wire n1004_o;
  wire n1005_o;
  wire n1006_o;
  wire n1007_o;
  wire n1008_o;
  wire n1009_o;
  wire n1010_o;
  wire n1011_o;
  wire n1012_o;
  wire n1013_o;
  wire n1014_o;
  wire n1015_o;
  wire n1016_o;
  wire n1017_o;
  wire n1018_o;
  wire n1019_o;
  wire n1020_o;
  wire n1021_o;
  wire n1022_o;
  wire n1023_o;
  wire n1024_o;
  wire n1025_o;
  wire n1026_o;
  wire n1027_o;
  wire n1028_o;
  wire n1029_o;
  wire n1030_o;
  wire n1031_o;
  wire n1032_o;
  wire n1033_o;
  wire n1034_o;
  wire n1035_o;
  wire n1036_o;
  wire n1037_o;
  wire n1038_o;
  wire n1039_o;
  wire n1040_o;
  wire n1041_o;
  wire n1042_o;
  wire [7:0] n1043_o;
  reg [7:0] n1044_q;
  wire [7:0] n1045_o;
  assign o_serial = n1042_o; //(module output)
  assign o_data = shift_reg; //(module output)
  /* ./files_for_tt/lfsr.vhdl:51:10  */
  always @*
    shift_reg = n1044_q; // (isignal)
  initial
    shift_reg = 8'b00000000;
  /* ./files_for_tt/lfsr.vhdl:51:21  */
  always @*
    shift_next = n1045_o; // (isignal)
  initial
    shift_next = 8'b00000000;
  /* ./files_for_tt/lfsr.vhdl:65:26  */
  assign n980_o = i_data[0]; // extract
  /* ./files_for_tt/lfsr.vhdl:65:30  */
  assign n981_o = i_load ? n980_o : n985_o;
  /* ./files_for_tt/lfsr.vhdl:66:29  */
  assign n982_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:66:46  */
  assign n983_o = n982_o ^ i_serial;
  /* ./files_for_tt/lfsr.vhdl:66:70  */
  assign n984_o = i_poly[0]; // extract
  /* ./files_for_tt/lfsr.vhdl:65:48  */
  assign n985_o = n984_o ? n983_o : i_serial;
  /* ./files_for_tt/lfsr.vhdl:69:28  */
  assign n986_o = i_data[1]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:32  */
  assign n987_o = i_load ? n986_o : n992_o;
  /* ./files_for_tt/lfsr.vhdl:70:31  */
  assign n988_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:61  */
  assign n989_o = shift_reg[0]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:48  */
  assign n990_o = n988_o ^ n989_o;
  /* ./files_for_tt/lfsr.vhdl:70:78  */
  assign n991_o = i_poly[1]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:50  */
  assign n992_o = n991_o ? n990_o : n993_o;
  /* ./files_for_tt/lfsr.vhdl:71:31  */
  assign n993_o = shift_reg[0]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:28  */
  assign n994_o = i_data[2]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:32  */
  assign n995_o = i_load ? n994_o : n1000_o;
  /* ./files_for_tt/lfsr.vhdl:70:31  */
  assign n996_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:61  */
  assign n997_o = shift_reg[1]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:48  */
  assign n998_o = n996_o ^ n997_o;
  /* ./files_for_tt/lfsr.vhdl:70:78  */
  assign n999_o = i_poly[2]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:50  */
  assign n1000_o = n999_o ? n998_o : n1001_o;
  /* ./files_for_tt/lfsr.vhdl:71:31  */
  assign n1001_o = shift_reg[1]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:28  */
  assign n1002_o = i_data[3]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:32  */
  assign n1003_o = i_load ? n1002_o : n1008_o;
  /* ./files_for_tt/lfsr.vhdl:70:31  */
  assign n1004_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:61  */
  assign n1005_o = shift_reg[2]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:48  */
  assign n1006_o = n1004_o ^ n1005_o;
  /* ./files_for_tt/lfsr.vhdl:70:78  */
  assign n1007_o = i_poly[3]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:50  */
  assign n1008_o = n1007_o ? n1006_o : n1009_o;
  /* ./files_for_tt/lfsr.vhdl:71:31  */
  assign n1009_o = shift_reg[2]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:28  */
  assign n1010_o = i_data[4]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:32  */
  assign n1011_o = i_load ? n1010_o : n1016_o;
  /* ./files_for_tt/lfsr.vhdl:70:31  */
  assign n1012_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:61  */
  assign n1013_o = shift_reg[3]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:48  */
  assign n1014_o = n1012_o ^ n1013_o;
  /* ./files_for_tt/lfsr.vhdl:70:78  */
  assign n1015_o = i_poly[4]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:50  */
  assign n1016_o = n1015_o ? n1014_o : n1017_o;
  /* ./files_for_tt/lfsr.vhdl:71:31  */
  assign n1017_o = shift_reg[3]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:28  */
  assign n1018_o = i_data[5]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:32  */
  assign n1019_o = i_load ? n1018_o : n1024_o;
  /* ./files_for_tt/lfsr.vhdl:70:31  */
  assign n1020_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:61  */
  assign n1021_o = shift_reg[4]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:48  */
  assign n1022_o = n1020_o ^ n1021_o;
  /* ./files_for_tt/lfsr.vhdl:70:78  */
  assign n1023_o = i_poly[5]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:50  */
  assign n1024_o = n1023_o ? n1022_o : n1025_o;
  /* ./files_for_tt/lfsr.vhdl:71:31  */
  assign n1025_o = shift_reg[4]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:28  */
  assign n1026_o = i_data[6]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:32  */
  assign n1027_o = i_load ? n1026_o : n1032_o;
  /* ./files_for_tt/lfsr.vhdl:70:31  */
  assign n1028_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:61  */
  assign n1029_o = shift_reg[5]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:48  */
  assign n1030_o = n1028_o ^ n1029_o;
  /* ./files_for_tt/lfsr.vhdl:70:78  */
  assign n1031_o = i_poly[6]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:50  */
  assign n1032_o = n1031_o ? n1030_o : n1033_o;
  /* ./files_for_tt/lfsr.vhdl:71:31  */
  assign n1033_o = shift_reg[5]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:28  */
  assign n1034_o = i_data[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:32  */
  assign n1035_o = i_load ? n1034_o : n1040_o;
  /* ./files_for_tt/lfsr.vhdl:70:31  */
  assign n1036_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:61  */
  assign n1037_o = shift_reg[6]; // extract
  /* ./files_for_tt/lfsr.vhdl:70:48  */
  assign n1038_o = n1036_o ^ n1037_o;
  /* ./files_for_tt/lfsr.vhdl:70:78  */
  assign n1039_o = i_poly[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:69:50  */
  assign n1040_o = n1039_o ? n1038_o : n1041_o;
  /* ./files_for_tt/lfsr.vhdl:71:31  */
  assign n1041_o = shift_reg[6]; // extract
  /* ./files_for_tt/lfsr.vhdl:74:24  */
  assign n1042_o = shift_reg[7]; // extract
  /* ./files_for_tt/lfsr.vhdl:58:5  */
  assign n1043_o = i_en ? shift_next : shift_reg;
  /* ./files_for_tt/lfsr.vhdl:58:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n1044_q <= 8'b00000000;
    else
      n1044_q <= n1043_o;
  /* ./files_for_tt/lfsr.vhdl:56:5  */
  assign n1045_o = {n1035_o, n1027_o, n1019_o, n1011_o, n1003_o, n995_o, n987_o, n981_o};
endmodule

module gpio_separate_2_0dfcee3aec5cbd17f5bdfbc6ec7da6c1f80fa91f
  (input  clk,
   input  rst,
   input  [3:0] i_dir,
   input  [3:0] i_wdata,
   input  [3:0] i_gpi,
   output [3:0] o_rdata,
   output [3:0] o_gpo,
   output [3:0] o_out_en);
  reg [7:0] sync_next;
  reg [7:0] sync_reg;
  reg [3:0] data_reg;
  reg [3:0] data_next;
  reg [3:0] sync_output;
  wire [3:0] n942_o;
  wire [3:0] n943_o;
  wire n944_o;
  wire n945_o;
  wire n946_o;
  wire n947_o;
  wire n948_o;
  wire n949_o;
  wire n950_o;
  wire n951_o;
  wire n952_o;
  wire n953_o;
  wire n954_o;
  wire n955_o;
  wire n956_o;
  wire n957_o;
  wire n958_o;
  wire n959_o;
  wire n960_o;
  wire n961_o;
  wire n962_o;
  wire n963_o;
  wire [7:0] n964_o;
  reg [7:0] n965_q;
  reg [3:0] n966_q;
  wire [3:0] n967_o;
  assign o_rdata = data_reg; //(module output)
  assign o_gpo = data_reg; //(module output)
  assign o_out_en = i_dir; //(module output)
  /* ./files_for_tt/gpio_separate.vhdl:38:10  */
  always @*
    sync_next = n964_o; // (isignal)
  initial
    sync_next = 8'b00000000;
  /* ./files_for_tt/gpio_separate.vhdl:38:21  */
  always @*
    sync_reg = n965_q; // (isignal)
  initial
    sync_reg = 8'b00000000;
  /* ./files_for_tt/gpio_separate.vhdl:39:10  */
  always @*
    data_reg = n966_q; // (isignal)
  initial
    data_reg = 4'b0000;
  /* ./files_for_tt/gpio_separate.vhdl:39:20  */
  always @*
    data_next = n967_o; // (isignal)
  initial
    data_next = 4'b0000;
  /* ./files_for_tt/gpio_separate.vhdl:40:10  */
  always @*
    sync_output = n943_o; // (isignal)
  initial
    sync_output = 4'b0000;
  /* ./files_for_tt/gpio_separate.vhdl:63:48  */
  assign n942_o = sync_reg[7:4]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:66:28  */
  assign n943_o = sync_reg[3:0]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:32  */
  assign n944_o = sync_output[3]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:46  */
  assign n945_o = i_dir[3]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:50  */
  assign n946_o = ~n945_o;
  /* ./files_for_tt/gpio_separate.vhdl:70:36  */
  assign n947_o = n946_o ? n944_o : n948_o;
  /* ./files_for_tt/gpio_separate.vhdl:71:28  */
  assign n948_o = i_wdata[3]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:32  */
  assign n949_o = sync_output[2]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:46  */
  assign n950_o = i_dir[2]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:50  */
  assign n951_o = ~n950_o;
  /* ./files_for_tt/gpio_separate.vhdl:70:36  */
  assign n952_o = n951_o ? n949_o : n953_o;
  /* ./files_for_tt/gpio_separate.vhdl:71:28  */
  assign n953_o = i_wdata[2]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:32  */
  assign n954_o = sync_output[1]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:46  */
  assign n955_o = i_dir[1]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:50  */
  assign n956_o = ~n955_o;
  /* ./files_for_tt/gpio_separate.vhdl:70:36  */
  assign n957_o = n956_o ? n954_o : n958_o;
  /* ./files_for_tt/gpio_separate.vhdl:71:28  */
  assign n958_o = i_wdata[1]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:32  */
  assign n959_o = sync_output[0]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:46  */
  assign n960_o = i_dir[0]; // extract
  /* ./files_for_tt/gpio_separate.vhdl:70:50  */
  assign n961_o = ~n960_o;
  /* ./files_for_tt/gpio_separate.vhdl:70:36  */
  assign n962_o = n961_o ? n959_o : n963_o;
  /* ./files_for_tt/gpio_separate.vhdl:71:28  */
  assign n963_o = i_wdata[0]; // extract
  assign n964_o = {i_gpi, n942_o};
  /* ./files_for_tt/gpio_separate.vhdl:49:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n965_q <= 8'b00000000;
    else
      n965_q <= sync_next;
  /* ./files_for_tt/gpio_separate.vhdl:49:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n966_q <= 4'b0000;
    else
      n966_q <= data_next;
  /* ./files_for_tt/gpio_separate.vhdl:46:5  */
  assign n967_o = {n947_o, n952_o, n957_o, n962_o};
endmodule

module timer_counter_pwm_2_51aa648633bc9ff19a580c0e4db0052dd92134a9
  (input  clk,
   input  rst,
   input  i_ctl_ctr_en,
   input  i_ctl_ctr_up_down,
   input  i_ctl_ctr_en_pwm,
   input  i_ctl_ctr_en_capt,
   input  i_ctl_ctr_rst_on_top,
   input  [7:0] i_top,
   input  [7:0] i_clk_divisor,
   input  [31:0] i_pwm_tops,
   input  [7:0] i_capt_ctl,
   input  [7:0] i_capture,
   output [7:0] o_timer,
   output [3:0] o_pwm,
   output o_capture_valid,
   output [2:0] o_capture_idx);
  wire [4:0] n663_o;
  reg [7:0] timer_reg;
  reg [7:0] timer_next;
  reg timer_en;
  reg [7:0] prescaler_reg;
  reg [7:0] prescaler_next;
  reg timer_should_update;
  reg [3:0] turn_on_pwm;
  reg [15:0] capt_sync_reg;
  reg [15:0] capt_sync_next;
  reg [7:0] i_capture_synced;
  reg [7:0] capt_reg;
  reg [7:0] capt_next;
  reg [7:0] capt_edge;
  reg [2:0] capt_idx;
  reg capt_valid;
  reg [3:0] pwm_reg;
  reg [3:0] pwm_next;
  wire n689_o;
  wire n707_o;
  wire n709_o;
  wire n710_o;
  wire n711_o;
  wire [7:0] n712_o;
  wire [7:0] n714_o;
  wire n715_o;
  wire n716_o;
  wire [7:0] n717_o;
  wire [7:0] n719_o;
  wire n720_o;
  wire [7:0] n722_o;
  wire [7:0] n724_o;
  wire [7:0] n726_o;
  wire n727_o;
  wire n728_o;
  wire n730_o;
  wire n731_o;
  wire n732_o;
  wire [7:0] n735_o;
  wire n736_o;
  wire n737_o;
  wire n739_o;
  wire n740_o;
  wire n741_o;
  wire [7:0] n744_o;
  wire n745_o;
  wire n746_o;
  wire n748_o;
  wire n749_o;
  wire n750_o;
  wire [7:0] n753_o;
  wire n754_o;
  wire n755_o;
  wire n757_o;
  wire n758_o;
  wire n759_o;
  wire n761_o;
  wire n762_o;
  wire n763_o;
  wire n764_o;
  wire n765_o;
  wire n766_o;
  wire n767_o;
  wire n768_o;
  wire n769_o;
  wire n770_o;
  wire n771_o;
  wire n772_o;
  wire n773_o;
  wire n774_o;
  wire n775_o;
  wire n776_o;
  wire n777_o;
  wire n778_o;
  wire n779_o;
  wire n780_o;
  wire n781_o;
  wire n782_o;
  wire n783_o;
  wire n784_o;
  wire n785_o;
  wire n786_o;
  wire n787_o;
  wire n788_o;
  wire n789_o;
  wire n790_o;
  wire n791_o;
  wire n792_o;
  wire n793_o;
  wire n794_o;
  wire n795_o;
  wire n796_o;
  wire n797_o;
  wire n798_o;
  wire n799_o;
  wire n800_o;
  wire n801_o;
  wire n802_o;
  wire n803_o;
  wire n804_o;
  wire n805_o;
  wire n806_o;
  wire n807_o;
  wire n808_o;
  wire n809_o;
  wire n810_o;
  wire n811_o;
  wire n812_o;
  wire n813_o;
  wire n814_o;
  wire n815_o;
  wire n816_o;
  wire n817_o;
  wire n818_o;
  wire n819_o;
  wire n820_o;
  wire n821_o;
  wire n822_o;
  wire n823_o;
  wire n824_o;
  wire n825_o;
  wire n826_o;
  wire n827_o;
  wire n828_o;
  wire n829_o;
  wire n830_o;
  wire n831_o;
  wire n832_o;
  wire n833_o;
  wire n834_o;
  wire n835_o;
  wire n836_o;
  wire n837_o;
  wire n838_o;
  wire n839_o;
  wire n840_o;
  wire n841_o;
  wire n842_o;
  wire n843_o;
  wire n844_o;
  wire n845_o;
  wire n846_o;
  wire n847_o;
  wire n848_o;
  wire n849_o;
  wire n850_o;
  wire n851_o;
  wire n852_o;
  wire n853_o;
  wire n854_o;
  wire n855_o;
  wire n856_o;
  wire n858_o;
  wire n862_o;
  wire n864_o;
  wire [2:0] n868_o;
  wire n871_o;
  wire n872_o;
  wire [2:0] n875_o;
  wire n877_o;
  wire n878_o;
  wire [2:0] n881_o;
  wire n883_o;
  wire n884_o;
  wire [2:0] n887_o;
  wire n889_o;
  wire n890_o;
  wire [2:0] n893_o;
  wire n895_o;
  wire n896_o;
  wire [2:0] n899_o;
  wire n901_o;
  wire n902_o;
  wire [2:0] n905_o;
  wire n907_o;
  wire n909_o;
  wire n910_o;
  wire [7:0] n911_o;
  reg [7:0] n912_q;
  wire [7:0] n913_o;
  reg [7:0] n914_q;
  wire [3:0] n915_o;
  reg [15:0] n916_q;
  wire [15:0] n917_o;
  wire [7:0] n918_o;
  reg [7:0] n919_q;
  wire [7:0] n920_o;
  wire [7:0] n921_o;
  reg [3:0] n922_q;
  wire [3:0] n923_o;
  assign o_timer = timer_reg; //(module output)
  assign o_pwm = pwm_reg; //(module output)
  assign o_capture_valid = n910_o; //(module output)
  assign o_capture_idx = capt_idx; //(module output)
  /* ./files_for_tt/spi_slave.vhdl:110:17  */
  assign n663_o = {i_ctl_ctr_rst_on_top, i_ctl_ctr_en_capt, i_ctl_ctr_en_pwm, i_ctl_ctr_up_down, i_ctl_ctr_en};
  /* ./files_for_tt/timer_counter_pwm.vhdl:50:10  */
  always @*
    timer_reg = n912_q; // (isignal)
  initial
    timer_reg = 8'b00000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:50:21  */
  always @*
    timer_next = n712_o; // (isignal)
  initial
    timer_next = 8'b00000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:51:10  */
  always @*
    timer_en = n707_o; // (isignal)
  initial
    timer_en = 1'b0;
  /* ./files_for_tt/timer_counter_pwm.vhdl:52:10  */
  always @*
    prescaler_reg = n914_q; // (isignal)
  initial
    prescaler_reg = 8'b00000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:52:25  */
  always @*
    prescaler_next = n722_o; // (isignal)
  initial
    prescaler_next = 8'b00000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:53:10  */
  always @*
    timer_should_update = n720_o; // (isignal)
  initial
    timer_should_update = 1'b0;
  /* ./files_for_tt/timer_counter_pwm.vhdl:56:10  */
  always @*
    turn_on_pwm = n915_o; // (isignal)
  initial
    turn_on_pwm = 4'b0000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:59:10  */
  always @*
    capt_sync_reg = n916_q; // (isignal)
  initial
    capt_sync_reg = 16'b0000000000000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:59:25  */
  always @*
    capt_sync_next = n917_o; // (isignal)
  initial
    capt_sync_next = 16'b0000000000000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:61:10  */
  always @*
    i_capture_synced = n918_o; // (isignal)
  initial
    i_capture_synced = 8'b00000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:62:10  */
  always @*
    capt_reg = n919_q; // (isignal)
  initial
    capt_reg = 8'b00000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:62:20  */
  always @*
    capt_next = n920_o; // (isignal)
  initial
    capt_next = 8'b00000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:63:10  */
  always @*
    capt_edge = n921_o; // (isignal)
  initial
    capt_edge = 8'b00000000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:65:10  */
  always @*
    capt_idx = n905_o; // (isignal)
  initial
    capt_idx = 3'b000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:66:10  */
  always @*
    capt_valid = n907_o; // (isignal)
  initial
    capt_valid = 1'b0;
  /* ./files_for_tt/timer_counter_pwm.vhdl:68:10  */
  always @*
    pwm_reg = n922_q; // (isignal)
  initial
    pwm_reg = 4'b0000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:68:19  */
  always @*
    pwm_next = n923_o; // (isignal)
  initial
    pwm_next = 4'b0000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:86:25  */
  assign n689_o = timer_should_update & timer_en;
  /* ./files_for_tt/timer_counter_pwm.vhdl:99:21  */
  assign n707_o = n663_o[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:101:44  */
  assign n709_o = n663_o[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:101:79  */
  assign n710_o = timer_reg == i_top;
  /* ./files_for_tt/timer_counter_pwm.vhdl:101:65  */
  assign n711_o = n710_o & n709_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:101:33  */
  assign n712_o = n711_o ? 8'b00000000 : n717_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:102:27  */
  assign n714_o = timer_reg + 8'b00000001;
  /* ./files_for_tt/timer_counter_pwm.vhdl:102:42  */
  assign n715_o = n663_o[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:102:54  */
  assign n716_o = ~n715_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:101:97  */
  assign n717_o = n716_o ? n714_o : n719_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:103:27  */
  assign n719_o = timer_reg - 8'b00000001;
  /* ./files_for_tt/timer_counter_pwm.vhdl:105:40  */
  assign n720_o = prescaler_reg == i_clk_divisor;
  /* ./files_for_tt/timer_counter_pwm.vhdl:106:37  */
  assign n722_o = timer_should_update ? 8'b00000000 : n724_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:107:35  */
  assign n724_o = prescaler_reg + 8'b00000001;
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:64  */
  assign n726_o = i_pwm_tops[31:24]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:42  */
  assign n727_o = $unsigned(timer_reg) >= $unsigned(n726_o);
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:27  */
  assign n728_o = n727_o ? 1'b0 : 1'b1;
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:31  */
  assign n730_o = turn_on_pwm[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:46  */
  assign n731_o = n663_o[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:35  */
  assign n732_o = n731_o ? n730_o : 1'b0;
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:64  */
  assign n735_o = i_pwm_tops[23:16]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:42  */
  assign n736_o = $unsigned(timer_reg) >= $unsigned(n735_o);
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:27  */
  assign n737_o = n736_o ? 1'b0 : 1'b1;
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:31  */
  assign n739_o = turn_on_pwm[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:46  */
  assign n740_o = n663_o[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:35  */
  assign n741_o = n740_o ? n739_o : 1'b0;
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:64  */
  assign n744_o = i_pwm_tops[15:8]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:42  */
  assign n745_o = $unsigned(timer_reg) >= $unsigned(n744_o);
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:27  */
  assign n746_o = n745_o ? 1'b0 : 1'b1;
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:31  */
  assign n748_o = turn_on_pwm[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:46  */
  assign n749_o = n663_o[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:35  */
  assign n750_o = n749_o ? n748_o : 1'b0;
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:64  */
  assign n753_o = i_pwm_tops[7:0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:42  */
  assign n754_o = $unsigned(timer_reg) >= $unsigned(n753_o);
  /* ./files_for_tt/timer_counter_pwm.vhdl:113:27  */
  assign n755_o = n754_o ? 1'b0 : 1'b1;
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:31  */
  assign n757_o = turn_on_pwm[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:46  */
  assign n758_o = n663_o[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:115:35  */
  assign n759_o = n758_o ? n757_o : 1'b0;
  /* ./files_for_tt/timer_counter_pwm.vhdl:123:40  */
  assign n761_o = i_capture[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:125:74  */
  assign n762_o = capt_sync_reg[14]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:127:46  */
  assign n763_o = capt_sync_reg[15]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:123:40  */
  assign n764_o = i_capture[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:125:74  */
  assign n765_o = capt_sync_reg[12]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:127:46  */
  assign n766_o = capt_sync_reg[13]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:123:40  */
  assign n767_o = i_capture[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:125:74  */
  assign n768_o = capt_sync_reg[10]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:127:46  */
  assign n769_o = capt_sync_reg[11]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:123:40  */
  assign n770_o = i_capture[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:125:74  */
  assign n771_o = capt_sync_reg[8]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:127:46  */
  assign n772_o = capt_sync_reg[9]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:123:40  */
  assign n773_o = i_capture[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:125:74  */
  assign n774_o = capt_sync_reg[6]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:127:46  */
  assign n775_o = capt_sync_reg[7]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:123:40  */
  assign n776_o = i_capture[5]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:125:74  */
  assign n777_o = capt_sync_reg[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:127:46  */
  assign n778_o = capt_sync_reg[5]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:123:40  */
  assign n779_o = i_capture[6]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:125:74  */
  assign n780_o = capt_sync_reg[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:127:46  */
  assign n781_o = capt_sync_reg[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:123:40  */
  assign n782_o = i_capture[7]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:125:74  */
  assign n783_o = capt_sync_reg[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:127:46  */
  assign n784_o = capt_sync_reg[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:139:37  */
  assign n785_o = i_capture_synced[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:32  */
  assign n786_o = i_capt_ctl[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:48  */
  assign n787_o = capt_reg[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:36  */
  assign n788_o = n786_o ^ n787_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:73  */
  assign n789_o = i_capt_ctl[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:59  */
  assign n790_o = ~n789_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:91  */
  assign n791_o = capt_next[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:78  */
  assign n792_o = n790_o ^ n791_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:53  */
  assign n793_o = n788_o & n792_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:139:37  */
  assign n794_o = i_capture_synced[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:32  */
  assign n795_o = i_capt_ctl[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:48  */
  assign n796_o = capt_reg[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:36  */
  assign n797_o = n795_o ^ n796_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:73  */
  assign n798_o = i_capt_ctl[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:59  */
  assign n799_o = ~n798_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:91  */
  assign n800_o = capt_next[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:78  */
  assign n801_o = n799_o ^ n800_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:53  */
  assign n802_o = n797_o & n801_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:139:37  */
  assign n803_o = i_capture_synced[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:32  */
  assign n804_o = i_capt_ctl[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:48  */
  assign n805_o = capt_reg[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:36  */
  assign n806_o = n804_o ^ n805_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:73  */
  assign n807_o = i_capt_ctl[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:59  */
  assign n808_o = ~n807_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:91  */
  assign n809_o = capt_next[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:78  */
  assign n810_o = n808_o ^ n809_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:53  */
  assign n811_o = n806_o & n810_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:139:37  */
  assign n812_o = i_capture_synced[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:32  */
  assign n813_o = i_capt_ctl[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:48  */
  assign n814_o = capt_reg[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:36  */
  assign n815_o = n813_o ^ n814_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:73  */
  assign n816_o = i_capt_ctl[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:59  */
  assign n817_o = ~n816_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:91  */
  assign n818_o = capt_next[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:78  */
  assign n819_o = n817_o ^ n818_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:53  */
  assign n820_o = n815_o & n819_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:139:37  */
  assign n821_o = i_capture_synced[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:32  */
  assign n822_o = i_capt_ctl[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:48  */
  assign n823_o = capt_reg[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:36  */
  assign n824_o = n822_o ^ n823_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:73  */
  assign n825_o = i_capt_ctl[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:59  */
  assign n826_o = ~n825_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:91  */
  assign n827_o = capt_next[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:78  */
  assign n828_o = n826_o ^ n827_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:53  */
  assign n829_o = n824_o & n828_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:139:37  */
  assign n830_o = i_capture_synced[5]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:32  */
  assign n831_o = i_capt_ctl[5]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:48  */
  assign n832_o = capt_reg[5]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:36  */
  assign n833_o = n831_o ^ n832_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:73  */
  assign n834_o = i_capt_ctl[5]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:59  */
  assign n835_o = ~n834_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:91  */
  assign n836_o = capt_next[5]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:78  */
  assign n837_o = n835_o ^ n836_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:53  */
  assign n838_o = n833_o & n837_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:139:37  */
  assign n839_o = i_capture_synced[6]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:32  */
  assign n840_o = i_capt_ctl[6]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:48  */
  assign n841_o = capt_reg[6]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:36  */
  assign n842_o = n840_o ^ n841_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:73  */
  assign n843_o = i_capt_ctl[6]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:59  */
  assign n844_o = ~n843_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:91  */
  assign n845_o = capt_next[6]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:78  */
  assign n846_o = n844_o ^ n845_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:53  */
  assign n847_o = n842_o & n846_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:139:37  */
  assign n848_o = i_capture_synced[7]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:32  */
  assign n849_o = i_capt_ctl[7]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:48  */
  assign n850_o = capt_reg[7]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:36  */
  assign n851_o = n849_o ^ n850_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:73  */
  assign n852_o = i_capt_ctl[7]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:59  */
  assign n853_o = ~n852_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:91  */
  assign n854_o = capt_next[7]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:78  */
  assign n855_o = n853_o ^ n854_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:140:53  */
  assign n856_o = n851_o & n855_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:19  */
  assign n858_o = capt_edge[0]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n862_o = n858_o ? 1'b1 : 1'b0;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:19  */
  assign n864_o = capt_edge[1]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n868_o = n864_o ? 3'b001 : 3'b000;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n871_o = n864_o ? 1'b1 : n862_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:19  */
  assign n872_o = capt_edge[2]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n875_o = n872_o ? 3'b010 : n868_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n877_o = n872_o ? 1'b1 : n871_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:19  */
  assign n878_o = capt_edge[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n881_o = n878_o ? 3'b011 : n875_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n883_o = n878_o ? 1'b1 : n877_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:19  */
  assign n884_o = capt_edge[4]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n887_o = n884_o ? 3'b100 : n881_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n889_o = n884_o ? 1'b1 : n883_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:19  */
  assign n890_o = capt_edge[5]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n893_o = n890_o ? 3'b101 : n887_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n895_o = n890_o ? 1'b1 : n889_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:19  */
  assign n896_o = capt_edge[6]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n899_o = n896_o ? 3'b110 : n893_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n901_o = n896_o ? 1'b1 : n895_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:19  */
  assign n902_o = capt_edge[7]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n905_o = n902_o ? 3'b111 : n899_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:149:7  */
  assign n907_o = n902_o ? 1'b1 : n901_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:158:43  */
  assign n909_o = n663_o[3]; // extract
  /* ./files_for_tt/timer_counter_pwm.vhdl:158:33  */
  assign n910_o = capt_valid & n909_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:80:5  */
  assign n911_o = n689_o ? timer_next : timer_reg;
  /* ./files_for_tt/timer_counter_pwm.vhdl:80:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n912_q <= 8'b00000000;
    else
      n912_q <= n911_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:80:5  */
  assign n913_o = timer_en ? prescaler_next : prescaler_reg;
  /* ./files_for_tt/timer_counter_pwm.vhdl:80:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n914_q <= 8'b00000000;
    else
      n914_q <= n913_o;
  /* ./files_for_tt/timer_counter_pwm.vhdl:74:5  */
  assign n915_o = {n755_o, n746_o, n737_o, n728_o};
  /* ./files_for_tt/timer_counter_pwm.vhdl:80:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n916_q <= 16'b0000000000000000;
    else
      n916_q <= capt_sync_next;
  /* ./files_for_tt/timer_counter_pwm.vhdl:74:5  */
  assign n917_o = {n762_o, n761_o, n765_o, n764_o, n768_o, n767_o, n771_o, n770_o, n774_o, n773_o, n777_o, n776_o, n780_o, n779_o, n783_o, n782_o};
  assign n918_o = {n784_o, n781_o, n778_o, n775_o, n772_o, n769_o, n766_o, n763_o};
  /* ./files_for_tt/timer_counter_pwm.vhdl:80:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n919_q <= 8'b00000000;
    else
      n919_q <= capt_next;
  /* ./files_for_tt/timer_counter_pwm.vhdl:74:5  */
  assign n920_o = {n848_o, n839_o, n830_o, n821_o, n812_o, n803_o, n794_o, n785_o};
  assign n921_o = {n856_o, n847_o, n838_o, n829_o, n820_o, n811_o, n802_o, n793_o};
  /* ./files_for_tt/timer_counter_pwm.vhdl:80:5  */
  always @(posedge clk or posedge rst)
    if (rst)
      n922_q <= 4'b0000;
    else
      n922_q <= pwm_next;
  /* ./files_for_tt/timer_counter_pwm.vhdl:74:5  */
  assign n923_o = {n759_o, n750_o, n741_o, n732_o};
endmodule

module spi_slave_0a4a314244f8a6fd1be9196375a52cc72a4bba92
  (input  clk,
   input  arst,
   input  i_mclk,
   input  i_mosi,
   input  i_msel,
   input  i_load,
   input  [7:0] i_data,
   output o_miso,
   output o_ready,
   output o_valid,
   output [7:0] o_data);
  reg [7:0] i_data_deconstructed;
  reg [7:0] i_data_deconstructed_preshifted;
  reg [7:0] i_data_preshifted;
  reg [7:0] valid_reg;
  reg [7:0] valid_next;
  reg start_txn;
  reg txn_done;
  reg start_reg;
  reg start_next;
  reg start_rising_edge;
  reg busy_reg;
  reg busy_next;
  reg serial_data_out;
  reg [7:0] parallel_data_in;
  reg [7:0] parallel_data_out;
  wire [7:0] pipo_o_data;
  wire pipo_o_sdata;
  wire n605_o;
  wire n612_o;
  wire n613_o;
  wire n614_o;
  wire n615_o;
  wire n616_o;
  wire n617_o;
  wire n618_o;
  wire n619_o;
  wire [6:0] n623_o;
  wire n629_o;
  wire n630_o;
  wire n631_o;
  wire n632_o;
  wire n633_o;
  wire n634_o;
  wire n635_o;
  wire n636_o;
  wire n640_o;
  wire n641_o;
  wire n642_o;
  wire n643_o;
  wire n644_o;
  wire n645_o;
  wire n646_o;
  wire n647_o;
  wire n648_o;
  wire [6:0] n649_o;
  wire n650_o;
  wire n651_o;
  wire n652_o;
  wire n653_o;
  wire n654_o;
  wire n655_o;
  wire [7:0] n656_o;
  wire [7:0] n657_o;
  wire [7:0] n658_o;
  reg [7:0] n659_q;
  wire [7:0] n660_o;
  reg n661_q;
  reg n662_q;
  assign o_miso = n655_o; //(module output)
  assign o_ready = n653_o; //(module output)
  assign o_valid = txn_done; //(module output)
  assign o_data = parallel_data_out; //(module output)
  /* ./files_for_tt/spi_slave.vhdl:68:10  */
  always @*
    i_data_deconstructed = n656_o; // (isignal)
  initial
    i_data_deconstructed = 8'b00000000;
  /* ./files_for_tt/spi_slave.vhdl:69:10  */
  always @*
    i_data_deconstructed_preshifted = n657_o; // (isignal)
  initial
    i_data_deconstructed_preshifted = 8'b00000000;
  /* ./files_for_tt/spi_slave.vhdl:70:10  */
  always @*
    i_data_preshifted = n658_o; // (isignal)
  initial
    i_data_preshifted = 8'b00000000;
  /* ./files_for_tt/spi_slave.vhdl:71:10  */
  always @*
    valid_reg = n659_q; // (isignal)
  initial
    valid_reg = 8'b00000000;
  /* ./files_for_tt/spi_slave.vhdl:71:21  */
  always @*
    valid_next = n660_o; // (isignal)
  initial
    valid_next = 8'b00000000;
  /* ./files_for_tt/spi_slave.vhdl:73:10  */
  always @*
    start_txn = n641_o; // (isignal)
  initial
    start_txn = 1'b0;
  /* ./files_for_tt/spi_slave.vhdl:74:10  */
  always @*
    txn_done = n646_o; // (isignal)
  initial
    txn_done = 1'b0;
  /* ./files_for_tt/spi_slave.vhdl:75:10  */
  always @*
    start_reg = n661_q; // (isignal)
  initial
    start_reg = 1'b0;
  /* ./files_for_tt/spi_slave.vhdl:75:21  */
  always @*
    start_next = start_txn; // (isignal)
  initial
    start_next = 1'b0;
  /* ./files_for_tt/spi_slave.vhdl:76:10  */
  always @*
    start_rising_edge = n645_o; // (isignal)
  initial
    start_rising_edge = 1'b0;
  /* ./files_for_tt/spi_slave.vhdl:78:10  */
  always @*
    busy_reg = n662_q; // (isignal)
  initial
    busy_reg = 1'b0;
  /* ./files_for_tt/spi_slave.vhdl:78:20  */
  always @*
    busy_next = n650_o; // (isignal)
  initial
    busy_next = 1'b0;
  /* ./files_for_tt/spi_slave.vhdl:80:10  */
  always @*
    serial_data_out = pipo_o_sdata; // (isignal)
  initial
    serial_data_out = 1'b0;
  /* ./files_for_tt/spi_slave.vhdl:81:10  */
  always @*
    parallel_data_in = i_data_preshifted; // (isignal)
  initial
    parallel_data_in = 8'b00000000;
  /* ./files_for_tt/spi_slave.vhdl:82:10  */
  always @*
    parallel_data_out = pipo_o_data; // (isignal)
  initial
    parallel_data_out = 8'b00000000;
  /* ./files_for_tt/spi_slave.vhdl:101:3  */
  pipo_7b7b80ea99975bfa51cb6ef0ceb50ca4697ae2b8 pipo (
    .clk(i_mclk),
    .rst(arst),
    .en(n605_o),
    .i_load(i_load),
    .i_data(parallel_data_in),
    .i_sdata(i_mosi),
    .o_data(pipo_o_data),
    .o_sdata(pipo_o_sdata));
  /* ./files_for_tt/spi_slave.vhdl:105:13  */
  assign n605_o = ~i_msel;
  /* ./files_for_tt/spi_slave.vhdl:129:70  */
  assign n612_o = i_data[0]; // extract
  /* ./files_for_tt/spi_slave.vhdl:129:70  */
  assign n613_o = i_data[1]; // extract
  /* ./files_for_tt/spi_slave.vhdl:129:70  */
  assign n614_o = i_data[2]; // extract
  /* ./files_for_tt/spi_slave.vhdl:129:70  */
  assign n615_o = i_data[3]; // extract
  /* ./files_for_tt/spi_slave.vhdl:129:70  */
  assign n616_o = i_data[4]; // extract
  /* ./files_for_tt/spi_slave.vhdl:129:70  */
  assign n617_o = i_data[5]; // extract
  /* ./files_for_tt/spi_slave.vhdl:129:70  */
  assign n618_o = i_data[6]; // extract
  /* ./files_for_tt/spi_slave.vhdl:129:70  */
  assign n619_o = i_data[7]; // extract
  /* ./files_for_tt/spi_slave.vhdl:135:101  */
  assign n623_o = i_data_deconstructed[7:1]; // extract
  /* ./files_for_tt/spi_slave.vhdl:147:95  */
  assign n629_o = i_data_deconstructed_preshifted[7]; // extract
  /* ./files_for_tt/spi_slave.vhdl:147:95  */
  assign n630_o = i_data_deconstructed_preshifted[6]; // extract
  /* ./files_for_tt/spi_slave.vhdl:147:95  */
  assign n631_o = i_data_deconstructed_preshifted[5]; // extract
  /* ./files_for_tt/spi_slave.vhdl:147:95  */
  assign n632_o = i_data_deconstructed_preshifted[4]; // extract
  /* ./files_for_tt/spi_slave.vhdl:147:95  */
  assign n633_o = i_data_deconstructed_preshifted[3]; // extract
  /* ./files_for_tt/spi_slave.vhdl:147:95  */
  assign n634_o = i_data_deconstructed_preshifted[2]; // extract
  /* ./files_for_tt/spi_slave.vhdl:147:95  */
  assign n635_o = i_data_deconstructed_preshifted[1]; // extract
  /* ./files_for_tt/spi_slave.vhdl:147:95  */
  assign n636_o = i_data_deconstructed_preshifted[0]; // extract
  /* ./files_for_tt/spi_slave.vhdl:161:16  */
  assign n640_o = ~i_msel;
  /* ./files_for_tt/spi_slave.vhdl:161:27  */
  assign n641_o = n640_o | i_load;
  /* ./files_for_tt/spi_slave.vhdl:165:24  */
  assign n642_o = ~start_reg;
  /* ./files_for_tt/spi_slave.vhdl:165:43  */
  assign n643_o = ~busy_reg;
  /* ./files_for_tt/spi_slave.vhdl:165:38  */
  assign n644_o = n642_o & n643_o;
  /* ./files_for_tt/spi_slave.vhdl:165:57  */
  assign n645_o = n644_o & start_next;
  /* ./files_for_tt/spi_slave.vhdl:167:24  */
  assign n646_o = valid_reg[7]; // extract
  /* ./files_for_tt/spi_slave.vhdl:168:52  */
  assign n647_o = start_txn & txn_done;
  /* ./files_for_tt/spi_slave.vhdl:168:38  */
  assign n648_o = start_rising_edge | n647_o;
  /* ./files_for_tt/spi_slave.vhdl:169:65  */
  assign n649_o = valid_reg[6:0]; // extract
  /* ./files_for_tt/spi_slave.vhdl:172:26  */
  assign n650_o = txn_done ? start_txn : n651_o;
  /* ./files_for_tt/spi_slave.vhdl:172:46  */
  assign n651_o = busy_reg ? busy_reg : start_txn;
  /* ./files_for_tt/spi_slave.vhdl:177:14  */
  assign n652_o = ~busy_reg;
  /* ./files_for_tt/spi_slave.vhdl:177:27  */
  assign n653_o = n652_o | txn_done;
  /* ./files_for_tt/spi_slave.vhdl:183:33  */
  assign n654_o = i_data_deconstructed[0]; // extract
  /* ./files_for_tt/spi_slave.vhdl:183:61  */
  assign n655_o = i_load ? n654_o : serial_data_out;
  assign n656_o = {n612_o, n613_o, n614_o, n615_o, n616_o, n617_o, n618_o, n619_o};
  assign n657_o = {1'b0, n623_o};
  assign n658_o = {n636_o, n635_o, n634_o, n633_o, n632_o, n631_o, n630_o, n629_o};
  /* ./files_for_tt/spi_slave.vhdl:93:5  */
  always @(posedge i_mclk or posedge arst)
    if (arst)
      n659_q <= 8'b00000000;
    else
      n659_q <= valid_next;
  /* ./files_for_tt/spi_slave.vhdl:89:5  */
  assign n660_o = {n649_o, n648_o};
  /* ./files_for_tt/spi_slave.vhdl:93:5  */
  always @(posedge i_mclk or posedge arst)
    if (arst)
      n661_q <= 1'b0;
    else
      n661_q <= start_next;
  /* ./files_for_tt/spi_slave.vhdl:93:5  */
  always @(posedge i_mclk or posedge arst)
    if (arst)
      n662_q <= 1'b0;
    else
      n662_q <= busy_next;
endmodule

module tt_system_1_8_1_2_8_8_8_4_8_2_4_2_8_dcce328dea092d922b28c6adbd91f0e220ac4277
  (input  clk,
   input  arst,
   input  i_mclk,
   input  i_mosi,
   input  i_msel,
   input  [7:0] i_capture,
   input  [3:0] i_gpi,
   output o_miso,
   output [3:0] o_pwm,
   output [3:0] o_gpo,
   output [3:0] o_out_en,
   output o_lfsr_high);
  reg spi_i_load;
  reg [7:0] spi_i_data;
  reg spi_o_ready;
  reg spi_o_valid;
  reg [1:0] spi_o_valid_sync_reg;
  reg [1:0] spi_o_valid_sync_next;
  reg spi_o_valid_synced;
  reg spi_o_valid_reg;
  reg spi_o_valid_next;
  reg spi_o_valid_rising;
  reg [7:0] spi_o_data;
  reg [7:0] spi_o_data_slv;
  reg [7:0] ic_address_reg;
  localparam [7:0] n70_o = 8'b00000000;
  reg [7:0] ic_address_next;
  reg ic_address_en;
  reg [30:0] ic_address_reg_nat;
  reg ic_addr_loaded_reg;
  reg ic_addr_loaded_next;
  reg ic_access_mode_reg;
  reg ic_access_mode_next;
  reg [175:0] regmap_reg;
  localparam [175:0] n78_o = 176'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  reg [175:0] regmap_next;
  reg [21:0] regmap_en;
  reg [21:0] regmap_en_demuxed;
  reg regmap_en_cond;
  reg [7:0] regmap_rdata;
  wire [4:0] timer_i_ctl;
  reg [7:0] timer_i_top;
  reg [7:0] timer_i_clk_divisor;
  reg [7:0] timer_o_timer;
  reg [31:0] timer_i_pwm_tops;
  reg [7:0] timer_i_capt_ctl;
  reg timer_o_capture_valid;
  reg [2:0] timer_o_capture_idx;
  reg [3:0] gpio_i_dir;
  reg [3:0] gpio_i_wdata;
  reg [3:0] gpio_o_rdata;
  reg [7:0] lfsr_i_poly;
  reg lfsr_i_en;
  reg lfsr_i_serial;
  reg lfsr_o_serial;
  reg lfsr_i_load;
  reg [7:0] lfsr_i_data;
  wire n105_o;
  wire [7:0] n106_o;
  wire [7:0] n107_o;
  wire [7:0] n108_o;
  wire n109_o;
  wire [7:0] n110_o;
  wire [7:0] n111_o;
  wire [7:0] n112_o;
  wire n113_o;
  wire [7:0] n114_o;
  wire [7:0] n115_o;
  wire [7:0] n116_o;
  wire n117_o;
  wire [7:0] n118_o;
  wire [7:0] n119_o;
  wire [7:0] n120_o;
  wire n121_o;
  wire [7:0] n122_o;
  wire [7:0] n123_o;
  wire [7:0] n124_o;
  wire n125_o;
  wire [7:0] n126_o;
  wire [7:0] n127_o;
  wire [7:0] n128_o;
  wire n129_o;
  wire [7:0] n130_o;
  wire [7:0] n131_o;
  wire [7:0] n132_o;
  wire n133_o;
  wire [7:0] n134_o;
  wire [7:0] n135_o;
  wire [7:0] n136_o;
  wire n137_o;
  wire [7:0] n138_o;
  wire [7:0] n139_o;
  wire [7:0] n140_o;
  wire n141_o;
  wire [7:0] n142_o;
  wire [7:0] n143_o;
  wire [7:0] n144_o;
  wire n145_o;
  wire [7:0] n146_o;
  wire [7:0] n147_o;
  wire [7:0] n148_o;
  wire n149_o;
  wire [7:0] n150_o;
  wire [7:0] n151_o;
  wire [7:0] n152_o;
  wire n153_o;
  wire [7:0] n154_o;
  wire [7:0] n155_o;
  wire [7:0] n156_o;
  wire n157_o;
  wire [7:0] n158_o;
  wire [7:0] n159_o;
  wire [7:0] n160_o;
  wire n161_o;
  wire [7:0] n162_o;
  wire [7:0] n163_o;
  wire [7:0] n164_o;
  wire n165_o;
  wire [7:0] n166_o;
  wire [7:0] n167_o;
  wire [7:0] n168_o;
  wire n169_o;
  wire [7:0] n170_o;
  wire [7:0] n171_o;
  wire [7:0] n172_o;
  wire n173_o;
  wire [7:0] n174_o;
  wire [7:0] n175_o;
  wire [7:0] n176_o;
  wire n177_o;
  wire [7:0] n178_o;
  wire [7:0] n179_o;
  wire [7:0] n180_o;
  wire n181_o;
  wire [7:0] n182_o;
  wire [7:0] n183_o;
  wire [7:0] n184_o;
  wire n185_o;
  wire [7:0] n186_o;
  wire [7:0] n187_o;
  wire [7:0] n188_o;
  wire n189_o;
  wire [7:0] n190_o;
  wire [7:0] n191_o;
  wire [7:0] n192_o;
  wire [175:0] n198_o;
  wire spi_slave_inst_o_miso;
  wire spi_slave_inst_o_ready;
  wire spi_slave_inst_o_valid;
  wire [7:0] spi_slave_inst_o_data;
  wire [7:0] timer_counter_inst_o_timer;
  wire [3:0] timer_counter_inst_o_pwm;
  wire timer_counter_inst_o_capture_valid;
  wire [2:0] timer_counter_inst_o_capture_idx;
  wire n217_o;
  wire n218_o;
  wire n219_o;
  wire n220_o;
  wire n221_o;
  wire [3:0] gpio_inst_o_rdata;
  wire [3:0] gpio_inst_o_gpo;
  wire [3:0] gpio_inst_o_out_en;
  wire lfsr_inst_o_serial;
  wire [7:0] lfsr_inst_o_data;
  wire n231_o;
  wire n232_o;
  wire n233_o;
  wire n234_o;
  wire [6:0] n248_o;
  wire n249_o;
  wire [30:0] n250_o;
  wire [30:0] n251_o;
  wire n253_o;
  wire n254_o;
  wire n255_o;
  wire n256_o;
  wire n257_o;
  wire n258_o;
  wire n259_o;
  wire [4:0] n260_o;
  wire [4:0] n262_o;
  wire n278_o;
  wire n279_o;
  wire n280_o;
  wire [30:0] n283_o;
  wire [31:0] n284_o;
  wire n286_o;
  wire n288_o;
  localparam [21:0] n289_o = 22'b0000000000000000000000;
  wire [30:0] n291_o;
  wire [31:0] n292_o;
  wire n294_o;
  wire n295_o;
  wire n296_o;
  wire [30:0] n298_o;
  wire [31:0] n299_o;
  wire n301_o;
  wire n302_o;
  wire n303_o;
  wire [30:0] n305_o;
  wire [31:0] n306_o;
  wire n308_o;
  wire n309_o;
  wire n310_o;
  wire [30:0] n312_o;
  wire [31:0] n313_o;
  wire n315_o;
  wire n316_o;
  wire n317_o;
  wire [30:0] n319_o;
  wire [31:0] n320_o;
  wire n322_o;
  wire n323_o;
  wire n324_o;
  wire [30:0] n326_o;
  wire [31:0] n327_o;
  wire n329_o;
  wire n330_o;
  wire n331_o;
  wire [30:0] n333_o;
  wire [31:0] n334_o;
  wire n336_o;
  wire n337_o;
  wire n338_o;
  wire [30:0] n340_o;
  wire [31:0] n341_o;
  wire n343_o;
  wire n344_o;
  wire n345_o;
  wire [30:0] n347_o;
  wire [31:0] n348_o;
  wire n350_o;
  wire n351_o;
  wire n352_o;
  wire [30:0] n354_o;
  wire [31:0] n355_o;
  wire n357_o;
  wire n358_o;
  wire n359_o;
  wire [30:0] n361_o;
  wire [31:0] n362_o;
  wire n364_o;
  wire n365_o;
  wire n366_o;
  wire [30:0] n368_o;
  wire [31:0] n369_o;
  wire n371_o;
  wire n372_o;
  wire n373_o;
  wire [30:0] n375_o;
  wire [31:0] n376_o;
  wire n378_o;
  wire n379_o;
  wire n380_o;
  wire [30:0] n382_o;
  wire [31:0] n383_o;
  wire n385_o;
  wire n386_o;
  wire n387_o;
  wire [30:0] n389_o;
  wire [31:0] n390_o;
  wire n392_o;
  wire n393_o;
  wire n394_o;
  wire [30:0] n396_o;
  wire [31:0] n397_o;
  wire n399_o;
  wire n400_o;
  wire n401_o;
  wire [30:0] n403_o;
  wire [31:0] n404_o;
  wire n406_o;
  wire n407_o;
  wire n408_o;
  wire [30:0] n410_o;
  wire [31:0] n411_o;
  wire n413_o;
  wire n414_o;
  wire n415_o;
  wire [30:0] n417_o;
  wire [31:0] n418_o;
  wire n420_o;
  wire n421_o;
  wire n422_o;
  wire [30:0] n424_o;
  wire [31:0] n425_o;
  wire n427_o;
  wire n428_o;
  wire n429_o;
  wire n430_o;
  wire [30:0] n431_o;
  wire [31:0] n432_o;
  wire n434_o;
  wire n435_o;
  wire n437_o;
  wire n438_o;
  wire n439_o;
  wire n440_o;
  wire n442_o;
  wire n443_o;
  wire n444_o;
  wire n445_o;
  wire n446_o;
  wire n447_o;
  wire n448_o;
  wire n449_o;
  wire n450_o;
  wire [30:0] n451_o;
  wire [31:0] n452_o;
  wire n454_o;
  wire n455_o;
  wire [30:0] n457_o;
  wire [31:0] n458_o;
  wire n460_o;
  wire n461_o;
  wire [30:0] n463_o;
  wire [31:0] n464_o;
  wire n466_o;
  wire n467_o;
  wire [30:0] n469_o;
  wire [31:0] n470_o;
  wire n472_o;
  wire n473_o;
  wire [30:0] n475_o;
  wire [31:0] n476_o;
  wire n478_o;
  wire n479_o;
  wire [30:0] n481_o;
  wire [31:0] n482_o;
  wire n484_o;
  wire n485_o;
  wire [30:0] n487_o;
  wire [31:0] n488_o;
  wire n490_o;
  wire n491_o;
  wire [30:0] n493_o;
  wire [31:0] n494_o;
  wire n496_o;
  wire n497_o;
  wire n499_o;
  wire n500_o;
  wire n501_o;
  wire n502_o;
  wire n503_o;
  wire [7:0] n504_o;
  wire [7:0] n505_o;
  wire [7:0] n506_o;
  wire [7:0] n507_o;
  wire [7:0] n508_o;
  wire [7:0] n509_o;
  wire [7:0] n510_o;
  wire [3:0] n511_o;
  wire [3:0] n512_o;
  wire [7:0] n513_o;
  wire n514_o;
  wire n515_o;
  wire [7:0] n516_o;
  reg [1:0] n517_q;
  wire [1:0] n518_o;
  reg n519_q;
  wire [7:0] n520_o;
  reg [7:0] n521_q;
  wire n522_o;
  wire [7:0] n523_o;
  reg n524_q;
  reg n525_q;
  reg [175:0] n526_q;
  wire [3:0] n527_o;
  wire [175:0] n528_o;
  wire [21:0] n529_o;
  wire [21:0] n530_o;
  wire [4:0] n531_o;
  wire [31:0] n532_o;
  wire [7:0] n533_o;
  wire [7:0] n534_o;
  wire [7:0] n535_o;
  wire [7:0] n536_o;
  wire [7:0] n537_o;
  wire [7:0] n538_o;
  wire [7:0] n539_o;
  wire [7:0] n540_o;
  wire [7:0] n541_o;
  wire [7:0] n542_o;
  wire [7:0] n543_o;
  wire [7:0] n544_o;
  wire [7:0] n545_o;
  wire [7:0] n546_o;
  wire [7:0] n547_o;
  wire [7:0] n548_o;
  wire [7:0] n549_o;
  wire [7:0] n550_o;
  wire [7:0] n551_o;
  wire [7:0] n552_o;
  wire [7:0] n553_o;
  wire [7:0] n554_o;
  wire [1:0] n555_o;
  reg [7:0] n556_o;
  wire [1:0] n557_o;
  reg [7:0] n558_o;
  wire [1:0] n559_o;
  reg [7:0] n560_o;
  wire [1:0] n561_o;
  reg [7:0] n562_o;
  wire [1:0] n563_o;
  reg [7:0] n564_o;
  wire n565_o;
  wire [7:0] n566_o;
  wire [1:0] n567_o;
  reg [7:0] n568_o;
  wire n569_o;
  wire [7:0] n570_o;
  wire n571_o;
  wire [7:0] n572_o;
  assign o_miso = spi_slave_inst_o_miso; //(module output)
  assign o_pwm = timer_counter_inst_o_pwm; //(module output)
  assign o_gpo = gpio_inst_o_gpo; //(module output)
  assign o_out_en = gpio_inst_o_out_en; //(module output)
  assign o_lfsr_high = lfsr_inst_o_serial; //(module output)
  /* ./files_for_tt/tt_system.vhdl:81:10  */
  always @*
    spi_i_load = n280_o; // (isignal)
  initial
    spi_i_load = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:82:10  */
  always @*
    spi_i_data = regmap_rdata; // (isignal)
  initial
    spi_i_data = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:83:10  */
  always @*
    spi_o_ready = spi_slave_inst_o_ready; // (isignal)
  initial
    spi_o_ready = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:85:10  */
  always @*
    spi_o_valid = spi_slave_inst_o_valid; // (isignal)
  initial
    spi_o_valid = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:86:10  */
  always @*
    spi_o_valid_sync_reg = n517_q; // (isignal)
  initial
    spi_o_valid_sync_reg = 2'b00;
  /* ./files_for_tt/tt_system.vhdl:86:32  */
  always @*
    spi_o_valid_sync_next = n518_o; // (isignal)
  initial
    spi_o_valid_sync_next = 2'b00;
  /* ./files_for_tt/tt_system.vhdl:87:10  */
  always @*
    spi_o_valid_synced = n232_o; // (isignal)
  initial
    spi_o_valid_synced = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:88:10  */
  always @*
    spi_o_valid_reg = n519_q; // (isignal)
  initial
    spi_o_valid_reg = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:88:27  */
  always @*
    spi_o_valid_next = spi_o_valid_synced; // (isignal)
  initial
    spi_o_valid_next = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:89:10  */
  always @*
    spi_o_valid_rising = n234_o; // (isignal)
  initial
    spi_o_valid_rising = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:90:10  */
  always @*
    spi_o_data = spi_slave_inst_o_data; // (isignal)
  initial
    spi_o_data = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:91:10  */
  always @*
    spi_o_data_slv = spi_o_data; // (isignal)
  initial
    spi_o_data_slv = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:95:10  */
  always @*
    ic_address_reg = n521_q; // (isignal)
  initial
    ic_address_reg = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:95:26  */
  always @*
    ic_address_next = n523_o; // (isignal)
  initial
    ic_address_next = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:96:10  */
  always @*
    ic_address_en = n249_o; // (isignal)
  initial
    ic_address_en = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:97:10  */
  always @*
    ic_address_reg_nat = n251_o; // (isignal)
  initial
    ic_address_reg_nat = 31'b0000000000000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:98:10  */
  always @*
    ic_addr_loaded_reg = n524_q; // (isignal)
  initial
    ic_addr_loaded_reg = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:98:30  */
  always @*
    ic_addr_loaded_next = n254_o; // (isignal)
  initial
    ic_addr_loaded_next = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:99:10  */
  always @*
    ic_access_mode_reg = n525_q; // (isignal)
  initial
    ic_access_mode_reg = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:99:30  */
  always @*
    ic_access_mode_next = n257_o; // (isignal)
  initial
    ic_access_mode_next = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:103:10  */
  always @*
    regmap_reg = n526_q; // (isignal)
  initial
    regmap_reg = 176'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:103:22  */
  always @*
    regmap_next = n528_o; // (isignal)
  initial
    regmap_next = 176'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:104:10  */
  always @*
    regmap_en = n529_o; // (isignal)
  initial
    regmap_en = 22'b0000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:105:10  */
  always @*
    regmap_en_demuxed = n530_o; // (isignal)
  initial
    regmap_en_demuxed = 22'b0000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:106:10  */
  always @*
    regmap_en_cond = n259_o; // (isignal)
  initial
    regmap_en_cond = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:107:10  */
  always @*
    regmap_rdata = n572_o; // (isignal)
  initial
    regmap_rdata = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:110:10  */
  assign timer_i_ctl = n531_o; // (signal)
  /* ./files_for_tt/tt_system.vhdl:112:10  */
  always @*
    timer_i_top = n504_o; // (isignal)
  initial
    timer_i_top = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:113:10  */
  always @*
    timer_i_clk_divisor = n505_o; // (isignal)
  initial
    timer_i_clk_divisor = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:114:10  */
  always @*
    timer_o_timer = timer_counter_inst_o_timer; // (isignal)
  initial
    timer_o_timer = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:116:10  */
  always @*
    timer_i_pwm_tops = n532_o; // (isignal)
  initial
    timer_i_pwm_tops = 32'b00000000000000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:117:10  */
  always @*
    timer_i_capt_ctl = n506_o; // (isignal)
  initial
    timer_i_capt_ctl = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:119:10  */
  always @*
    timer_o_capture_valid = timer_counter_inst_o_capture_valid; // (isignal)
  initial
    timer_o_capture_valid = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:120:10  */
  always @*
    timer_o_capture_idx = timer_counter_inst_o_capture_idx; // (isignal)
  initial
    timer_o_capture_idx = 3'b000;
  /* ./files_for_tt/tt_system.vhdl:123:10  */
  always @*
    gpio_i_dir = n512_o; // (isignal)
  initial
    gpio_i_dir = 4'b0000;
  /* ./files_for_tt/tt_system.vhdl:124:10  */
  always @*
    gpio_i_wdata = n511_o; // (isignal)
  initial
    gpio_i_wdata = 4'b0000;
  /* ./files_for_tt/tt_system.vhdl:125:10  */
  always @*
    gpio_o_rdata = gpio_inst_o_rdata; // (isignal)
  initial
    gpio_o_rdata = 4'b0000;
  /* ./files_for_tt/tt_system.vhdl:128:10  */
  always @*
    lfsr_i_poly = n513_o; // (isignal)
  initial
    lfsr_i_poly = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:129:10  */
  always @*
    lfsr_i_en = n514_o; // (isignal)
  initial
    lfsr_i_en = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:131:10  */
  always @*
    lfsr_i_serial = lfsr_o_serial; // (isignal)
  initial
    lfsr_i_serial = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:132:10  */
  always @*
    lfsr_o_serial = 1'b0; // (isignal)
  initial
    lfsr_o_serial = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:134:10  */
  always @*
    lfsr_i_load = n515_o; // (isignal)
  initial
    lfsr_i_load = 1'b0;
  /* ./files_for_tt/tt_system.vhdl:135:10  */
  always @*
    lfsr_i_data = n516_o; // (isignal)
  initial
    lfsr_i_data = 8'b00000000;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n105_o = regmap_en[0]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n106_o = regmap_next[175:168]; // extract
  assign n107_o = regmap_reg[175:168]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n108_o = n105_o ? n106_o : n107_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n109_o = regmap_en[1]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n110_o = regmap_next[167:160]; // extract
  assign n111_o = regmap_reg[167:160]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n112_o = n109_o ? n110_o : n111_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n113_o = regmap_en[2]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n114_o = regmap_next[159:152]; // extract
  assign n115_o = regmap_reg[159:152]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n116_o = n113_o ? n114_o : n115_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n117_o = regmap_en[3]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n118_o = regmap_next[151:144]; // extract
  assign n119_o = regmap_reg[151:144]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n120_o = n117_o ? n118_o : n119_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n121_o = regmap_en[4]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n122_o = regmap_next[143:136]; // extract
  assign n123_o = regmap_reg[143:136]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n124_o = n121_o ? n122_o : n123_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n125_o = regmap_en[5]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n126_o = regmap_next[135:128]; // extract
  assign n127_o = regmap_reg[135:128]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n128_o = n125_o ? n126_o : n127_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n129_o = regmap_en[6]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n130_o = regmap_next[127:120]; // extract
  assign n131_o = regmap_reg[127:120]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n132_o = n129_o ? n130_o : n131_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n133_o = regmap_en[7]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n134_o = regmap_next[119:112]; // extract
  assign n135_o = regmap_reg[119:112]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n136_o = n133_o ? n134_o : n135_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n137_o = regmap_en[8]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n138_o = regmap_next[111:104]; // extract
  assign n139_o = regmap_reg[111:104]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n140_o = n137_o ? n138_o : n139_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n141_o = regmap_en[9]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n142_o = regmap_next[103:96]; // extract
  assign n143_o = regmap_reg[103:96]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n144_o = n141_o ? n142_o : n143_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n145_o = regmap_en[10]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n146_o = regmap_next[95:88]; // extract
  assign n147_o = regmap_reg[95:88]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n148_o = n145_o ? n146_o : n147_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n149_o = regmap_en[11]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n150_o = regmap_next[87:80]; // extract
  assign n151_o = regmap_reg[87:80]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n152_o = n149_o ? n150_o : n151_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n153_o = regmap_en[12]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n154_o = regmap_next[79:72]; // extract
  assign n155_o = regmap_reg[79:72]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n156_o = n153_o ? n154_o : n155_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n157_o = regmap_en[13]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n158_o = regmap_next[71:64]; // extract
  assign n159_o = regmap_reg[71:64]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n160_o = n157_o ? n158_o : n159_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n161_o = regmap_en[14]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n162_o = regmap_next[63:56]; // extract
  assign n163_o = regmap_reg[63:56]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n164_o = n161_o ? n162_o : n163_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n165_o = regmap_en[15]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n166_o = regmap_next[55:48]; // extract
  assign n167_o = regmap_reg[55:48]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n168_o = n165_o ? n166_o : n167_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n169_o = regmap_en[16]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n170_o = regmap_next[47:40]; // extract
  assign n171_o = regmap_reg[47:40]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n172_o = n169_o ? n170_o : n171_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n173_o = regmap_en[17]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n174_o = regmap_next[39:32]; // extract
  assign n175_o = regmap_reg[39:32]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n176_o = n173_o ? n174_o : n175_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n177_o = regmap_en[18]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n178_o = regmap_next[31:24]; // extract
  assign n179_o = regmap_reg[31:24]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n180_o = n177_o ? n178_o : n179_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n181_o = regmap_en[19]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n182_o = regmap_next[23:16]; // extract
  assign n183_o = regmap_reg[23:16]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n184_o = n181_o ? n182_o : n183_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n185_o = regmap_en[20]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n186_o = regmap_next[15:8]; // extract
  assign n187_o = regmap_reg[15:8]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n188_o = n185_o ? n186_o : n187_o;
  /* ./files_for_tt/tt_system.vhdl:166:21  */
  assign n189_o = regmap_en[21]; // extract
  /* ./files_for_tt/tt_system.vhdl:167:39  */
  assign n190_o = regmap_next[7:0]; // extract
  assign n191_o = regmap_reg[7:0]; // extract
  /* ./files_for_tt/tt_system.vhdl:166:9  */
  assign n192_o = n189_o ? n190_o : n191_o;
  assign n198_o = {n108_o, n112_o, n116_o, n120_o, n124_o, n128_o, n132_o, n136_o, n140_o, n144_o, n148_o, n152_o, n156_o, n160_o, n164_o, n168_o, n172_o, n176_o, n180_o, n184_o, n188_o, n192_o};
  /* ./files_for_tt/tt_system.vhdl:173:3  */
  spi_slave_0a4a314244f8a6fd1be9196375a52cc72a4bba92 spi_slave_inst (
    .clk(clk),
    .arst(arst),
    .i_mclk(i_mclk),
    .i_mosi(i_mosi),
    .i_msel(i_msel),
    .i_load(spi_i_load),
    .i_data(spi_i_data),
    .o_miso(spi_slave_inst_o_miso),
    .o_ready(spi_slave_inst_o_ready),
    .o_valid(spi_slave_inst_o_valid),
    .o_data(spi_slave_inst_o_data));
  /* ./files_for_tt/tt_system.vhdl:191:3  */
  timer_counter_pwm_2_51aa648633bc9ff19a580c0e4db0052dd92134a9 timer_counter_inst (
    .clk(clk),
    .rst(arst),
    .i_ctl_ctr_en(n217_o),
    .i_ctl_ctr_up_down(n218_o),
    .i_ctl_ctr_en_pwm(n219_o),
    .i_ctl_ctr_en_capt(n220_o),
    .i_ctl_ctr_rst_on_top(n221_o),
    .i_top(timer_i_top),
    .i_clk_divisor(timer_i_clk_divisor),
    .i_pwm_tops(timer_i_pwm_tops),
    .i_capt_ctl(timer_i_capt_ctl),
    .i_capture(i_capture),
    .o_timer(timer_counter_inst_o_timer),
    .o_pwm(timer_counter_inst_o_pwm),
    .o_capture_valid(timer_counter_inst_o_capture_valid),
    .o_capture_idx(timer_counter_inst_o_capture_idx));
  assign n217_o = timer_i_ctl[0]; // extract
  assign n218_o = timer_i_ctl[1]; // extract
  assign n219_o = timer_i_ctl[2]; // extract
  assign n220_o = timer_i_ctl[3]; // extract
  assign n221_o = timer_i_ctl[4]; // extract
  /* ./files_for_tt/tt_system.vhdl:214:3  */
  gpio_separate_2_0dfcee3aec5cbd17f5bdfbc6ec7da6c1f80fa91f gpio_inst (
    .clk(clk),
    .rst(arst),
    .i_dir(gpio_i_dir),
    .i_wdata(gpio_i_wdata),
    .i_gpi(i_gpi),
    .o_rdata(gpio_inst_o_rdata),
    .o_gpo(gpio_inst_o_gpo),
    .o_out_en(gpio_inst_o_out_en));
  /* ./files_for_tt/tt_system.vhdl:231:3  */
  lfsr_9d570a0e8d99e02cb348b823f461e41da66b8468 lfsr_inst (
    .clk(clk),
    .rst(arst),
    .i_poly(lfsr_i_poly),
    .i_en(lfsr_i_en),
    .i_serial(lfsr_i_serial),
    .i_load(lfsr_i_load),
    .i_data(lfsr_i_data),
    .o_serial(lfsr_inst_o_serial),
    .o_data());
  /* ./files_for_tt/tt_system.vhdl:256:79  */
  assign n231_o = spi_o_valid_sync_reg[0]; // extract
  /* ./files_for_tt/tt_system.vhdl:259:47  */
  assign n232_o = spi_o_valid_sync_reg[1]; // extract
  /* ./files_for_tt/tt_system.vhdl:263:47  */
  assign n233_o = ~spi_o_valid_reg;
  /* ./files_for_tt/tt_system.vhdl:263:42  */
  assign n234_o = spi_o_valid_next & n233_o;
  /* ./files_for_tt/tt_system.vhdl:269:68  */
  assign n248_o = spi_o_data_slv[6:0]; // extract
  /* ./files_for_tt/tt_system.vhdl:270:20  */
  assign n249_o = ~ic_addr_loaded_reg;
  /* ./files_for_tt/tt_system.vhdl:271:25  */
  assign n250_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:271:62  */
  assign n251_o = ic_addr_loaded_reg ? n250_o : 31'b0000000000000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:274:26  */
  assign n253_o = ~ic_addr_loaded_reg;
  /* ./files_for_tt/tt_system.vhdl:274:49  */
  assign n254_o = spi_o_valid_rising ? n253_o : ic_addr_loaded_reg;
  /* ./files_for_tt/tt_system.vhdl:277:40  */
  assign n255_o = spi_o_data_slv[7]; // extract
  /* ./files_for_tt/tt_system.vhdl:277:86  */
  assign n256_o = ~ic_addr_loaded_reg;
  /* ./files_for_tt/tt_system.vhdl:277:62  */
  assign n257_o = n256_o ? n255_o : ic_access_mode_reg;
  /* ./files_for_tt/tt_system.vhdl:283:40  */
  assign n258_o = ic_addr_loaded_reg & ic_access_mode_reg;
  /* ./files_for_tt/tt_system.vhdl:283:63  */
  assign n259_o = n258_o & spi_o_valid_rising;
  /* ./files_for_tt/tt_system.vhdl:286:30  */
  assign n260_o = ic_address_reg_nat[4:0];  // trunc
  /* ./files_for_tt/tt_system.vhdl:286:30  */
  assign n262_o = 5'b10101 - n260_o;
  /* ./files_for_tt/tt_system.vhdl:288:82  */
  assign n278_o = ~ic_access_mode_reg;
  /* ./files_for_tt/tt_system.vhdl:288:59  */
  assign n279_o = n278_o & ic_addr_loaded_reg;
  /* ./files_for_tt/tt_system.vhdl:288:29  */
  assign n280_o = n279_o ? spi_o_ready : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n283_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n284_o = {1'b0, n283_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n286_o = n284_o == 32'b00000000000000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n288_o = n286_o ? regmap_en_cond : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n291_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n292_o = {1'b0, n291_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n294_o = n292_o == 32'b00000000000000000000000000000001;
  assign n295_o = n289_o[1]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n296_o = n294_o ? regmap_en_cond : n295_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n298_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n299_o = {1'b0, n298_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n301_o = n299_o == 32'b00000000000000000000000000000010;
  assign n302_o = n289_o[2]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n303_o = n301_o ? regmap_en_cond : n302_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n305_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n306_o = {1'b0, n305_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n308_o = n306_o == 32'b00000000000000000000000000000011;
  assign n309_o = n289_o[3]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n310_o = n308_o ? regmap_en_cond : n309_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n312_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n313_o = {1'b0, n312_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n315_o = n313_o == 32'b00000000000000000000000000000100;
  assign n316_o = n289_o[4]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n317_o = n315_o ? regmap_en_cond : n316_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n319_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n320_o = {1'b0, n319_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n322_o = n320_o == 32'b00000000000000000000000000000101;
  assign n323_o = n289_o[5]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n324_o = n322_o ? regmap_en_cond : n323_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n326_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n327_o = {1'b0, n326_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n329_o = n327_o == 32'b00000000000000000000000000000110;
  assign n330_o = n289_o[6]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n331_o = n329_o ? regmap_en_cond : n330_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n333_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n334_o = {1'b0, n333_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n336_o = n334_o == 32'b00000000000000000000000000000111;
  assign n337_o = n289_o[7]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n338_o = n336_o ? regmap_en_cond : n337_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n340_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n341_o = {1'b0, n340_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n343_o = n341_o == 32'b00000000000000000000000000001000;
  assign n344_o = n289_o[8]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n345_o = n343_o ? regmap_en_cond : n344_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n347_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n348_o = {1'b0, n347_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n350_o = n348_o == 32'b00000000000000000000000000001001;
  assign n351_o = n289_o[9]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n352_o = n350_o ? regmap_en_cond : n351_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n354_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n355_o = {1'b0, n354_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n357_o = n355_o == 32'b00000000000000000000000000001010;
  assign n358_o = n289_o[10]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n359_o = n357_o ? regmap_en_cond : n358_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n361_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n362_o = {1'b0, n361_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n364_o = n362_o == 32'b00000000000000000000000000001011;
  assign n365_o = n289_o[11]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n366_o = n364_o ? regmap_en_cond : n365_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n368_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n369_o = {1'b0, n368_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n371_o = n369_o == 32'b00000000000000000000000000001100;
  assign n372_o = n289_o[12]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n373_o = n371_o ? regmap_en_cond : n372_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n375_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n376_o = {1'b0, n375_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n378_o = n376_o == 32'b00000000000000000000000000001101;
  assign n379_o = n289_o[13]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n380_o = n378_o ? regmap_en_cond : n379_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n382_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n383_o = {1'b0, n382_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n385_o = n383_o == 32'b00000000000000000000000000001110;
  assign n386_o = n289_o[14]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n387_o = n385_o ? regmap_en_cond : n386_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n389_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n390_o = {1'b0, n389_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n392_o = n390_o == 32'b00000000000000000000000000001111;
  assign n393_o = n289_o[15]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n394_o = n392_o ? regmap_en_cond : n393_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n396_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n397_o = {1'b0, n396_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n399_o = n397_o == 32'b00000000000000000000000000010000;
  assign n400_o = n289_o[16]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n401_o = n399_o ? regmap_en_cond : n400_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n403_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n404_o = {1'b0, n403_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n406_o = n404_o == 32'b00000000000000000000000000010001;
  assign n407_o = n289_o[17]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n408_o = n406_o ? regmap_en_cond : n407_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n410_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n411_o = {1'b0, n410_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n413_o = n411_o == 32'b00000000000000000000000000010010;
  assign n414_o = n289_o[18]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n415_o = n413_o ? regmap_en_cond : n414_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n417_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n418_o = {1'b0, n417_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n420_o = n418_o == 32'b00000000000000000000000000010011;
  assign n421_o = n289_o[19]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n422_o = n420_o ? regmap_en_cond : n421_o;
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n424_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n425_o = {1'b0, n424_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n427_o = n425_o == 32'b00000000000000000000000000010100;
  assign n428_o = n289_o[20]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n429_o = n427_o ? regmap_en_cond : n428_o;
  assign n430_o = n289_o[21]; // extract
  /* ./files_for_tt/tt_system.vhdl:319:10  */
  assign n431_o = {23'b0, ic_address_reg};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n432_o = {1'b0, n431_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:319:47  */
  assign n434_o = n432_o == 32'b00000000000000000000000000010101;
  /* ./files_for_tt/tt_system.vhdl:319:7  */
  assign n435_o = n434_o ? regmap_en_cond : n430_o;
  /* ./files_for_tt/tt_system.vhdl:328:47  */
  assign n437_o = regmap_en_demuxed[0]; // extract
  /* ./files_for_tt/tt_system.vhdl:329:47  */
  assign n438_o = regmap_en_demuxed[1]; // extract
  /* ./files_for_tt/tt_system.vhdl:330:51  */
  assign n439_o = regmap_en_demuxed[2]; // extract
  /* ./files_for_tt/tt_system.vhdl:331:52  */
  assign n440_o = regmap_en_demuxed[3]; // extract
  /* ./files_for_tt/tt_system.vhdl:333:48  */
  assign n442_o = regmap_en_demuxed[5]; // extract
  /* ./files_for_tt/tt_system.vhdl:334:46  */
  assign n443_o = regmap_en_demuxed[6]; // extract
  /* ./files_for_tt/tt_system.vhdl:335:47  */
  assign n444_o = regmap_en_demuxed[7]; // extract
  /* ./files_for_tt/tt_system.vhdl:336:46  */
  assign n445_o = regmap_en_demuxed[8]; // extract
  /* ./files_for_tt/tt_system.vhdl:337:48  */
  assign n446_o = regmap_en_demuxed[9]; // extract
  /* ./files_for_tt/tt_system.vhdl:340:60  */
  assign n447_o = regmap_en_demuxed[10]; // extract
  /* ./files_for_tt/tt_system.vhdl:340:60  */
  assign n448_o = regmap_en_demuxed[11]; // extract
  /* ./files_for_tt/tt_system.vhdl:340:60  */
  assign n449_o = regmap_en_demuxed[12]; // extract
  /* ./files_for_tt/tt_system.vhdl:340:60  */
  assign n450_o = regmap_en_demuxed[13]; // extract
  /* ./files_for_tt/tt_system.vhdl:344:88  */
  assign n451_o = {28'b0, timer_o_capture_idx};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n452_o = {1'b0, n451_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n454_o = n452_o == 32'b00000000000000000000000000000000;
  /* ./files_for_tt/tt_system.vhdl:344:83  */
  assign n455_o = n454_o ? timer_o_capture_valid : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:344:88  */
  assign n457_o = {28'b0, timer_o_capture_idx};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n458_o = {1'b0, n457_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n460_o = n458_o == 32'b00000000000000000000000000000001;
  /* ./files_for_tt/tt_system.vhdl:344:83  */
  assign n461_o = n460_o ? timer_o_capture_valid : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:344:88  */
  assign n463_o = {28'b0, timer_o_capture_idx};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n464_o = {1'b0, n463_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n466_o = n464_o == 32'b00000000000000000000000000000010;
  /* ./files_for_tt/tt_system.vhdl:344:83  */
  assign n467_o = n466_o ? timer_o_capture_valid : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:344:88  */
  assign n469_o = {28'b0, timer_o_capture_idx};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n470_o = {1'b0, n469_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n472_o = n470_o == 32'b00000000000000000000000000000011;
  /* ./files_for_tt/tt_system.vhdl:344:83  */
  assign n473_o = n472_o ? timer_o_capture_valid : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:344:88  */
  assign n475_o = {28'b0, timer_o_capture_idx};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n476_o = {1'b0, n475_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n478_o = n476_o == 32'b00000000000000000000000000000100;
  /* ./files_for_tt/tt_system.vhdl:344:83  */
  assign n479_o = n478_o ? timer_o_capture_valid : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:344:88  */
  assign n481_o = {28'b0, timer_o_capture_idx};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n482_o = {1'b0, n481_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n484_o = n482_o == 32'b00000000000000000000000000000101;
  /* ./files_for_tt/tt_system.vhdl:344:83  */
  assign n485_o = n484_o ? timer_o_capture_valid : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:344:88  */
  assign n487_o = {28'b0, timer_o_capture_idx};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n488_o = {1'b0, n487_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n490_o = n488_o == 32'b00000000000000000000000000000110;
  /* ./files_for_tt/tt_system.vhdl:344:83  */
  assign n491_o = n490_o ? timer_o_capture_valid : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:344:88  */
  assign n493_o = {28'b0, timer_o_capture_idx};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n494_o = {1'b0, n493_o};  //  uext
  /* ./files_for_tt/tt_system.vhdl:344:130  */
  assign n496_o = n494_o == 32'b00000000000000000000000000000111;
  /* ./files_for_tt/tt_system.vhdl:344:83  */
  assign n497_o = n496_o ? timer_o_capture_valid : 1'b0;
  /* ./files_for_tt/tt_system.vhdl:349:49  */
  assign n499_o = regmap_reg[168]; // extract
  /* ./files_for_tt/tt_system.vhdl:350:54  */
  assign n500_o = regmap_reg[169]; // extract
  /* ./files_for_tt/tt_system.vhdl:351:53  */
  assign n501_o = regmap_reg[170]; // extract
  /* ./files_for_tt/tt_system.vhdl:352:54  */
  assign n502_o = regmap_reg[171]; // extract
  /* ./files_for_tt/tt_system.vhdl:353:57  */
  assign n503_o = regmap_reg[172]; // extract
  /* ./files_for_tt/tt_system.vhdl:355:28  */
  assign n504_o = regmap_reg[167:160]; // extract
  /* ./files_for_tt/tt_system.vhdl:356:36  */
  assign n505_o = regmap_reg[159:152]; // extract
  /* ./files_for_tt/tt_system.vhdl:357:52  */
  assign n506_o = regmap_reg[151:144]; // extract
  /* ./files_for_tt/tt_system.vhdl:359:38  */
  assign n507_o = regmap_reg[95:88]; // extract
  /* ./files_for_tt/tt_system.vhdl:359:38  */
  assign n508_o = regmap_reg[87:80]; // extract
  /* ./files_for_tt/tt_system.vhdl:359:38  */
  assign n509_o = regmap_reg[79:72]; // extract
  /* ./files_for_tt/tt_system.vhdl:359:38  */
  assign n510_o = regmap_reg[71:64]; // extract
  /* ./files_for_tt/tt_system.vhdl:364:44  */
  assign n511_o = regmap_reg[131:128]; // extract
  /* ./files_for_tt/tt_system.vhdl:365:40  */
  assign n512_o = regmap_reg[123:120]; // extract
  /* ./files_for_tt/tt_system.vhdl:369:28  */
  assign n513_o = regmap_reg[119:112]; // extract
  /* ./files_for_tt/tt_system.vhdl:370:41  */
  assign n514_o = regmap_reg[104]; // extract
  /* ./files_for_tt/tt_system.vhdl:371:41  */
  assign n515_o = regmap_reg[105]; // extract
  /* ./files_for_tt/tt_system.vhdl:372:28  */
  assign n516_o = regmap_reg[103:96]; // extract
  /* ./files_for_tt/tt_system.vhdl:155:5  */
  always @(posedge clk or posedge arst)
    if (arst)
      n517_q <= 2'b00;
    else
      n517_q <= spi_o_valid_sync_next;
  /* ./files_for_tt/tt_system.vhdl:148:5  */
  assign n518_o = {n231_o, spi_o_valid};
  /* ./files_for_tt/tt_system.vhdl:155:5  */
  always @(posedge clk or posedge arst)
    if (arst)
      n519_q <= 1'b0;
    else
      n519_q <= spi_o_valid_next;
  /* ./files_for_tt/tt_system.vhdl:155:5  */
  assign n520_o = ic_address_en ? ic_address_next : ic_address_reg;
  /* ./files_for_tt/tt_system.vhdl:155:5  */
  always @(posedge clk or posedge arst)
    if (arst)
      n521_q <= 8'b00000000;
    else
      n521_q <= n520_o;
  /* ./files_for_tt/tt_system.vhdl:148:5  */
  assign n522_o = n70_o[7]; // extract
  assign n523_o = {n522_o, n248_o};
  /* ./files_for_tt/tt_system.vhdl:155:5  */
  always @(posedge clk or posedge arst)
    if (arst)
      n524_q <= 1'b0;
    else
      n524_q <= ic_addr_loaded_next;
  /* ./files_for_tt/tt_system.vhdl:155:5  */
  always @(posedge clk or posedge arst)
    if (arst)
      n525_q <= 1'b0;
    else
      n525_q <= ic_access_mode_next;
  /* ./files_for_tt/tt_system.vhdl:155:5  */
  always @(posedge clk or posedge arst)
    if (arst)
      n526_q <= 176'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    else
      n526_q <= n198_o;
  /* ./files_for_tt/tt_system.vhdl:148:5  */
  assign n527_o = n78_o[143:140]; // extract
  /* ./files_for_tt/tt_system.vhdl:148:5  */
  assign n528_o = {spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, n527_o, gpio_o_rdata, spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, spi_o_data_slv, timer_o_timer, timer_o_timer, timer_o_timer, timer_o_timer, timer_o_timer, timer_o_timer, timer_o_timer, timer_o_timer};
  /* ./files_for_tt/tt_system.vhdl:148:5  */
  assign n529_o = {n497_o, n491_o, n485_o, n479_o, n473_o, n467_o, n461_o, n455_o, n450_o, n449_o, n448_o, n447_o, n446_o, n445_o, n444_o, n443_o, n442_o, 1'b1, n440_o, n439_o, n438_o, n437_o};
  assign n530_o = {n435_o, n429_o, n422_o, n415_o, n408_o, n401_o, n394_o, n387_o, n380_o, n373_o, n366_o, n359_o, n352_o, n345_o, n338_o, n331_o, n324_o, n317_o, n310_o, n303_o, n296_o, n288_o};
  assign n531_o = {n503_o, n502_o, n501_o, n500_o, n499_o};
  assign n532_o = {n507_o, n508_o, n509_o, n510_o};
  /* ./files_for_tt/tt_system.vhdl:240:19  */
  assign n533_o = regmap_reg[7:0]; // extract
  /* ./files_for_tt/tt_system.vhdl:228:19  */
  assign n534_o = regmap_reg[15:8]; // extract
  /* ./files_for_tt/tt_system.vhdl:227:16  */
  assign n535_o = regmap_reg[23:16]; // extract
  /* ./files_for_tt/tt_system.vhdl:224:18  */
  assign n536_o = regmap_reg[31:24]; // extract
  /* ./files_for_tt/tt_system.vhdl:211:26  */
  assign n537_o = regmap_reg[39:32]; // extract
  /* ./files_for_tt/tt_system.vhdl:210:26  */
  assign n538_o = regmap_reg[47:40]; // extract
  /* ./files_for_tt/tt_system.vhdl:206:26  */
  assign n539_o = regmap_reg[55:48]; // extract
  /* ./files_for_tt/tt_system.vhdl:203:26  */
  assign n540_o = regmap_reg[63:56]; // extract
  /* ./files_for_tt/tt_system.vhdl:188:18  */
  assign n541_o = regmap_reg[71:64]; // extract
  /* ./files_for_tt/tt_system.vhdl:187:18  */
  assign n542_o = regmap_reg[79:72]; // extract
  /* ./files_for_tt/tt_system.vhdl:185:18  */
  assign n543_o = regmap_reg[87:80]; // extract
  /* ./files_for_tt/tt_system.vhdl:180:18  */
  assign n544_o = regmap_reg[95:88]; // extract
  /* ./files_for_tt/tt_system.vhdl:69:5  */
  assign n545_o = regmap_reg[103:96]; // extract
  /* ./files_for_tt/tt_system.vhdl:66:5  */
  assign n546_o = regmap_reg[111:104]; // extract
  /* ./files_for_tt/tt_system.vhdl:65:5  */
  assign n547_o = regmap_reg[119:112]; // extract
  /* ./files_for_tt/tt_system.vhdl:60:5  */
  assign n548_o = regmap_reg[127:120]; // extract
  /* ./files_for_tt/tt_system.vhdl:56:5  */
  assign n549_o = regmap_reg[135:128]; // extract
  assign n550_o = regmap_reg[143:136]; // extract
  assign n551_o = regmap_reg[151:144]; // extract
  assign n552_o = regmap_reg[159:152]; // extract
  assign n553_o = regmap_reg[167:160]; // extract
  assign n554_o = regmap_reg[175:168]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n555_o = n262_o[1:0]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  always @*
    case (n555_o)
      2'b00: n556_o = n533_o;
      2'b01: n556_o = n534_o;
      2'b10: n556_o = n535_o;
      2'b11: n556_o = n536_o;
    endcase
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n557_o = n262_o[1:0]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  always @*
    case (n557_o)
      2'b00: n558_o = n537_o;
      2'b01: n558_o = n538_o;
      2'b10: n558_o = n539_o;
      2'b11: n558_o = n540_o;
    endcase
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n559_o = n262_o[1:0]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  always @*
    case (n559_o)
      2'b00: n560_o = n541_o;
      2'b01: n560_o = n542_o;
      2'b10: n560_o = n543_o;
      2'b11: n560_o = n544_o;
    endcase
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n561_o = n262_o[1:0]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  always @*
    case (n561_o)
      2'b00: n562_o = n545_o;
      2'b01: n562_o = n546_o;
      2'b10: n562_o = n547_o;
      2'b11: n562_o = n548_o;
    endcase
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n563_o = n262_o[1:0]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  always @*
    case (n563_o)
      2'b00: n564_o = n549_o;
      2'b01: n564_o = n550_o;
      2'b10: n564_o = n551_o;
      2'b11: n564_o = n552_o;
    endcase
  assign n565_o = n262_o[0]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n566_o = n565_o ? n554_o : n553_o;
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n567_o = n262_o[3:2]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  always @*
    case (n567_o)
      2'b00: n568_o = n556_o;
      2'b01: n568_o = n558_o;
      2'b10: n568_o = n560_o;
      2'b11: n568_o = n562_o;
    endcase
  assign n569_o = n262_o[2]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n570_o = n569_o ? n566_o : n564_o;
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n571_o = n262_o[4]; // extract
  /* ./files_for_tt/tt_system.vhdl:286:29  */
  assign n572_o = n571_o ? n570_o : n568_o;
endmodule

module tt_um_sergejsumnovs_spi_slave
  (input  [7:0] ui_in,
   input  [7:0] uio_in,
   input  ena,
   input  clk,
   input  rst_n,
   output [7:0] uo_out,
   output [7:0] uio_out,
   output [7:0] uio_oe);
  reg i_mclk;
  reg i_mosi;
  reg o_miso;
  reg i_msel;
  reg [3:0] o_pwm;
  reg [7:0] i_capture;
  reg [3:0] i_gpi;
  reg [3:0] o_gpo;
  reg [3:0] o_out_en;
  reg o_lfsr_high;
  wire comp_o_miso;
  wire [3:0] comp_o_pwm;
  wire [3:0] comp_o_gpo;
  wire [3:0] comp_o_out_en;
  wire comp_o_lfsr_high;
  wire n13_o;
  wire n19_o;
  wire n20_o;
  wire n21_o;
  wire n22_o;
  wire n30_o;
  wire n31_o;
  wire n32_o;
  wire n33_o;
  wire n34_o;
  wire n35_o;
  wire n36_o;
  wire n37_o;
  wire n38_o;
  wire n39_o;
  wire n40_o;
  wire n44_o;
  wire n45_o;
  wire n46_o;
  wire n47_o;
  wire [3:0] n48_o;
  wire [7:0] n49_o;
  wire [7:0] n50_o;
  wire [7:0] n51_o;
  assign uo_out = n49_o; //(module output)
  assign uio_out = n50_o; //(module output)
  assign uio_oe = n51_o; //(module output)
  /* ./files_for_tt/main_tt.vhdl:41:10  */
  always @*
    i_mclk = n36_o; // (isignal)
  initial
    i_mclk = 1'b0;
  /* ./files_for_tt/main_tt.vhdl:42:10  */
  always @*
    i_mosi = n35_o; // (isignal)
  initial
    i_mosi = 1'b0;
  /* ./files_for_tt/main_tt.vhdl:43:10  */
  always @*
    o_miso = comp_o_miso; // (isignal)
  initial
    o_miso = 1'b0;
  /* ./files_for_tt/main_tt.vhdl:44:10  */
  always @*
    i_msel = n34_o; // (isignal)
  initial
    i_msel = 1'b0;
  /* ./files_for_tt/main_tt.vhdl:46:10  */
  always @*
    o_pwm = comp_o_pwm; // (isignal)
  initial
    o_pwm = 4'b0000;
  /* ./files_for_tt/main_tt.vhdl:47:10  */
  always @*
    i_capture = ui_in; // (isignal)
  initial
    i_capture = 8'b00000000;
  /* ./files_for_tt/main_tt.vhdl:49:10  */
  always @*
    i_gpi = n48_o; // (isignal)
  initial
    i_gpi = 4'b0000;
  /* ./files_for_tt/main_tt.vhdl:50:10  */
  always @*
    o_gpo = comp_o_gpo; // (isignal)
  initial
    o_gpo = 4'b0000;
  /* ./files_for_tt/main_tt.vhdl:51:10  */
  always @*
    o_out_en = comp_o_out_en; // (isignal)
  initial
    o_out_en = 4'b0000;
  /* ./files_for_tt/main_tt.vhdl:53:10  */
  always @*
    o_lfsr_high = comp_o_lfsr_high; // (isignal)
  initial
    o_lfsr_high = 1'b0;
  /* ./files_for_tt/main_tt.vhdl:56:3  */
  tt_system_1_8_1_2_8_8_8_4_8_2_4_2_8_dcce328dea092d922b28c6adbd91f0e220ac4277 comp (
    .clk(clk),
    .arst(n13_o),
    .i_mclk(i_mclk),
    .i_mosi(i_mosi),
    .i_msel(i_msel),
    .i_capture(i_capture),
    .i_gpi(i_gpi),
    .o_miso(comp_o_miso),
    .o_pwm(comp_o_pwm),
    .o_gpo(comp_o_gpo),
    .o_out_en(comp_o_out_en),
    .o_lfsr_high(comp_o_lfsr_high));
  /* ./files_for_tt/main_tt.vhdl:79:15  */
  assign n13_o = ~rst_n;
  /* ./files_for_tt/main_tt.vhdl:98:21  */
  assign n19_o = o_pwm[0]; // extract
  /* ./files_for_tt/main_tt.vhdl:99:21  */
  assign n20_o = o_pwm[1]; // extract
  /* ./files_for_tt/main_tt.vhdl:100:21  */
  assign n21_o = o_pwm[2]; // extract
  /* ./files_for_tt/main_tt.vhdl:101:21  */
  assign n22_o = o_pwm[3]; // extract
  /* ./files_for_tt/main_tt.vhdl:111:24  */
  assign n30_o = o_out_en[0]; // extract
  /* ./files_for_tt/main_tt.vhdl:112:24  */
  assign n31_o = o_out_en[1]; // extract
  /* ./files_for_tt/main_tt.vhdl:113:24  */
  assign n32_o = o_out_en[2]; // extract
  /* ./files_for_tt/main_tt.vhdl:114:24  */
  assign n33_o = o_out_en[3]; // extract
  /* ./files_for_tt/main_tt.vhdl:116:22  */
  assign n34_o = uio_in[0]; // extract
  /* ./files_for_tt/main_tt.vhdl:117:22  */
  assign n35_o = uio_in[1]; // extract
  /* ./files_for_tt/main_tt.vhdl:119:22  */
  assign n36_o = uio_in[3]; // extract
  /* ./files_for_tt/main_tt.vhdl:120:22  */
  assign n37_o = uio_in[4]; // extract
  /* ./files_for_tt/main_tt.vhdl:121:22  */
  assign n38_o = uio_in[5]; // extract
  /* ./files_for_tt/main_tt.vhdl:122:22  */
  assign n39_o = uio_in[6]; // extract
  /* ./files_for_tt/main_tt.vhdl:123:22  */
  assign n40_o = uio_in[7]; // extract
  /* ./files_for_tt/main_tt.vhdl:129:22  */
  assign n44_o = o_gpo[0]; // extract
  /* ./files_for_tt/main_tt.vhdl:130:22  */
  assign n45_o = o_gpo[1]; // extract
  /* ./files_for_tt/main_tt.vhdl:131:22  */
  assign n46_o = o_gpo[2]; // extract
  /* ./files_for_tt/main_tt.vhdl:132:22  */
  assign n47_o = o_gpo[3]; // extract
  assign n48_o = {n40_o, n39_o, n38_o, n37_o};
  assign n49_o = {1'b0, 1'b0, 1'b0, o_lfsr_high, n22_o, n21_o, n20_o, n19_o};
  assign n50_o = {n47_o, n46_o, n45_o, n44_o, 1'b0, o_miso, 1'b0, 1'b0};
  assign n51_o = {n33_o, n32_o, n31_o, n30_o, 1'b0, 1'b1, 1'b0, 1'b0};
endmodule

