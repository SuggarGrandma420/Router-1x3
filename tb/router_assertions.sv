module router_assertions (
  clock,
  resetn,
  read_enb_0,
  read_enb_1,
  read_enb_2,
  data_in,
  pkt_valid,
  data_out_0,
  data_out_1,
  data_out_2,
  vld_out_0,
  vld_out_1,
  vld_out_2,
  error,
  busy
);

  input clock, resetn, read_enb_0, read_enb_1, read_enb_2, pkt_valid, vld_out_0, vld_out_1, vld_out_2, error, busy;
  input [7:0] data_in, data_out_0, data_out_1, data_out_2;

  sequence seq_reset;
    (data_out_0 == 0 && data_out_1 == 0 && data_out_2 == 0 && vld_out_0 == 0 && vld_out_1 == 0 && vld_out_2 == 0);
  endsequence : seq_reset
  
  property prty_reset;
    @(posedge clock) !resetn |=> seq_reset;
  endproperty : prty_reset

  property prty_busy_header;
    @(posedge clock) disable iff(!resetn) ($rose(pkt_valid)) |=> $rose(busy) ##1 $fell(busy);
  endproperty : prty_busy_header

  property prty_busy_parity;
    @(posedge clock) disable iff(!resetn) ($fell(pkt_valid)) |-> ##[0:1] $rose(busy);
  endproperty : prty_busy_parity

  property prty_stable_data;
    @(posedge clock) disable iff(!resetn) (busy) |=> (data_in == $past(data_in));
  endproperty : prty_stable_data

  property prty_valid_out;
    @(posedge clock) disable iff(!resetn) $rose(pkt_valid) |=> ##2 (vld_out_0 | vld_out_1 | vld_out_2);
  endproperty : prty_valid_out

  property prty_read_enb_0_high;
    @(posedge clock) disable iff(!resetn) $rose(vld_out_0) |=> ##[0:29] read_enb_0;
  endproperty : prty_read_enb_0_high

  property prty_read_enb_0_low;
    @(posedge clock) disable iff(!resetn) vld_out_0 ##1 !vld_out_0 |=> $fell(read_enb_0);
  endproperty : prty_read_enb_0_low

  property prty_read_enb_1_high;
    @(posedge clock) disable iff(!resetn) $rose(vld_out_1) |=> ##[0:29] read_enb_1;
  endproperty : prty_read_enb_1_high

  property prty_read_enb_1_low;
    @(posedge clock) disable iff(!resetn) vld_out_1 ##1 !vld_out_1 |=> $fell(read_enb_1);
  endproperty : prty_read_enb_1_low

  property prty_read_enb_2_high;
    @(posedge clock) disable iff(!resetn) $rose(vld_out_2) |=> ##[0:29] read_enb_2;
  endproperty : prty_read_enb_2_high

  property prty_read_enb_2_low;
    @(posedge clock) disable iff(!resetn) vld_out_2 ##1 !vld_out_2 |=> $fell(read_enb_2);
  endproperty : prty_read_enb_2_low

  RESET: assert property(prty_reset);
  BUSY_HEADER: assert property(prty_busy_header);
  BUSY_PARITY: assert property(prty_busy_parity);
  STABLE_DATA: assert property(prty_stable_data);
  VALID_OUT: assert property(prty_valid_out);
  READ_ENB_0_HIGH: assert property(prty_read_enb_0_high);
  READ_ENB_0_LOW: assert property(prty_read_enb_0_low);
  READ_ENB_1_HIGH: assert property(prty_read_enb_1_high);
  READ_ENB_1_LOW: assert property(prty_read_enb_1_low);
  READ_ENB_2_HIGH: assert property(prty_read_enb_2_high);
  READ_ENB_2_LOW: assert property(prty_read_enb_2_low);

endmodule : router_assertions
