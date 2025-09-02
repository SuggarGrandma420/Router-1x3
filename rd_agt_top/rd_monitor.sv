class rd_monitor extends uvm_monitor;

  `uvm_component_utils(rd_monitor)

  event DONE;

  uvm_analysis_port #(read_xtn) rmon2sb_port;

  static int sample_count;

  rd_agt_config r_cfg;
  virtual router_if.RD_MON_MP vif;

  extern function new(string name = "rd_monitor", uvm_component parent);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task sample_from_duv;

endclass : rd_monitor

function rd_monitor::new(string name = "rd_monitor", uvm_component parent);
  super.new(name, parent);
  rmon2sb_port = new("rmon2sb_port", this);
endfunction : new

function void rd_monitor::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if (!uvm_config_db#(rd_agt_config)::get(this, "", "rd_agt_config", r_cfg))
    `uvm_fatal("RD_MONITOR", "GET failed")

  vif = r_cfg.vif;
endfunction : connect_phase

task rd_monitor::run_phase(uvm_phase phase);
  forever begin
    sample_from_duv;
  end
endtask : run_phase

task rd_monitor::sample_from_duv;
  read_xtn xtnh = read_xtn::type_id::create("xtnh");

  while (vif.RD_MON_CB.read_enb !== 1) @(vif.RD_MON_CB);

  xtnh.vld_out = vif.RD_MON_CB.vld_out;
  xtnh.read_enb = vif.RD_MON_CB.read_enb;

  @(vif.RD_MON_CB);
  xtnh.header  = vif.RD_MON_CB.data_out;
  xtnh.payload = new[xtnh.header[7:2]];

  foreach (xtnh.payload[i]) begin
    @(vif.RD_MON_CB);

    while (vif.RD_MON_CB.read_enb !== 1) @(vif.RD_MON_CB);

    xtnh.payload[i] = vif.RD_MON_CB.data_out;
  end

  @(vif.RD_MON_CB);

  while (vif.RD_MON_CB.read_enb !== 1) @(vif.RD_MON_CB);

  xtnh.parity = vif.RD_MON_CB.data_out;

  rmon2sb_port.write(xtnh);

  @(vif.RD_MON_CB);

  xtnh.vld_out = vif.RD_MON_CB.vld_out;
  xtnh.read_enb = vif.RD_MON_CB.read_enb;
  rmon2sb_port.write(xtnh);

  `uvm_info("RD_MONITOR", $sformatf("\n%s", xtnh.sprint), UVM_MEDIUM)

  ->DONE;
endtask : sample_from_duv

