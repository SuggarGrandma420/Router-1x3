package router_pkg;

  import uvm_pkg::*;

  `include "uvm_macros.svh"

  //Configure files
  `include "wr_agt_config.sv"
  `include "rd_agt_config.sv"
  `include "router_env_config.sv"

  //Level : Inside Write Agent
  `include "write_xtn.sv"
  `include "wr_driver.sv"
  `include "wr_monitor.sv"
  `include "wr_sequence.sv"
  `include "wr_sequencer.sv"

  //Level : Inside Read Agent
  `include "read_xtn.sv"
  `include "rd_driver.sv"
  `include "rd_monitor.sv"
  `include "rd_sequence.sv"
  `include "rd_sequencer.sv"

  //Level : Inside Agent Top
  `include "wr_agent.sv"
  `include "rd_agent.sv"

  //Level : Inside Environment
  `include "v_sequencer.sv"
  `include "wr_agent_top.sv"
  `include "rd_agent_top.sv"
  `include "router_sb.sv"

  //Level : Inside Test
  `include "v_sequence.sv"
  `include "router_env.sv"

  //Level : Inside Top
  `include "router_test_lib.sv"

endpackage : router_pkg
