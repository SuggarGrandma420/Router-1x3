class wr_driver extends uvm_driver #(write_xtn);

  `uvm_component_utils(wr_driver)

  wr_agt_config w_cfg;
  virtual router_if.WR_DRV_MP vif;

  extern function new(string name = "wr_driver", uvm_component parent);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task reset_duv;
  extern task send_to_duv(write_xtn xtnh);

endclass : wr_driver

function wr_driver::new(string name = "wr_driver", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void wr_driver::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if (!uvm_config_db#(wr_agt_config)::get(this, "", "wr_agt_config", w_cfg))
    `uvm_fatal("WR_DRIVER", "GET failed")

  vif = w_cfg.vif;
endfunction : connect_phase

task wr_driver::run_phase(uvm_phase phase);
  reset_duv;
  forever begin
    seq_item_port.get_next_item(req);
    send_to_duv(req);
    seq_item_port.item_done;
  end
endtask : run_phase

task wr_driver::reset_duv;
  @(vif.WR_DRV_CB);
  vif.WR_DRV_CB.resetn <= 1'b0;
  @(vif.WR_DRV_CB);
  vif.WR_DRV_CB.resetn <= 1'b1;
endtask : reset_duv

task wr_driver::send_to_duv(write_xtn xtnh);
  `uvm_info("WR_DRIVER", $sformatf("\n%s", xtnh.sprint), UVM_MEDIUM)
  @(vif.WR_DRV_CB);

  while (vif.WR_DRV_CB.busy !== 0) @(vif.WR_DRV_CB);

  vif.WR_DRV_CB.pkt_valid <= 1'b1;
  vif.WR_DRV_CB.data_in   <= xtnh.header;

  foreach (xtnh.payload[i]) begin
    @(vif.WR_DRV_CB);

    while (vif.WR_DRV_CB.busy !== 0) @(vif.WR_DRV_CB);

    vif.WR_DRV_CB.data_in <= xtnh.payload[i];
  end

  @(vif.WR_DRV_CB);

  while (vif.WR_DRV_CB.busy !== 0) @(vif.WR_DRV_CB);

  vif.WR_DRV_CB.pkt_valid <= 1'b0;
  vif.WR_DRV_CB.data_in   <= xtnh.parity;
endtask : send_to_duv
