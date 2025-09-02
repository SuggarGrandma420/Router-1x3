class v_sequencer extends uvm_sequencer #(uvm_sequence_item);

  `uvm_component_utils(v_sequencer)

  wr_sequencer wseqrh[];
  rd_sequencer rseqrh[];

  extern function new(string name = "v_sequencer", uvm_component parent);

endclass : v_sequencer

function v_sequencer::new(string name = "v_sequencer", uvm_component parent);
  super.new(name, parent);
endfunction : new
