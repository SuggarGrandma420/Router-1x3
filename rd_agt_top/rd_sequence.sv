class rd_sequence extends uvm_sequence #(read_xtn);

  `uvm_object_utils(rd_sequence)

  extern function new(string name = "rd_sequence");

endclass : rd_sequence

function rd_sequence::new(string name = "rd_sequence");
  super.new(name);
endfunction : new

class rd_seq_clock_count_lt_30 extends rd_sequence;

  `uvm_object_utils(rd_seq_clock_count_lt_30)

  extern function new(string name = "rd_seq_clock_count_lt_30");
  extern task body;

endclass : rd_seq_clock_count_lt_30

function rd_seq_clock_count_lt_30::new(string name = "rd_seq_clock_count_lt_30");
  super.new(name);
endfunction : new

task rd_seq_clock_count_lt_30::body;
  req = read_xtn::type_id::create("req");
  start_item(req);
  assert (req.randomize with {clock_count inside {[0 : 29]};});
  finish_item(req);
endtask : body

class rd_seq_clock_count_gt_30 extends rd_sequence;

  `uvm_object_utils(rd_seq_clock_count_gt_30)

  extern function new(string name = "rd_seq_clock_count_gt_30");
  extern task body;

endclass : rd_seq_clock_count_gt_30

function rd_seq_clock_count_gt_30::new(string name = "rd_seq_clock_count_gt_30");
  super.new(name);
endfunction : new

task rd_seq_clock_count_gt_30::body;
  req = read_xtn::type_id::create("req");
  start_item(req);
  assert (req.randomize with {clock_count inside {[30 : 40]};});
  finish_item(req);
endtask : body
