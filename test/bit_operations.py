def copy_bit(dest_data, dest_bit, src_data, src_bit):
  dest_data_reset_bit = dest_data & (~(1 << dest_bit))
  dest_data_with_new_bit = dest_data_reset_bit | (((src_data >> src_bit) & 1) << dest_bit)
  return dest_data_with_new_bit

def modify_bit(data, bit, new_bit):
  new_data &= ~(1 << bit)
  return new_data | (new_bit << bit)
  

def set_bit(data, bit):
  return data | (1 << bit)

def clear_bit(data, bit):
  return data & ~(1 << bit)

def get_bit(data, bit):
  return (data >> bit) & 0x01
