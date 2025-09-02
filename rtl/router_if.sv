interface router_if (
    input clock
);

  logic resetn, pkt_valid, read_enb, vld_out, error, busy;
  logic [7:0] data_in, data_out;

  clocking WR_DRV_CB @(posedge clock);
    default input #1 output #1;
    output resetn, pkt_valid, data_in;
    input busy, error;
  endclocking : WR_DRV_CB

  clocking WR_MON_CB @(posedge clock);
    default input #1 output #1;
    input resetn, pkt_valid, busy, error, data_in;
  endclocking : WR_MON_CB

  clocking RD_DRV_CB @(posedge clock);
    default input #1 output #1;
    output read_enb;
    input vld_out;
  endclocking : RD_DRV_CB

  clocking RD_MON_CB @(posedge clock);
    default input #1 output #1;
    input read_enb, vld_out, data_out;
  endclocking : RD_MON_CB

  modport WR_DRV_MP(clocking WR_DRV_CB);
  modport WR_MON_MP(clocking WR_MON_CB);
  modport RD_DRV_MP(clocking RD_DRV_CB);
  modport RD_MON_MP(clocking RD_MON_CB);

endinterface : router_if
