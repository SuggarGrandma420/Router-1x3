class wr_monitor extends uvm_monitor;

  `uvm_component_utils(wr_monitor)

  uvm_analysis_port #(write_xtn) wmon2sb_port;

  wr_agt_config w_cfg;
  virtual router_if.WR_MON_MP vif;

  extern function new(string name = "wr_monitor", uvm_component parent);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task sample_reset_from_duv;
  extern task sample_data_from_duv;

endclass : wr_monitor

function wr_monitor::new(string name = "wr_monitor", uvm_component parent);
  super.new(name, parent);
  wmon2sb_port = new("wmon2sb_port", this);
endfunction : new

function void wr_monitor::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if (!uvm_config_db#(wr_agt_config)::get(this, "", "wr_agt_config", w_cfg))
    `uvm_fatal("WR_MONITOR", "GET failed")

  vif = w_cfg.vif;
endfunction : connect_phase

task wr_monitor::run_phase(uvm_phase phase);
  sample_reset_from_duv;
  forever begin
    sample_data_from_duv;
  end
endtask : run_phase

task wr_monitor::sample_reset_from_duv;
  write_xtn xtnh = write_xtn::type_id::create("xtnh");
  repeat (2) @(vif.WR_MON_CB);
  xtnh.resetn = vif.WR_MON_CB.resetn;
  wmon2sb_port.write(xtnh);
endtask : sample_reset_from_duv

task wr_monitor::sample_data_from_duv;
  write_xtn xtnh = write_xtn::type_id::create("xtnh");

  xtnh.resetn = vif.WR_MON_CB.resetn;
  while (vif.WR_MON_CB.busy !== 0 || vif.WR_MON_CB.pkt_valid !== 1) @(vif.WR_MON_CB);

  xtnh.pkt_valid = vif.WR_MON_CB.pkt_valid;
  wmon2sb_port.write(xtnh);

  xtnh.header  = vif.WR_MON_CB.data_in;
  xtnh.payload = new[xtnh.header[7:2]];

  foreach (xtnh.payload[i]) begin
    @(vif.WR_MON_CB);

    while (vif.WR_MON_CB.busy !== 0 || vif.WR_MON_CB.pkt_valid !== 1) @(vif.WR_MON_CB);

    xtnh.payload[i] = vif.WR_MON_CB.data_in;
  end

  @(vif.WR_MON_CB);

  xtnh.pkt_valid = vif.WR_MON_CB.pkt_valid;
  while (vif.WR_MON_CB.busy !== 0 || vif.WR_MON_CB.pkt_valid !== 0) @(vif.WR_MON_CB);

  xtnh.parity = vif.WR_MON_CB.data_in;

  repeat (2) @(vif.WR_MON_CB);

  xtnh.busy = vif.WR_MON_CB.busy;
  while (vif.WR_MON_CB.busy !== 0) @(vif.WR_MON_CB);

  xtnh.error = vif.WR_MON_CB.error;

  wmon2sb_port.write(xtnh);

  `uvm_info("WR_MONITOR", $sformatf("\n%s", xtnh.sprint), UVM_MEDIUM)
endtask : sample_data_from_duv
