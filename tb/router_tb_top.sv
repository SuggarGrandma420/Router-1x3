module router_tb_top;

  import uvm_pkg::*;
  import router_pkg::*;

  logic clock;

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  router_if wr_in0 (clock);
  router_if rd_in0 (clock), rd_in1 (clock), rd_in2 (clock);

  router_top DUV (
      clock,
      wr_in0.resetn,
      rd_in0.read_enb,
      rd_in1.read_enb,
      rd_in2.read_enb,
      wr_in0.data_in,
      wr_in0.pkt_valid,
      rd_in0.data_out,
      rd_in1.data_out,
      rd_in2.data_out,
      rd_in0.vld_out,
      rd_in1.vld_out,
      rd_in2.vld_out,
      wr_in0.error,
      wr_in0.busy
  );

  bind DUV router_assertions ASS (
    clock,
     wr_in0.resetn,
     rd_in0.read_enb,
     rd_in1.read_enb,
     rd_in2.read_enb,
     wr_in0.data_in,
     wr_in0.pkt_valid,
     rd_in0.data_out,
     rd_in1.data_out,
     rd_in2.data_out,
     rd_in0.vld_out,
     rd_in1.vld_out,
     rd_in2.vld_out,
     wr_in0.error,
     wr_in0.busy
  );

  initial begin
    `ifdef VCS
    $fsdbDumpvars(0, router_tb_top);
    `endif

    uvm_config_db#(virtual router_if)::set(null, "uvm_test_top", "wr_in0", wr_in0);
    uvm_config_db#(virtual router_if)::set(null, "uvm_test_top", "rd_in0", rd_in0);
    uvm_config_db#(virtual router_if)::set(null, "uvm_test_top", "rd_in1", rd_in1);
    uvm_config_db#(virtual router_if)::set(null, "uvm_test_top", "rd_in2", rd_in2);

    run_test;
  end

endmodule : router_tb_top
