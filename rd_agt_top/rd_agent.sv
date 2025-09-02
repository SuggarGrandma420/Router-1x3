class rd_agent extends uvm_agent;

  `uvm_component_utils(rd_agent)

  event DONE;

  rd_agt_config r_cfg;

  rd_sequencer seqrh;
  rd_driver drvh;
  rd_monitor monh;

  extern function new(string name = "rd_agent", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass : rd_agent

function rd_agent::new(string name = "rd_agent", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void rd_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(rd_agt_config)::get(this, "", "rd_agt_config", r_cfg))
    `uvm_fatal("RD_AGENT", "GET failed")

  monh = rd_monitor::type_id::create("monh", this);
  monh.DONE = DONE;

  if (r_cfg.is_active == UVM_ACTIVE) begin
    drvh = rd_driver::type_id::create("drvh", this);
    drvh.DONE = DONE;
    seqrh = rd_sequencer::type_id::create("seqrh", this);
  end
endfunction : build_phase

function void rd_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drvh.seq_item_port.connect(seqrh.seq_item_export);
endfunction : connect_phase
