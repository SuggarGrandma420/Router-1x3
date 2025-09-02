class write_xtn extends uvm_sequence_item;

  `uvm_object_utils(write_xtn)

  logic resetn, error, busy;
  logic pkt_valid;
  rand logic [7:0] header, payload[];
  logic [7:0] parity;

  constraint c_header {
    header[7:2] != 0;
    header[1:0] != 3;
  }

  constraint c_payload {payload.size == header[7:2];}

  extern function new(string name = "write_xtn");
  extern function void post_randomize;
  extern virtual function void do_copy(uvm_object rhs);
  extern virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern virtual function void do_print(uvm_printer printer);

endclass : write_xtn

function write_xtn::new(string name = "write_xtn");
  super.new(name);
endfunction : new

function void write_xtn::post_randomize;
  parity = header;
  foreach (payload[i]) begin
    parity = parity ^ payload[i];
  end
endfunction : post_randomize

function void write_xtn::do_copy(uvm_object rhs);
  write_xtn rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal("WRITE_XTN", "Cast failed");

  super.do_copy(rhs);

  this.resetn = rhs_.resetn;
  this.error = rhs_.error;
  this.busy = rhs_.busy;
  this.pkt_valid = rhs_.pkt_valid;
  this.header = rhs_.header;
  foreach (rhs_.payload[i]) begin
    this.payload[i] = rhs_.payload[i];
  end
  this.parity = rhs_.parity;
endfunction : do_copy

function bit write_xtn::do_compare(uvm_object rhs, uvm_comparer comparer);
  write_xtn rhs_;
  bit check_payload;
  if (!$cast(rhs_, rhs)) `uvm_fatal("WRITE_XTN", "Cast failed");

  foreach (rhs_.payload[i]) begin
    check_payload = this.payload[i] == rhs_.payload[i];
  end

  return super.do_compare(
      rhs, comparer
  ) && this.resetn == rhs_.resetn && this.error == rhs_.error && this.busy == rhs_.busy &&
      this.pkt_valid == rhs_.pkt_valid && this.header == rhs_.header && check_payload &&
      this.parity == rhs_.parity;
endfunction : do_compare

function void write_xtn::do_print(uvm_printer printer);
  super.do_print(printer);
  printer.print_field("sim_time", $time, $bits($time), UVM_TIME);
  printer.print_field("resetn", this.resetn, $bits(this.resetn), UVM_DEC);
  printer.print_field("error", this.error, $bits(this.error), UVM_DEC);
  printer.print_field("busy", this.busy, $bits(this.busy), UVM_DEC);
  printer.print_field("pkt_vaild", this.pkt_valid, $bits(this.pkt_valid), UVM_DEC);
  printer.print_field("header", this.header, $bits(this.header), UVM_DEC);
  foreach (this.payload[i]) begin
    printer.print_field($sformatf("payload[%0d]", i), this.payload[i], $bits(this.payload[i]),
                        UVM_DEC);
  end
  printer.print_field("parity", this.parity, $bits(this.parity), UVM_DEC);
endfunction : do_print
