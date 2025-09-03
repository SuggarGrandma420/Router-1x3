class wr_agent extends uvm_agent;

  `uvm_component_utils(wr_agent)

  wr_agt_config w_cfg;

  wr_sequencer seqrh;
  wr_driver drvh;
  wr_monitor monh;

  extern function new(string name = "wr_agent", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass : wr_agent

function wr_agent::new(string name = "wr_agent", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void wr_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(wr_agt_config)::get(this, "", "wr_agt_config", w_cfg))
    `uvm_fatal("WR_AGENT", "GET failed")

  monh = wr_monitor::type_id::create("monh", this);

  if (w_cfg.is_active == UVM_ACTIVE) begin
    drvh  = wr_driver::type_id::create("drvh", this);
    seqrh = wr_sequencer::type_id::create("seqrh", this);
  end
endfunction : build_phase

function void wr_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if (w_cfg.is_active == UVM_ACTIVE) drvh.seq_item_port.connect(seqrh.seq_item_export);
endfunction : connect_phase
