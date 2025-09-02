class rd_driver extends uvm_driver #(read_xtn);

  `uvm_component_utils(rd_driver)

  event DONE;

  rd_agt_config r_cfg;
  virtual router_if.RD_DRV_MP vif;

  extern function new(string name = "rd_driver", uvm_component parent);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task send_to_duv(read_xtn xtnh);

endclass : rd_driver

function rd_driver::new(string name = "rd_driver", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void rd_driver::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if (!uvm_config_db#(rd_agt_config)::get(this, "", "rd_agt_config", r_cfg))
    `uvm_fatal("RD_DRIVER", "GET failed")

  vif = r_cfg.vif;
endfunction : connect_phase

task rd_driver::run_phase(uvm_phase phase);
  @(vif.RD_DRV_CB);
  forever begin
    seq_item_port.get_next_item(req);
    send_to_duv(req);
    wait (DONE.triggered);
    seq_item_port.item_done;
  end
endtask : run_phase

task rd_driver::send_to_duv(read_xtn xtnh);
  `uvm_info("RD_DRIVER", $sformatf("\n%s", xtnh.sprint), UVM_MEDIUM)

  while (vif.RD_DRV_CB.vld_out !== 1) @(vif.RD_DRV_CB);

  repeat (xtnh.clock_count) @(vif.RD_DRV_CB);
  vif.RD_DRV_CB.read_enb <= 1'b1;

  while (vif.RD_DRV_CB.vld_out !== 0) @(vif.RD_DRV_CB);

  vif.RD_DRV_CB.read_enb <= 1'b0;
endtask : send_to_duv
