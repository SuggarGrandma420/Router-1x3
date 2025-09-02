class rd_agent_top extends uvm_agent;

  `uvm_component_utils(rd_agent_top)

  router_env_config env_cfg;

  rd_agent ragnth[];

  extern function new(string name = "rd_agent_top", uvm_component parent);
  extern function void build_phase(uvm_phase phase);

endclass : rd_agent_top

function rd_agent_top::new(string name = "rd_agent_top", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void rd_agent_top::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(router_env_config)::get(this, "", "router_env_config", env_cfg))
    `uvm_fatal("RD_AGENT_TOP", "GET failed")

  ragnth = new[env_cfg.no_of_rd_agt];
  foreach (ragnth[i]) begin
    ragnth[i] = rd_agent::type_id::create($sformatf("ragnth[%0d]", i), this);
    uvm_config_db#(rd_agt_config)::set(this, $sformatf("ragnth[%0d]*", i), "rd_agt_config",
                                       env_cfg.r_cfg[i]);
  end
endfunction : build_phase
