class router_env extends uvm_env;

  `uvm_component_utils(router_env)

  router_env_config env_cfg;

  v_sequencer vseqrh;
  wr_agent_top wagt_toph;
  rd_agent_top ragt_toph;
  router_sb sbh;

  extern function new(string name = "router_env", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass : router_env

function router_env::new(string name = "router_env", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void router_env::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(router_env_config)::get(this, "", "router_env_config", env_cfg))
    `uvm_fatal("ROUTER_ENV", "GET failed")

  if (env_cfg.has_virtual_sequencer) vseqrh = v_sequencer::type_id::create("vseqrh", this);
  if (env_cfg.has_wagt_top) begin
    wagt_toph = wr_agent_top::type_id::create("wagt_toph", this);
    uvm_config_db#(router_env_config)::set(this, "wagt_toph", "router_env_config", env_cfg);
  end
  if (env_cfg.has_ragt_top) begin
    ragt_toph = rd_agent_top::type_id::create("ragt_toph", this);
    uvm_config_db#(router_env_config)::set(this, "ragt_toph", "router_env_config", env_cfg);
  end
  if (env_cfg.has_scoreboard) begin
    sbh = router_sb::type_id::create("sbh", this);
    uvm_config_db#(router_env_config)::set(this, "sbh", "router_env_config", env_cfg);
  end

endfunction : build_phase

function void router_env::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  vseqrh.wseqrh = new[env_cfg.no_of_wr_agt];
  foreach (wagt_toph.wagnth[i]) begin
    vseqrh.wseqrh[i] = wagt_toph.wagnth[i].seqrh;
  end
  vseqrh.rseqrh = new[env_cfg.no_of_rd_agt];
  foreach (ragt_toph.ragnth[i]) begin
    vseqrh.rseqrh[i] = ragt_toph.ragnth[i].seqrh;
  end

  foreach (wagt_toph.wagnth[i]) begin
    wagt_toph.wagnth[i].monh.wmon2sb_port.connect(sbh.w_fifo_h[i].analysis_export);
  end
  foreach (ragt_toph.ragnth[i]) begin
    ragt_toph.ragnth[i].monh.rmon2sb_port.connect(sbh.r_fifo_h[i].analysis_export);
  end
endfunction : connect_phase
