class wr_agt_config extends uvm_object;

  `uvm_object_utils(wr_agt_config)

  event DONE;

  virtual router_if vif;
  uvm_active_passive_enum is_active;

  extern function new(string name = "wr_agt_config");

endclass : wr_agt_config

function wr_agt_config::new(string name = "wr_agt_config");
  super.new(name);
endfunction : new
