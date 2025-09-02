class wr_agent_top extends uvm_agent;

  `uvm_component_utils(wr_agent_top)

  router_env_config env_cfg;

  wr_agent wagnth[];

  extern function new(string name = "wr_agent_top", uvm_component parent);
  extern function void build_phase(uvm_phase phase);

endclass : wr_agent_top

function wr_agent_top::new(string name = "wr_agent_top", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void wr_agent_top::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(router_env_config)::get(this, "", "router_env_config", env_cfg))
    `uvm_fatal("WR_AGENT_TOP", "GET failed")

  wagnth = new[env_cfg.no_of_wr_agt];
  foreach (wagnth[i]) begin
    wagnth[i] = wr_agent::type_id::create($sformatf("wagnth[%0d]", i), this);
    uvm_config_db#(wr_agt_config)::set(this, $sformatf("wagnth[%0d]*", i), "wr_agt_config",
                                       env_cfg.w_cfg[i]);
  end
endfunction : build_phase
