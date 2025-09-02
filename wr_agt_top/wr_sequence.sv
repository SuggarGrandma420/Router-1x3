class wr_sequence extends uvm_sequence #(write_xtn);

  `uvm_object_utils(wr_sequence)

  extern function new(string name = "wr_sequence");

endclass : wr_sequence

function wr_sequence::new(string name = "wr_sequence");
  super.new(name);
endfunction : new

class wr_seq_payload_lt_14 extends wr_sequence;

  `uvm_object_utils(wr_seq_payload_lt_14)

  router_env_config env_cfg;

  extern function new(string name = "wr_seq_payload_lt_14");
  extern task body;

endclass : wr_seq_payload_lt_14

function wr_seq_payload_lt_14::new(string name = "wr_seq_payload_lt_14");
  super.new(name);
endfunction : new

task wr_seq_payload_lt_14::body;
  bit [1:0] address;
  if (!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("wr_seq_payload_lt_14", "GET failed")

  req = write_xtn::type_id::create("req");
  start_item(req);
  assert (req.randomize with {
    header[7:2] < 14;
    header[1:0] == address;
  });
  finish_item(req);
endtask : body

class wr_seq_payload_eq_14 extends wr_sequence;

  `uvm_object_utils(wr_seq_payload_eq_14)

  extern function new(string name = "wr_seq_payload_eq_14");
  extern task body;

endclass : wr_seq_payload_eq_14

function wr_seq_payload_eq_14::new(string name = "wr_seq_payload_eq_14");
  super.new(name);
endfunction : new

task wr_seq_payload_eq_14::body;
  bit [1:0] address;
  if (!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("wr_seq_payload_eq_14", "GET failed")

  req = write_xtn::type_id::create("req");
  start_item(req);
  assert (req.randomize with {
    header[7:2] == 14;
    header[1:0] == address;
  });
  finish_item(req);
endtask : body

class wr_seq_payload_gt_14 extends wr_sequence;

  `uvm_object_utils(wr_seq_payload_gt_14)

  extern function new(string name = "wr_seq_payload_gt_14");
  extern task body;

endclass : wr_seq_payload_gt_14

function wr_seq_payload_gt_14::new(string name = "wr_seq_payload_gt_14");
  super.new(name);
endfunction : new

task wr_seq_payload_gt_14::body;
  bit [1:0] address;
  if (!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("wr_seq_payload_gt_14", "GET failed")

  req = write_xtn::type_id::create("req");
  start_item(req);
  assert (req.randomize with {
    header[7:2] > 14;
    header[1:0] == address;
  });
  finish_item(req);
endtask : body

class wr_seq_wrong_parity extends wr_sequence;

  `uvm_object_utils(wr_seq_wrong_parity)

  extern function new(string name = "wr_seq_error_parity");
  extern task body;

endclass : wr_seq_wrong_parity

function wr_seq_wrong_parity::new(string name = "wr_seq_error_parity");
  super.new(name);
endfunction : new

task wr_seq_wrong_parity::body;
  bit [1:0] address;
  if (!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("wr_seq_wrong_parity", "GET failed")

  req = write_xtn::type_id::create("req");
  start_item(req);
  assert (req.randomize with {header[1:0] == address;});
  req.parity = 255;
  finish_item(req);
endtask : body
