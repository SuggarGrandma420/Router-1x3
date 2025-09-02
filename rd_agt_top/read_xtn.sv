class read_xtn extends uvm_sequence_item;

  `uvm_object_utils(read_xtn)

  rand int clock_count;
  logic read_enb, vld_out;
  logic [7:0] header, payload[], parity;

  extern function new(string name = "read_xtn");
  extern virtual function void do_copy(uvm_object rhs);
  extern virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern virtual function void do_print(uvm_printer printer);

endclass : read_xtn

function read_xtn::new(string name = "read_xtn");
  super.new(name);
endfunction : new

function void read_xtn::do_copy(uvm_object rhs);
  read_xtn rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal("READ_XTN", "Cast failed")

  super.do_copy(rhs);

  this.header = rhs_.header;
  foreach (rhs_.payload[i]) begin
    this.payload[i] = rhs_.payload[i];
  end
  this.payload = rhs_.payload;
endfunction : do_copy

function bit read_xtn::do_compare(uvm_object rhs, uvm_comparer comparer);
  read_xtn rhs_;
  bit compare_payload;
  if (!$cast(rhs_, rhs)) `uvm_fatal("READ_XTN", "Cast failed")

  foreach (rhs_.payload[i]) begin
    compare_payload = this.payload[i] == rhs_.payload[i];
  end

  return super.do_compare(
      rhs, comparer
  ) && this.header == rhs_.header && compare_payload && this.parity == rhs_.parity;
endfunction : do_compare

function void read_xtn::do_print(uvm_printer printer);
  super.do_print(printer);
  printer.print_field("sim_time", $time, $bits($time), UVM_TIME);
  printer.print_field("clock_count", this.clock_count, $bits(this.clock_count), UVM_DEC);
  printer.print_field("header", this.header, $bits(this.header), UVM_DEC);
  foreach (this.payload[i]) begin
    printer.print_field($sformatf("payload[%0d]", i), this.payload[i], $bits(this.payload[i]),
                        UVM_DEC);
  end
  printer.print_field("parity", this.parity, $bits(this.parity), UVM_DEC);
endfunction : do_print

