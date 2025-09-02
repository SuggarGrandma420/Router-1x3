class v_sequence extends uvm_sequence #(uvm_sequence_item);

  `uvm_object_utils(v_sequence)

  v_sequencer vseqrh;

  wr_seq_payload_lt_14 wr_seq_payload_lt_14_h;
  wr_seq_payload_eq_14 wr_seq_payload_eq_14_h;
  wr_seq_payload_gt_14 wr_seq_payload_gt_14_h;
  wr_seq_wrong_parity wr_seq_wrong_parity_h;

  rd_seq_clock_count_lt_30 rd_seq_clock_count_lt_30_h;
  rd_seq_clock_count_gt_30 rd_seq_clock_count_gt_30_h;

  extern function new(string name = "v_sequence");
  extern task body;

endclass : v_sequence

function v_sequence::new(string name = "v_sequence");
  super.new(name);
endfunction : new

task v_sequence::body;
  if (!$cast(vseqrh, m_sequencer)) `uvm_fatal("V_SEQUENCE", "Cast failed")
endtask : body

class v_seq_payload_lt_14 extends v_sequence;

  `uvm_object_utils(v_seq_payload_lt_14)

  extern function new(string name = "v_seq_payload_lt_14");
  extern task body;

endclass : v_seq_payload_lt_14

function v_seq_payload_lt_14::new(string name = "v_seq_payload_lt_14");
  super.new(name);
endfunction : new

task v_seq_payload_lt_14::body;
  bit [1:0] address;
  super.body;

  if (!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("v_seq_payload_lt_14", "GET failed")

  wr_seq_payload_lt_14_h = wr_seq_payload_lt_14::type_id::create("wr_seq_payload_lt_14_h");

  rd_seq_clock_count_lt_30_h =
      rd_seq_clock_count_lt_30::type_id::create("rd_seq_clock_count_lt_30_h");

  fork
    wr_seq_payload_lt_14_h.start(vseqrh.wseqrh[0]);
    rd_seq_clock_count_lt_30_h.start(vseqrh.rseqrh[address]);
  join
endtask : body

class v_seq_payload_eq_14 extends v_sequence;

  `uvm_object_utils(v_seq_payload_eq_14)

  extern function new(string name = "v_seq_payload_eq_14");
  extern task body;

endclass : v_seq_payload_eq_14

function v_seq_payload_eq_14::new(string name = "v_seq_payload_eq_14");
  super.new(name);
endfunction : new

task v_seq_payload_eq_14::body;
  bit [1:0] address;
  super.body;

  if (!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("v_seq_payload_eq_14", "GET failed")

  wr_seq_payload_eq_14_h = wr_seq_payload_eq_14::type_id::create("wr_seq_payload_eq_14_h");

  rd_seq_clock_count_lt_30_h =
      rd_seq_clock_count_lt_30::type_id::create("rd_seq_clock_count_lt_30_h");

  fork
    wr_seq_payload_eq_14_h.start(vseqrh.wseqrh[0]);
    rd_seq_clock_count_lt_30_h.start(vseqrh.rseqrh[address]);
  join
endtask : body

class v_seq_payload_gt_14 extends v_sequence;

  `uvm_object_utils(v_seq_payload_gt_14)

  extern function new(string name = "v_seq_payload_gt_14");
  extern task body;

endclass : v_seq_payload_gt_14

function v_seq_payload_gt_14::new(string name = "v_seq_payload_gt_14");
  super.new(name);
endfunction : new

task v_seq_payload_gt_14::body;
  bit [1:0] address;
  super.body;

  if (!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("v_seq_payload_gt_14", "GET failed")

  wr_seq_payload_gt_14_h = wr_seq_payload_gt_14::type_id::create("wr_seq_payload_gt_14_h");

  rd_seq_clock_count_lt_30_h =
      rd_seq_clock_count_lt_30::type_id::create("rd_seq_clock_count_lt_30_h");

  fork
    wr_seq_payload_gt_14_h.start(vseqrh.wseqrh[0]);
    rd_seq_clock_count_lt_30_h.start(vseqrh.rseqrh[address]);
  join
endtask : body

class v_seq_wrong_parity extends v_sequence;

  `uvm_object_utils(v_seq_wrong_parity)

  extern function new(string name = "v_seq_wrong_parity");
  extern task body;

endclass : v_seq_wrong_parity

function v_seq_wrong_parity::new(string name = "v_seq_wrong_parity");
  super.new(name);
endfunction : new

task v_seq_wrong_parity::body;
  bit [1:0] address;
  super.body;

  if(!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("V_SEQ_WRONG_PARITY", "GET failed")

  wr_seq_wrong_parity_h = wr_seq_wrong_parity::type_id::create("wr_seq_wrong_parity_h");

  rd_seq_clock_count_lt_30_h =
      rd_seq_clock_count_lt_30::type_id::create("rd_seq_clock_count_lt_30_h");

  fork
    wr_seq_wrong_parity_h.start(vseqrh.wseqrh[0]);
    rd_seq_clock_count_lt_30_h.start(vseqrh.rseqrh[address]);
  join
endtask : body

class v_seq_clock_count_gt_30 extends v_sequence;

  `uvm_object_utils(v_seq_clock_count_gt_30)

  extern function new(string name = "v_seq_clock_count_gt_30");
  extern task body;

endclass : v_seq_clock_count_gt_30

function v_seq_clock_count_gt_30::new(string name = "v_seq_clock_count_gt_30");
  super.new(name);
endfunction : new

task v_seq_clock_count_gt_30::body;
  bit [1:0] address;
  super.body;

  if(!uvm_config_db#(bit [1:0])::get(null, get_full_name, "bit [1:0]", address))
    `uvm_fatal("V_SEQ_CLOCK_COUNT_GT_30", "GET failed")

  wr_seq_payload_gt_14_h = wr_seq_payload_gt_14::type_id::create("wr_seq_payload_gt_14_h");

  rd_seq_clock_count_gt_30_h = 
      rd_seq_clock_count_gt_30::type_id::create("rd_seq_clock_count_gt_30_h");

  fork
    wr_seq_payload_gt_14_h.start(vseqrh.wseqrh[0]);
    rd_seq_clock_count_gt_30_h.start(vseqrh.rseqrh[address]);
  join
endtask : body
