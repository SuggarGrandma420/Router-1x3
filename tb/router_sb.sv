class router_sb extends uvm_scoreboard;

  `uvm_component_utils(router_sb)

  router_env_config env_cfg;

  int no_of_write_xtn, no_of_read_xtn, no_of_success_pkt, no_of_corrupt_pkt;

  bit [7:0] sb_wr_payload, sb_rd_payload;
  logic [7:0] parity;

  write_xtn wxtnh;
  read_xtn rxtnh;

  uvm_tlm_analysis_fifo #(write_xtn) w_fifo_h[];
  uvm_tlm_analysis_fifo #(read_xtn) r_fifo_h[];

  covergroup wr_cg;
    option.per_instance = 1;
    RESETN: coverpoint wxtnh.resetn {bins resetn[] = {[0 : $]};}
    PAYLOAD_LEN: coverpoint wxtnh.header[7:2] {
      bins payload_len[] = {[1 : $]}; illegal_bins illegal_payload_len = {0};
    }
    DESTN_ADDRESS: coverpoint wxtnh.header[1:0] {
      bins destn_address[] = {[0 : 2]}; illegal_bins illegal_address = {3};
    }
    PARITY: coverpoint wxtnh.parity {bins parity[] = {[0 : $]};}
    BUSY: coverpoint wxtnh.busy {bins busy[] = {[0 : $]};}
    ERROR: coverpoint wxtnh.error {bins error[] = {0, 1};}
  endgroup : wr_cg

  covergroup wr_pkt_valid_cg;
    option.per_instance = 1;
    PKT_VALID: coverpoint wxtnh.pkt_valid {bins pkt_valid[] = {[0 : $]};}
  endgroup : wr_pkt_valid_cg

  covergroup wr_cg_pay;
    option.per_instance = 1;
    PAYLOAD_DATA: coverpoint sb_wr_payload {bins payload_data[] = {[0 : $]};}
  endgroup : wr_cg_pay

  covergroup rd_cg;
    option.per_instance = 1;
    PAYLOAD_LEN: coverpoint rxtnh.header[7:2] {
      bins payload_len[] = {[1 : $]}; illegal_bins illegal_payload_len = {0};
    }
    DESTN_ADDRESS: coverpoint rxtnh.header[1:0] {
      bins destn_address[] = {[0 : 2]}; illegal_bins illegal_address = {3};
    }
    PARITY: coverpoint rxtnh.parity {bins parity[] = {[0 : $]};}
  endgroup : rd_cg

  covergroup rd_read_vld_cg;
    READ_ENB: coverpoint rxtnh.read_enb {bins read_enb[] = {[0 : $]};}
    VLD_OUT: coverpoint rxtnh.vld_out {bins vld_out[] = {[0 : $]};}
  endgroup : rd_read_vld_cg

  covergroup rd_cg_pay;
    option.per_instance = 1;
    PAYLOAD_DATA: coverpoint sb_rd_payload {bins payload_data[] = {[0 : $]};}
  endgroup : rd_cg_pay

  extern function new(string name = "router_sb", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function logic [7:0] parity_ref_model(write_xtn xtnh);
  extern task check_reset;
  extern task check_duv;
  extern task run_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);

endclass : router_sb

function router_sb::new(string name = "router_sb", uvm_component parent);
  super.new(name, parent);
  wr_cg = new;
  wr_pkt_valid_cg = new;
  wr_cg_pay = new;
  rd_cg = new;
  rd_read_vld_cg = new;
  rd_cg_pay = new;
endfunction : new

function void router_sb::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(router_env_config)::get(this, "", "router_env_config", env_cfg))
    `uvm_fatal("ROUTER_SB", "GET failed")
  w_fifo_h = new[env_cfg.no_of_wr_agt];
  foreach (w_fifo_h[i]) begin
    w_fifo_h[i] = new($sformatf("w_fifo_h[%0d]", i), this);
  end
  r_fifo_h = new[env_cfg.no_of_rd_agt];
  foreach (r_fifo_h[i]) begin
    r_fifo_h[i] = new($sformatf("r_fifo_h[%0d]", i), this);
  end
endfunction : build_phase

function logic [7:0] router_sb::parity_ref_model(write_xtn xtnh);
  logic [7:0] parity;
  parity = xtnh.header;
  foreach (xtnh.payload[i]) begin
    parity = parity ^ xtnh.payload[i];
  end
  return parity;
endfunction : parity_ref_model

task router_sb::check_reset;
  w_fifo_h[0].get(wxtnh);
  wr_cg.sample;
endtask : check_reset

task router_sb::check_duv;
  if (wxtnh.header == rxtnh.header && wxtnh.payload == rxtnh.payload && wxtnh.parity == rxtnh.parity && wxtnh.error == (parity != rxtnh.parity))
    no_of_success_pkt++;
  else begin
    $display("========================== Corrupt Packet ==========================");
    `uvm_warning("ROUTER_SB", $sformatf("Write TXN\n%s", wxtnh.sprint))
    `uvm_warning("ROUTER_SB", $sformatf("Read TXN\n%s", rxtnh.sprint))
    $display("====================================================================");
    no_of_corrupt_pkt++;
  end
endtask : check_duv

task router_sb::run_phase(uvm_phase phase);
  check_reset;
  forever begin
    fork
      begin
        w_fifo_h[0].get(wxtnh);
        wr_pkt_valid_cg.sample;

        w_fifo_h[0].get(wxtnh);
        wr_cg.sample;
        wr_pkt_valid_cg.sample;

        no_of_write_xtn++;

        parity = parity_ref_model(wxtnh);
      end
    join

    fork
      begin
        r_fifo_h[0].get(rxtnh);
        rd_cg.sample;
        rd_read_vld_cg.sample;

        r_fifo_h[0].get(rxtnh);
        rd_read_vld_cg.sample;

        no_of_read_xtn++;
      end
      begin
        r_fifo_h[1].get(rxtnh);
        rd_cg.sample;
        rd_read_vld_cg.sample;

        r_fifo_h[1].get(rxtnh);
        rd_read_vld_cg.sample;

        no_of_read_xtn++;
      end
      begin
        r_fifo_h[2].get(rxtnh);
        rd_cg.sample;
        rd_read_vld_cg.sample;

        r_fifo_h[2].get(rxtnh);
        rd_read_vld_cg.sample;

        no_of_read_xtn++;
      end
    join_any

    disable fork;

    check_duv;

    foreach (wxtnh.payload[i]) begin
      sb_wr_payload = wxtnh.payload[i];
      wr_cg_pay.sample;
    end

    foreach (rxtnh.payload[i]) begin
      sb_rd_payload = rxtnh.payload[i];
      rd_cg_pay.sample;
    end
  end
endtask : run_phase

function void router_sb::report_phase(uvm_phase phase);
  super.report_phase(phase);
  $display("===================== Scoreboard Result =====================");
  $display("Number of write transaction : %0d", no_of_write_xtn);
  $display("Number of read transaction  : %0d", no_of_read_xtn);
  $display("Number of success packets   : %0d", no_of_success_pkt);
  $display("Number of corrupt packets   : %0d", no_of_corrupt_pkt);
  $display("=============================================================");
endfunction : report_phase
