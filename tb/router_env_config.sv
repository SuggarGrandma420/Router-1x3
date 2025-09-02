class router_env_config extends uvm_object;

  `uvm_object_utils(router_env_config)

  bit has_virtual_sequencer, has_wagt_top, has_ragt_top, has_scoreboard;
  int no_of_wr_agt, no_of_rd_agt;
  wr_agt_config w_cfg[];
  rd_agt_config r_cfg[];

  extern function new(string name = "router_env_config");

endclass : router_env_config

function router_env_config::new(string name = "router_env_config");
  super.new(name);
endfunction : new
