class router_test_lib extends uvm_test;

  `uvm_component_utils(router_test_lib)

  router_env_config env_cfg;
  wr_agt_config w_cfg[];
  rd_agt_config r_cfg[];

  bit [1:0] address;

  constraint c_address {
    address < 3;
  }

  int no_of_trans = 1000;

  bit has_virtual_sequencer = 1;
  bit has_wagt_top = 1;
  bit has_ragt_top = 1;
  bit has_scoreboard = 1;
  int no_of_wr_agt = 1;
  int no_of_rd_agt = 3;

  router_env envh;

  extern function new(string name = "router_test_lib", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);

endclass : router_test_lib

function router_test_lib::new(string name = "router_test_lib", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void router_test_lib::build_phase(uvm_phase phase);
  super.build_phase(phase);

  env_cfg = router_env_config::type_id::create("env_cfg");
  env_cfg.has_virtual_sequencer = has_virtual_sequencer;
  env_cfg.has_wagt_top = has_wagt_top;
  env_cfg.has_ragt_top = has_ragt_top;
  env_cfg.has_scoreboard = has_scoreboard;
  env_cfg.no_of_wr_agt = no_of_wr_agt;
  env_cfg.no_of_rd_agt = no_of_rd_agt;

  w_cfg = new[no_of_wr_agt];
  env_cfg.w_cfg = new[no_of_wr_agt];
  foreach (w_cfg[i]) begin
    w_cfg[i] = wr_agt_config::type_id::create($sformatf("w_cfg[%0d]", i));
    if (!uvm_config_db#(virtual router_if)::get(this, "", $sformatf("wr_in%0d", i), w_cfg[i].vif))
      `uvm_fatal("ROUTER_TEST_LIB", "GET failed")
    w_cfg[i].is_active = UVM_ACTIVE;
    env_cfg.w_cfg[i]   = w_cfg[i];
  end

  r_cfg = new[no_of_rd_agt];
  env_cfg.r_cfg = new[no_of_rd_agt];
  foreach (r_cfg[i]) begin
    r_cfg[i] = rd_agt_config::type_id::create($sformatf("r_cfg[%0d]", i));
    if (!uvm_config_db#(virtual router_if)::get(this, "", $sformatf("rd_in%0d", i), r_cfg[i].vif))
      `uvm_fatal("ROUTER_TEST_LIB", "GET failed")
    r_cfg[i].is_active = UVM_ACTIVE;
    env_cfg.r_cfg[i]   = r_cfg[i];
  end

  uvm_config_db#(router_env_config)::set(this, "envh", "router_env_config", env_cfg);

  envh = router_env::type_id::create("envh", this);
endfunction : build_phase

function void router_test_lib::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  uvm_top.print_topology;
endfunction : end_of_elaboration_phase

class test_payload_lt_14 extends router_test_lib;

  `uvm_component_utils(test_payload_lt_14)

  v_seq_payload_lt_14 v_seq_payload_lt_14_h;

  extern function new(string name = "test_payload_lt_14", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : test_payload_lt_14

function test_payload_lt_14::new(string name = "test_payload_lt_14", uvm_component parent);
  super.new(name, parent);
endfunction : new

task test_payload_lt_14::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  repeat (no_of_trans) begin
    v_seq_payload_lt_14_h = v_seq_payload_lt_14::type_id::create("v_seq_payload_lt_14_h");
    assert(this.randomize(address));
    uvm_config_db#(bit [1:0])::set(this, "*v_seq_payload_lt_14_h", "bit [1:0]", address);
    uvm_config_db#(bit [1:0])::set(this, "*wr_seq_payload_lt_14_h", "bit [1:0]", address);
    v_seq_payload_lt_14_h.start(envh.vseqrh);
  end
  phase.drop_objection(this);
endtask : run_phase

class test_payload_eq_14 extends router_test_lib;

  `uvm_component_utils(test_payload_eq_14)

  v_seq_payload_eq_14 v_seq_payload_eq_14_h;

  extern function new(string name = "test_payload_eq_14", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : test_payload_eq_14

function test_payload_eq_14::new(string name = "test_payload_eq_14", uvm_component parent);
  super.new(name, parent);
endfunction : new

task test_payload_eq_14::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  repeat (no_of_trans) begin
    v_seq_payload_eq_14_h = v_seq_payload_eq_14::type_id::create("v_seq_payload_eq_14_h");
    assert(this.randomize(address));
    uvm_config_db#(bit [1:0])::set(this, "*v_seq_payload_eq_14_h", "bit [1:0]", address);
    uvm_config_db#(bit [1:0])::set(this, "*wr_seq_payload_eq_14_h", "bit [1:0]", address);
    v_seq_payload_eq_14_h.start(envh.vseqrh);
  end
  phase.drop_objection(this);
endtask : run_phase

class test_payload_gt_14 extends router_test_lib;

  `uvm_component_utils(test_payload_gt_14)

  v_seq_payload_gt_14 v_seq_payload_gt_14_h;

  extern function new(string name = "test_payload_gt_14", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : test_payload_gt_14

function test_payload_gt_14::new(string name = "test_payload_gt_14", uvm_component parent);
  super.new(name, parent);
endfunction : new

task test_payload_gt_14::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  repeat (no_of_trans) begin
    v_seq_payload_gt_14_h = v_seq_payload_gt_14::type_id::create("v_seq_payload_gt_14_h");
    assert(this.randomize(address));
    uvm_config_db#(bit [1:0])::set(this, "*v_seq_payload_gt_14_h", "bit [1:0]", address);
    uvm_config_db#(bit [1:0])::set(this, "*wr_seq_payload_gt_14_h", "bit [1:0]", address);
    v_seq_payload_gt_14_h.start(envh.vseqrh);
  end
  phase.drop_objection(this);
endtask : run_phase

class test_wrong_parity extends router_test_lib;

  `uvm_component_utils(test_wrong_parity)

  v_seq_wrong_parity v_seq_wrong_parity_h;

  extern function new(string name = "test_wrong_parity", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : test_wrong_parity

function test_wrong_parity::new(string name = "test_wrong_parity", uvm_component parent);
  super.new(name, parent);
endfunction : new

task test_wrong_parity::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  repeat(no_of_trans) begin
    v_seq_wrong_parity_h = v_seq_wrong_parity::type_id::create("v_seq_wrong_parity_h");
    assert(this.randomize(address));
    uvm_config_db#(bit [1:0])::set(this, "*v_seq_wrong_parity_h", "bit [1:0]", address);
    uvm_config_db#(bit [1:0])::set(this, "*wr_seq_wrong_parity_h", "bit [1:0]", address);
    v_seq_wrong_parity_h.start(envh.vseqrh);
  end
  phase.drop_objection(this);
endtask : run_phase

class test_clock_count_gt_30 extends router_test_lib;

  `uvm_component_utils(test_clock_count_gt_30)

  v_seq_clock_count_gt_30 v_seq_clock_count_gt_30_h;

  extern function new(string name = "test_clock_count_gt_30", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : test_clock_count_gt_30

function test_clock_count_gt_30::new(string name = "test_clock_count_gt_30", uvm_component parent);
  super.new(name, parent);
endfunction : new

task test_clock_count_gt_30::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  repeat(no_of_trans) begin
    v_seq_clock_count_gt_30_h = v_seq_clock_count_gt_30::type_id::create("v_seq_clock_count_gt_30_h");
    assert(this.randomize(address));
    uvm_config_db#(bit [1:0])::set(this, "*v_seq_clock_count_gt_30_h", "bit [1:0]", address);
    uvm_config_db#(bit [1:0])::set(this, "*wr_seq_payload_gt_14_h", "bit [1:0]", address);
    v_seq_clock_count_gt_30_h.start(envh.vseqrh);
  end
  phase.drop_objection(this);
endtask : run_phase
