/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : T-2022.03-SP4
// Date      : Tue Sep  2 21:40:18 2025
/////////////////////////////////////////////////////////////


module router_fifo ( clock, resetn, write_enb, soft_reset, read_enb, data_in, 
        lfd_state, empty, full, data_out );
  input [7:0] data_in;
  output [7:0] data_out;
  input clock, resetn, write_enb, soft_reset, read_enb, lfd_state;
  output empty, full;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, lfd_state_reg, N36, N37, N38, N39,
         \mem[0][8] , \mem[0][7] , \mem[0][6] , \mem[0][5] , \mem[0][4] ,
         \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , \mem[1][8] ,
         \mem[1][7] , \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] ,
         \mem[1][2] , \mem[1][1] , \mem[1][0] , \mem[2][8] , \mem[2][7] ,
         \mem[2][6] , \mem[2][5] , \mem[2][4] , \mem[2][3] , \mem[2][2] ,
         \mem[2][1] , \mem[2][0] , \mem[3][8] , \mem[3][7] , \mem[3][6] ,
         \mem[3][5] , \mem[3][4] , \mem[3][3] , \mem[3][2] , \mem[3][1] ,
         \mem[3][0] , \mem[4][8] , \mem[4][7] , \mem[4][6] , \mem[4][5] ,
         \mem[4][4] , \mem[4][3] , \mem[4][2] , \mem[4][1] , \mem[4][0] ,
         \mem[5][8] , \mem[5][7] , \mem[5][6] , \mem[5][5] , \mem[5][4] ,
         \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] , \mem[6][8] ,
         \mem[6][7] , \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] ,
         \mem[6][2] , \mem[6][1] , \mem[6][0] , \mem[7][8] , \mem[7][7] ,
         \mem[7][6] , \mem[7][5] , \mem[7][4] , \mem[7][3] , \mem[7][2] ,
         \mem[7][1] , \mem[7][0] , \mem[8][8] , \mem[8][7] , \mem[8][6] ,
         \mem[8][5] , \mem[8][4] , \mem[8][3] , \mem[8][2] , \mem[8][1] ,
         \mem[8][0] , \mem[9][8] , \mem[9][7] , \mem[9][6] , \mem[9][5] ,
         \mem[9][4] , \mem[9][3] , \mem[9][2] , \mem[9][1] , \mem[9][0] ,
         \mem[10][8] , \mem[10][7] , \mem[10][6] , \mem[10][5] , \mem[10][4] ,
         \mem[10][3] , \mem[10][2] , \mem[10][1] , \mem[10][0] , \mem[11][8] ,
         \mem[11][7] , \mem[11][6] , \mem[11][5] , \mem[11][4] , \mem[11][3] ,
         \mem[11][2] , \mem[11][1] , \mem[11][0] , \mem[12][8] , \mem[12][7] ,
         \mem[12][6] , \mem[12][5] , \mem[12][4] , \mem[12][3] , \mem[12][2] ,
         \mem[12][1] , \mem[12][0] , \mem[13][8] , \mem[13][7] , \mem[13][6] ,
         \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] , \mem[13][1] ,
         \mem[13][0] , \mem[14][8] , \mem[14][7] , \mem[14][6] , \mem[14][5] ,
         \mem[14][4] , \mem[14][3] , \mem[14][2] , \mem[14][1] , \mem[14][0] ,
         \mem[15][8] , \mem[15][7] , \mem[15][6] , \mem[15][5] , \mem[15][4] ,
         \mem[15][3] , \mem[15][2] , \mem[15][1] , \mem[15][0] , N40, N41, N42,
         N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56,
         N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70,
         N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98,
         N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N130, N131, N132,
         N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143,
         payload_count_wire, N144, N145, N146, N147, N148, N149, N150, N151,
         N152, N153, N154, N155, N156, N157, N158, N159, N160, N161, N162,
         N163, N164, N165, N166, N167, N168, N169, N170, N171, N172, N173,
         N174, N175, N176, N177, N178, N179, N180, N181, N182, N183, N184,
         N185, N186, N187, N188, N189, N190, N191, N192, N193, N194, N195,
         N196, N197, N198, N199, N200, N201, N202, N203, N204, N205, N206,
         N207, N208, N209, N210, N211, N212, N213, N214, N215, N216, N217,
         N218, N219, N220, N221, N222, N223, N224, N225, N226, N227, N228,
         N229, N230, N231, N232, N233, N234, N235, N236, N237, N238, N239,
         N240, N241, N242, N243, N244, N245, N246, N247, N248, N249, N250,
         N251, N252, N253, N254, N255, N256, N257, N258, N259, N260, N261,
         N262, N263, N264, N265, N266, N267, N268, N269, N270, N271, N272,
         N273, N274, N275, N276, N277, N278, N279, N280, N281, N282, N283,
         N284, N285;
  wire   [4:0] write_ptr;
  wire   [4:0] read_ptr;
  wire   [6:0] payload_count;
  tri   [7:0] data_out;

  \**SEQGEN**  lfd_state_reg_reg ( .clear(1'b0), .preset(1'b0), .next_state(
        N36), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        lfd_state_reg), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \mem_reg[0][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N132), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[0][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[0][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[0][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[0][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[0][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[0][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[0][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[0][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[0][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N131) );
  \**SEQGEN**  \mem_reg[1][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N130), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[1][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[1][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[1][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[1][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[1][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[1][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[1][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[1][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[1][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N129) );
  \**SEQGEN**  \mem_reg[2][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N128), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[2][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[2][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[2][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[2][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[2][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[2][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[2][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[2][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[2][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N127) );
  \**SEQGEN**  \mem_reg[3][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N126), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[3][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[3][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[3][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[3][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[3][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[3][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[3][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[3][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[3][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N125) );
  \**SEQGEN**  \mem_reg[4][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N124), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[4][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[4][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[4][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[4][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[4][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[4][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[4][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[4][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[4][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N123) );
  \**SEQGEN**  \mem_reg[5][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N122), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[5][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[5][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[5][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[5][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[5][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[5][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[5][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[5][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[5][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N121) );
  \**SEQGEN**  \mem_reg[6][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N120), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[6][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[6][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[6][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[6][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[6][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[6][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[6][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[6][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[6][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N119) );
  \**SEQGEN**  \mem_reg[7][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N118), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[7][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[7][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[7][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[7][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[7][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[7][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[7][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[7][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[7][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N117) );
  \**SEQGEN**  \mem_reg[8][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N116), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[8][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[8][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[8][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[8][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[8][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[8][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[8][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[8][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[8][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  \mem_reg[9][8]  ( .clear(1'b0), .preset(1'b0), .next_state(N114), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][8] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[9][7]  ( .clear(1'b0), .preset(1'b0), .next_state(N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][7] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[9][6]  ( .clear(1'b0), .preset(1'b0), .next_state(N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][6] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[9][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[9][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[9][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[9][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[9][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[9][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[9][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N113) );
  \**SEQGEN**  \mem_reg[10][8]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N112), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[10][8] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[10][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[10][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[10][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[10][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[10][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[10][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[10][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[10][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[10][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[10][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[10][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[10][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[10][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[10][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[10][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[10][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N111) );
  \**SEQGEN**  \mem_reg[11][8]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N110), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[11][8] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[11][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[11][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[11][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[11][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[11][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[11][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[11][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[11][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[11][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[11][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[11][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[11][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[11][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[11][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[11][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[11][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N109) );
  \**SEQGEN**  \mem_reg[12][8]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N108), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[12][8] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[12][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[12][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[12][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[12][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[12][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[12][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[12][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[12][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[12][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[12][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[12][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[12][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[12][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[12][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[12][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[12][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N107) );
  \**SEQGEN**  \mem_reg[13][8]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N106), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[13][8] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[13][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[13][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[13][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[13][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[13][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[13][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[13][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[13][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[13][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[13][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[13][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[13][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[13][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[13][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[13][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[13][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N105) );
  \**SEQGEN**  \mem_reg[14][8]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N104), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[14][8] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[14][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[14][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[14][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[14][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[14][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[14][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[14][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[14][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[14][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[14][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[14][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[14][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[14][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[14][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[14][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[14][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N103) );
  \**SEQGEN**  \mem_reg[15][8]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N102), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[15][8] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N93) );
  \**SEQGEN**  \mem_reg[15][7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N101), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[15][7] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N93) );
  \**SEQGEN**  \mem_reg[15][6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N100), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        \mem[15][6] ), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N93) );
  \**SEQGEN**  \mem_reg[15][5]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[15][5] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N93) );
  \**SEQGEN**  \mem_reg[15][4]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[15][4] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N93) );
  \**SEQGEN**  \mem_reg[15][3]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[15][3] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N93) );
  \**SEQGEN**  \mem_reg[15][2]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[15][2] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N93) );
  \**SEQGEN**  \mem_reg[15][1]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[15][1] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N93) );
  \**SEQGEN**  \mem_reg[15][0]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(\mem[15][0] ), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N93) );
  \**SEQGEN**  \write_ptr_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N92), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        write_ptr[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N87) );
  \**SEQGEN**  \write_ptr_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N91), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        write_ptr[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N87) );
  \**SEQGEN**  \write_ptr_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N90), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        write_ptr[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N87) );
  \**SEQGEN**  \write_ptr_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N89), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        write_ptr[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N87) );
  \**SEQGEN**  \write_ptr_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N88), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        write_ptr[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N87) );
  \**SEQGEN**  \payload_count_reg[6]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N209), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(payload_count[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N202) );
  \**SEQGEN**  \payload_count_reg[5]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N208), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(payload_count[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N202) );
  \**SEQGEN**  \payload_count_reg[4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N207), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(payload_count[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N202) );
  \**SEQGEN**  \payload_count_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N206), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(payload_count[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N202) );
  \**SEQGEN**  \payload_count_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N205), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(payload_count[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N202) );
  \**SEQGEN**  \payload_count_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N204), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(payload_count[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N202) );
  \**SEQGEN**  \payload_count_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N203), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(payload_count[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N202) );
  \**SEQGEN**  \data_out_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N218), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(N225), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_tri_enable_reg[7]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N211), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(N226), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**TSGEN**  \data_out_tri[7]  ( .\function (N225), .three_state(N0), 
        .\output (data_out[7]) );
  GTECH_NOT I_0 ( .A(N227), .Z(N0) );
  \**SEQGEN**  \data_out_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N217), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(N228), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_tri_enable_reg[6]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N211), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(N229), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**TSGEN**  \data_out_tri[6]  ( .\function (N228), .three_state(N1), 
        .\output (data_out[6]) );
  GTECH_NOT I_1 ( .A(N230), .Z(N1) );
  \**SEQGEN**  \data_out_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N216), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(N231), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_tri_enable_reg[5]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N211), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(N232), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**TSGEN**  \data_out_tri[5]  ( .\function (N231), .three_state(N2), 
        .\output (data_out[5]) );
  GTECH_NOT I_2 ( .A(N233), .Z(N2) );
  \**SEQGEN**  \data_out_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N215), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(N234), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_tri_enable_reg[4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N211), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(N235), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**TSGEN**  \data_out_tri[4]  ( .\function (N234), .three_state(N3), 
        .\output (data_out[4]) );
  GTECH_NOT I_3 ( .A(N236), .Z(N3) );
  \**SEQGEN**  \data_out_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N214), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(N237), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_tri_enable_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N211), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(N238), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**TSGEN**  \data_out_tri[3]  ( .\function (N237), .three_state(N4), 
        .\output (data_out[3]) );
  GTECH_NOT I_4 ( .A(N239), .Z(N4) );
  \**SEQGEN**  \data_out_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N213), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(N240), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_tri_enable_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N211), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(N241), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**TSGEN**  \data_out_tri[2]  ( .\function (N240), .three_state(N5), 
        .\output (data_out[2]) );
  GTECH_NOT I_5 ( .A(N242), .Z(N5) );
  \**SEQGEN**  \data_out_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N212), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(N243), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_tri_enable_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N211), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(N244), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**TSGEN**  \data_out_tri[1]  ( .\function (N243), .three_state(N6), 
        .\output (data_out[1]) );
  GTECH_NOT I_6 ( .A(N245), .Z(N6) );
  \**SEQGEN**  \data_out_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N210), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(N246), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \data_out_tri_enable_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N211), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(N247), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**TSGEN**  \data_out_tri[0]  ( .\function (N246), .three_state(N7), 
        .\output (data_out[0]) );
  GTECH_NOT I_7 ( .A(N248), .Z(N7) );
  \**SEQGEN**  \read_ptr_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N201), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        read_ptr[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N196) );
  \**SEQGEN**  \read_ptr_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N200), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        read_ptr[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N196) );
  \**SEQGEN**  \read_ptr_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N199), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        read_ptr[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N196) );
  \**SEQGEN**  \read_ptr_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N198), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        read_ptr[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N196) );
  \**SEQGEN**  \read_ptr_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N197), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        read_ptr[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N196) );
  EQ_UNS_OP eq_70 ( .A(write_ptr), .B(read_ptr), .Z(N249) );
  GTECH_XOR2 C486 ( .A(write_ptr[4]), .B(read_ptr[4]), .Z(N250) );
  EQ_UNS_OP eq_71 ( .A(write_ptr[3:0]), .B(read_ptr[3:0]), .Z(N251) );
  GTECH_NOT I_8 ( .A(payload_count[0]), .Z(N253) );
  GTECH_OR2 C501 ( .A(payload_count[5]), .B(payload_count[6]), .Z(N254) );
  GTECH_OR2 C502 ( .A(payload_count[4]), .B(N254), .Z(N255) );
  GTECH_OR2 C503 ( .A(payload_count[3]), .B(N255), .Z(N256) );
  GTECH_OR2 C504 ( .A(payload_count[2]), .B(N256), .Z(N257) );
  GTECH_OR2 C505 ( .A(payload_count[1]), .B(N257), .Z(N258) );
  GTECH_OR2 C506 ( .A(N253), .B(N258), .Z(N259) );
  GTECH_NOT I_9 ( .A(N259), .Z(N260) );
  GTECH_OR2 C509 ( .A(payload_count[5]), .B(payload_count[6]), .Z(N261) );
  GTECH_OR2 C510 ( .A(payload_count[4]), .B(N261), .Z(N262) );
  GTECH_OR2 C511 ( .A(payload_count[3]), .B(N262), .Z(N263) );
  GTECH_OR2 C512 ( .A(payload_count[2]), .B(N263), .Z(N264) );
  GTECH_OR2 C513 ( .A(payload_count[1]), .B(N264), .Z(N265) );
  GTECH_OR2 C514 ( .A(N253), .B(N265), .Z(N266) );
  ADD_UNS_OP add_55 ( .A({N135, N136, N137, N138, N139, N140}), .B({1'b1, 1'b0}), .Z({N156, N155, N154, N153, N152, N151, N150}) );
  ADD_UNS_OP add_57 ( .A(read_ptr), .B(1'b1), .Z({N161, N160, N159, N158, N157}) );
  ADD_UNS_OP add_43 ( .A(write_ptr), .B(1'b1), .Z({N61, N60, N59, N58, N57})
         );
  SUB_UNS_OP sub_59 ( .A(payload_count), .B(1'b1), .Z({N169, N168, N167, N166, 
        N165, N164, N163}) );
  ADD_UNS_OP add_61 ( .A(read_ptr), .B(1'b1), .Z({N174, N173, N172, N171, N170}) );
  GTECH_AND2 C525 ( .A(write_ptr[2]), .B(write_ptr[3]), .Z(N267) );
  GTECH_AND2 C526 ( .A(N8), .B(write_ptr[3]), .Z(N268) );
  GTECH_NOT I_10 ( .A(write_ptr[2]), .Z(N8) );
  GTECH_AND2 C527 ( .A(write_ptr[2]), .B(N9), .Z(N269) );
  GTECH_NOT I_11 ( .A(write_ptr[3]), .Z(N9) );
  GTECH_AND2 C528 ( .A(N10), .B(N11), .Z(N270) );
  GTECH_NOT I_12 ( .A(write_ptr[2]), .Z(N10) );
  GTECH_NOT I_13 ( .A(write_ptr[3]), .Z(N11) );
  GTECH_AND2 C529 ( .A(write_ptr[0]), .B(write_ptr[1]), .Z(N271) );
  GTECH_AND2 C530 ( .A(N12), .B(write_ptr[1]), .Z(N272) );
  GTECH_NOT I_14 ( .A(write_ptr[0]), .Z(N12) );
  GTECH_AND2 C531 ( .A(write_ptr[0]), .B(N13), .Z(N273) );
  GTECH_NOT I_15 ( .A(write_ptr[1]), .Z(N13) );
  GTECH_AND2 C532 ( .A(N14), .B(N15), .Z(N274) );
  GTECH_NOT I_16 ( .A(write_ptr[0]), .Z(N14) );
  GTECH_NOT I_17 ( .A(write_ptr[1]), .Z(N15) );
  GTECH_AND2 C533 ( .A(N267), .B(N271), .Z(N56) );
  GTECH_AND2 C534 ( .A(N267), .B(N272), .Z(N55) );
  GTECH_AND2 C535 ( .A(N267), .B(N273), .Z(N54) );
  GTECH_AND2 C536 ( .A(N267), .B(N274), .Z(N53) );
  GTECH_AND2 C537 ( .A(N268), .B(N271), .Z(N52) );
  GTECH_AND2 C538 ( .A(N268), .B(N272), .Z(N51) );
  GTECH_AND2 C539 ( .A(N268), .B(N273), .Z(N50) );
  GTECH_AND2 C540 ( .A(N268), .B(N274), .Z(N49) );
  GTECH_AND2 C541 ( .A(N269), .B(N271), .Z(N48) );
  GTECH_AND2 C542 ( .A(N269), .B(N272), .Z(N47) );
  GTECH_AND2 C543 ( .A(N269), .B(N273), .Z(N46) );
  GTECH_AND2 C544 ( .A(N269), .B(N274), .Z(N45) );
  GTECH_AND2 C545 ( .A(N270), .B(N271), .Z(N44) );
  GTECH_AND2 C546 ( .A(N270), .B(N272), .Z(N43) );
  GTECH_AND2 C547 ( .A(N270), .B(N273), .Z(N42) );
  GTECH_AND2 C548 ( .A(N270), .B(N274), .Z(N41) );
  GTECH_AND2 C549 ( .A(write_ptr[2]), .B(write_ptr[3]), .Z(N275) );
  GTECH_AND2 C550 ( .A(N16), .B(write_ptr[3]), .Z(N276) );
  GTECH_NOT I_18 ( .A(write_ptr[2]), .Z(N16) );
  GTECH_AND2 C551 ( .A(write_ptr[2]), .B(N17), .Z(N277) );
  GTECH_NOT I_19 ( .A(write_ptr[3]), .Z(N17) );
  GTECH_AND2 C552 ( .A(N18), .B(N19), .Z(N278) );
  GTECH_NOT I_20 ( .A(write_ptr[2]), .Z(N18) );
  GTECH_NOT I_21 ( .A(write_ptr[3]), .Z(N19) );
  GTECH_AND2 C553 ( .A(write_ptr[0]), .B(write_ptr[1]), .Z(N279) );
  GTECH_AND2 C554 ( .A(N20), .B(write_ptr[1]), .Z(N280) );
  GTECH_NOT I_22 ( .A(write_ptr[0]), .Z(N20) );
  GTECH_AND2 C555 ( .A(write_ptr[0]), .B(N21), .Z(N281) );
  GTECH_NOT I_23 ( .A(write_ptr[1]), .Z(N21) );
  GTECH_AND2 C556 ( .A(N22), .B(N23), .Z(N282) );
  GTECH_NOT I_24 ( .A(write_ptr[0]), .Z(N22) );
  GTECH_NOT I_25 ( .A(write_ptr[1]), .Z(N23) );
  GTECH_AND2 C557 ( .A(N275), .B(N279), .Z(N86) );
  GTECH_AND2 C558 ( .A(N275), .B(N280), .Z(N85) );
  GTECH_AND2 C559 ( .A(N275), .B(N281), .Z(N84) );
  GTECH_AND2 C560 ( .A(N275), .B(N282), .Z(N83) );
  GTECH_AND2 C561 ( .A(N276), .B(N279), .Z(N82) );
  GTECH_AND2 C562 ( .A(N276), .B(N280), .Z(N81) );
  GTECH_AND2 C563 ( .A(N276), .B(N281), .Z(N80) );
  GTECH_AND2 C564 ( .A(N276), .B(N282), .Z(N79) );
  GTECH_AND2 C565 ( .A(N277), .B(N279), .Z(N78) );
  GTECH_AND2 C566 ( .A(N277), .B(N280), .Z(N77) );
  GTECH_AND2 C567 ( .A(N277), .B(N281), .Z(N76) );
  GTECH_AND2 C568 ( .A(N277), .B(N282), .Z(N75) );
  GTECH_AND2 C569 ( .A(N278), .B(N279), .Z(N74) );
  GTECH_AND2 C570 ( .A(N278), .B(N280), .Z(N73) );
  GTECH_AND2 C571 ( .A(N278), .B(N281), .Z(N72) );
  GTECH_AND2 C572 ( .A(N278), .B(N282), .Z(N71) );
  SELECT_OP C573 ( .DATA1(1'b0), .DATA2(lfd_state), .CONTROL1(N24), .CONTROL2(
        N35), .Z(N36) );
  GTECH_BUF B_0 ( .A(N34), .Z(N24) );
  SELECT_OP C574 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N24), 
        .CONTROL2(N133), .CONTROL3(N39), .Z(N87) );
  SELECT_OP C575 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N61, N60, 
        N59, N58, N57}), .CONTROL1(N24), .CONTROL2(N133), .Z({N92, N91, N90, 
        N89, N88}) );
  SELECT_OP C576 ( .DATA1({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .DATA2({N41, N42, 
        N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56}), 
        .DATA3({N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, 
        N83, N84, N85, N86}), .CONTROL1(N24), .CONTROL2(N133), .CONTROL3(N39), 
        .Z({N131, N129, N127, N125, N123, N121, N119, N117, N115, N113, N111, 
        N109, N107, N105, N103, N93}) );
  SELECT_OP C577 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({lfd_state_reg, lfd_state_reg, 
        lfd_state_reg, lfd_state_reg, lfd_state_reg, lfd_state_reg, 
        lfd_state_reg, lfd_state_reg, lfd_state_reg, lfd_state_reg, 
        lfd_state_reg, lfd_state_reg, lfd_state_reg, lfd_state_reg, 
        lfd_state_reg, lfd_state_reg, data_in}), .DATA3({N62, N62, N62, N62, 
        N62, N62, N62, N62, N62, N62, N62, N62, N62, N62, N62, N62, N63, N64, 
        N65, N66, N67, N68, N69, N70}), .CONTROL1(N24), .CONTROL2(N133), 
        .CONTROL3(N39), .Z({N132, N130, N128, N126, N124, N122, N120, N118, 
        N116, N114, N112, N110, N108, N106, N104, N102, N101, N100, N99, N98, 
        N97, N96, N95, N94}) );
  SELECT_OP C578 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N25), 
        .CONTROL2(N224), .CONTROL3(N149), .Z(N175) );
  GTECH_BUF B_1 ( .A(N134), .Z(N25) );
  SELECT_OP C579 ( .DATA1({N156, N155, N154, N153, N152, N151, N150}), .DATA2(
        {N169, N168, N167, N166, N165, N164, N163}), .CONTROL1(N25), 
        .CONTROL2(N224), .Z({N182, N181, N180, N179, N178, N177, N176}) );
  SELECT_OP C580 ( .DATA1({N135, N136, N137, N138, N139, N140, N141, N142}), 
        .DATA2({N135, N136, N137, N138, N139, N140, N141, N142}), .DATA3(
        data_out), .CONTROL1(N25), .CONTROL2(N224), .CONTROL3(N149), .Z({N190, 
        N189, N188, N187, N186, N185, N184, N183}) );
  SELECT_OP C581 ( .DATA1({N161, N160, N159, N158, N157}), .DATA2({N174, N173, 
        N172, N171, N170}), .CONTROL1(N25), .CONTROL2(N224), .Z({N195, N194, 
        N193, N192, N191}) );
  SELECT_OP C582 ( .DATA1(1'b1), .DATA2(N175), .DATA3(1'b0), .DATA4(1'b0), 
        .CONTROL1(N24), .CONTROL2(N219), .CONTROL3(N222), .CONTROL4(N146), .Z(
        N196) );
  SELECT_OP C583 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N195, N194, 
        N193, N192, N191}), .CONTROL1(N24), .CONTROL2(N219), .Z({N201, N200, 
        N199, N198, N197}) );
  SELECT_OP C584 ( .DATA1(1'b1), .DATA2(N175), .DATA3(1'b1), .DATA4(1'b0), 
        .CONTROL1(N24), .CONTROL2(N219), .CONTROL3(N222), .CONTROL4(N146), .Z(
        N202) );
  SELECT_OP C585 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(
        {N182, N181, N180, N179, N178, N177, N176}), .DATA3({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N24), .CONTROL2(N219), .CONTROL3(
        N222), .Z({N209, N208, N207, N206, N205, N204, N203}) );
  SELECT_OP C586 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .DATA2({N190, N189, N188, N187, N186, N185, N184, N183}), .DATA3(
        data_out), .CONTROL1(N24), .CONTROL2(N219), .CONTROL3(N146), .Z({N218, 
        N217, N216, N215, N214, N213, N212, N210}) );
  SELECT_OP C587 ( .DATA1(resetn), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .CONTROL1(N24), .CONTROL2(N219), .CONTROL3(N222), .CONTROL4(N146), .Z(
        N211) );
  MUX_OP C588 ( .D0({\mem[0][0] , \mem[0][1] , \mem[0][2] , \mem[0][3] , 
        \mem[0][4] , \mem[0][5] , \mem[0][6] , \mem[0][7] , \mem[0][8] }), 
        .D1({\mem[1][0] , \mem[1][1] , \mem[1][2] , \mem[1][3] , \mem[1][4] , 
        \mem[1][5] , \mem[1][6] , \mem[1][7] , \mem[1][8] }), .D2({\mem[2][0] , 
        \mem[2][1] , \mem[2][2] , \mem[2][3] , \mem[2][4] , \mem[2][5] , 
        \mem[2][6] , \mem[2][7] , \mem[2][8] }), .D3({\mem[3][0] , \mem[3][1] , 
        \mem[3][2] , \mem[3][3] , \mem[3][4] , \mem[3][5] , \mem[3][6] , 
        \mem[3][7] , \mem[3][8] }), .D4({\mem[4][0] , \mem[4][1] , \mem[4][2] , 
        \mem[4][3] , \mem[4][4] , \mem[4][5] , \mem[4][6] , \mem[4][7] , 
        \mem[4][8] }), .D5({\mem[5][0] , \mem[5][1] , \mem[5][2] , \mem[5][3] , 
        \mem[5][4] , \mem[5][5] , \mem[5][6] , \mem[5][7] , \mem[5][8] }), 
        .D6({\mem[6][0] , \mem[6][1] , \mem[6][2] , \mem[6][3] , \mem[6][4] , 
        \mem[6][5] , \mem[6][6] , \mem[6][7] , \mem[6][8] }), .D7({\mem[7][0] , 
        \mem[7][1] , \mem[7][2] , \mem[7][3] , \mem[7][4] , \mem[7][5] , 
        \mem[7][6] , \mem[7][7] , \mem[7][8] }), .D8({\mem[8][0] , \mem[8][1] , 
        \mem[8][2] , \mem[8][3] , \mem[8][4] , \mem[8][5] , \mem[8][6] , 
        \mem[8][7] , \mem[8][8] }), .D9({\mem[9][0] , \mem[9][1] , \mem[9][2] , 
        \mem[9][3] , \mem[9][4] , \mem[9][5] , \mem[9][6] , \mem[9][7] , 
        \mem[9][8] }), .D10({\mem[10][0] , \mem[10][1] , \mem[10][2] , 
        \mem[10][3] , \mem[10][4] , \mem[10][5] , \mem[10][6] , \mem[10][7] , 
        \mem[10][8] }), .D11({\mem[11][0] , \mem[11][1] , \mem[11][2] , 
        \mem[11][3] , \mem[11][4] , \mem[11][5] , \mem[11][6] , \mem[11][7] , 
        \mem[11][8] }), .D12({\mem[12][0] , \mem[12][1] , \mem[12][2] , 
        \mem[12][3] , \mem[12][4] , \mem[12][5] , \mem[12][6] , \mem[12][7] , 
        \mem[12][8] }), .D13({\mem[13][0] , \mem[13][1] , \mem[13][2] , 
        \mem[13][3] , \mem[13][4] , \mem[13][5] , \mem[13][6] , \mem[13][7] , 
        \mem[13][8] }), .D14({\mem[14][0] , \mem[14][1] , \mem[14][2] , 
        \mem[14][3] , \mem[14][4] , \mem[14][5] , \mem[14][6] , \mem[14][7] , 
        \mem[14][8] }), .D15({\mem[15][0] , \mem[15][1] , \mem[15][2] , 
        \mem[15][3] , \mem[15][4] , \mem[15][5] , \mem[15][6] , \mem[15][7] , 
        \mem[15][8] }), .S0(N26), .S1(N27), .S2(N28), .S3(N29), .Z({N70, N69, 
        N68, N67, N66, N65, N64, N63, N62}) );
  GTECH_BUF B_2 ( .A(write_ptr[0]), .Z(N26) );
  GTECH_BUF B_3 ( .A(write_ptr[1]), .Z(N27) );
  GTECH_BUF B_4 ( .A(write_ptr[2]), .Z(N28) );
  GTECH_BUF B_5 ( .A(write_ptr[3]), .Z(N29) );
  MUX_OP C589 ( .D0({\mem[0][0] , \mem[0][1] , \mem[0][2] , \mem[0][3] , 
        \mem[0][4] , \mem[0][5] , \mem[0][6] , \mem[0][7] , \mem[0][8] }), 
        .D1({\mem[1][0] , \mem[1][1] , \mem[1][2] , \mem[1][3] , \mem[1][4] , 
        \mem[1][5] , \mem[1][6] , \mem[1][7] , \mem[1][8] }), .D2({\mem[2][0] , 
        \mem[2][1] , \mem[2][2] , \mem[2][3] , \mem[2][4] , \mem[2][5] , 
        \mem[2][6] , \mem[2][7] , \mem[2][8] }), .D3({\mem[3][0] , \mem[3][1] , 
        \mem[3][2] , \mem[3][3] , \mem[3][4] , \mem[3][5] , \mem[3][6] , 
        \mem[3][7] , \mem[3][8] }), .D4({\mem[4][0] , \mem[4][1] , \mem[4][2] , 
        \mem[4][3] , \mem[4][4] , \mem[4][5] , \mem[4][6] , \mem[4][7] , 
        \mem[4][8] }), .D5({\mem[5][0] , \mem[5][1] , \mem[5][2] , \mem[5][3] , 
        \mem[5][4] , \mem[5][5] , \mem[5][6] , \mem[5][7] , \mem[5][8] }), 
        .D6({\mem[6][0] , \mem[6][1] , \mem[6][2] , \mem[6][3] , \mem[6][4] , 
        \mem[6][5] , \mem[6][6] , \mem[6][7] , \mem[6][8] }), .D7({\mem[7][0] , 
        \mem[7][1] , \mem[7][2] , \mem[7][3] , \mem[7][4] , \mem[7][5] , 
        \mem[7][6] , \mem[7][7] , \mem[7][8] }), .D8({\mem[8][0] , \mem[8][1] , 
        \mem[8][2] , \mem[8][3] , \mem[8][4] , \mem[8][5] , \mem[8][6] , 
        \mem[8][7] , \mem[8][8] }), .D9({\mem[9][0] , \mem[9][1] , \mem[9][2] , 
        \mem[9][3] , \mem[9][4] , \mem[9][5] , \mem[9][6] , \mem[9][7] , 
        \mem[9][8] }), .D10({\mem[10][0] , \mem[10][1] , \mem[10][2] , 
        \mem[10][3] , \mem[10][4] , \mem[10][5] , \mem[10][6] , \mem[10][7] , 
        \mem[10][8] }), .D11({\mem[11][0] , \mem[11][1] , \mem[11][2] , 
        \mem[11][3] , \mem[11][4] , \mem[11][5] , \mem[11][6] , \mem[11][7] , 
        \mem[11][8] }), .D12({\mem[12][0] , \mem[12][1] , \mem[12][2] , 
        \mem[12][3] , \mem[12][4] , \mem[12][5] , \mem[12][6] , \mem[12][7] , 
        \mem[12][8] }), .D13({\mem[13][0] , \mem[13][1] , \mem[13][2] , 
        \mem[13][3] , \mem[13][4] , \mem[13][5] , \mem[13][6] , \mem[13][7] , 
        \mem[13][8] }), .D14({\mem[14][0] , \mem[14][1] , \mem[14][2] , 
        \mem[14][3] , \mem[14][4] , \mem[14][5] , \mem[14][6] , \mem[14][7] , 
        \mem[14][8] }), .D15({\mem[15][0] , \mem[15][1] , \mem[15][2] , 
        \mem[15][3] , \mem[15][4] , \mem[15][5] , \mem[15][6] , \mem[15][7] , 
        \mem[15][8] }), .S0(N30), .S1(N31), .S2(N32), .S3(N33), .Z({N142, N141, 
        N140, N139, N138, N137, N136, N135, N134}) );
  GTECH_BUF B_6 ( .A(read_ptr[0]), .Z(N30) );
  GTECH_BUF B_7 ( .A(read_ptr[1]), .Z(N31) );
  GTECH_BUF B_8 ( .A(read_ptr[2]), .Z(N32) );
  GTECH_BUF B_9 ( .A(read_ptr[3]), .Z(N33) );
  GTECH_OR2 C592 ( .A(N283), .B(soft_reset), .Z(N34) );
  GTECH_NOT I_26 ( .A(resetn), .Z(N283) );
  GTECH_NOT I_27 ( .A(N34), .Z(N35) );
  GTECH_AND2 C596 ( .A(write_enb), .B(N284), .Z(N37) );
  GTECH_NOT I_28 ( .A(full), .Z(N284) );
  GTECH_OR2 C600 ( .A(N37), .B(N34), .Z(N38) );
  GTECH_NOT I_29 ( .A(N38), .Z(N39) );
  GTECH_BUF B_10 ( .A(N133), .Z(N40) );
  GTECH_AND2 C604 ( .A(N37), .B(N35), .Z(N133) );
  GTECH_AND2 C605 ( .A(N40), .B(N35) );
  GTECH_AND2 C606 ( .A(read_enb), .B(N285), .Z(N143) );
  GTECH_NOT I_30 ( .A(empty), .Z(N285) );
  GTECH_OR2 C611 ( .A(N143), .B(N34), .Z(N144) );
  GTECH_OR2 C612 ( .A(payload_count_wire), .B(N144), .Z(N145) );
  GTECH_NOT I_31 ( .A(N145), .Z(N146) );
  GTECH_BUF B_11 ( .A(N219), .Z(N147) );
  GTECH_OR2 C618 ( .A(N266), .B(N134), .Z(N148) );
  GTECH_NOT I_32 ( .A(N148), .Z(N149) );
  GTECH_AND2 C620 ( .A(N147), .B(N134) );
  GTECH_AND2 C621 ( .A(N147), .B(N224), .Z(N162) );
  GTECH_AND2 C623 ( .A(N143), .B(N35), .Z(N219) );
  GTECH_NOT I_33 ( .A(N143), .Z(N220) );
  GTECH_AND2 C625 ( .A(N35), .B(N220), .Z(N221) );
  GTECH_AND2 C626 ( .A(payload_count_wire), .B(N221), .Z(N222) );
  GTECH_NOT I_34 ( .A(N134), .Z(N223) );
  GTECH_AND2 C628 ( .A(N266), .B(N223), .Z(N224) );
  GTECH_AND2 C629 ( .A(N162), .B(N223) );
  GTECH_NOT I_35 ( .A(N226), .Z(N227) );
  GTECH_NOT I_36 ( .A(N229), .Z(N230) );
  GTECH_NOT I_37 ( .A(N232), .Z(N233) );
  GTECH_NOT I_38 ( .A(N235), .Z(N236) );
  GTECH_NOT I_39 ( .A(N238), .Z(N239) );
  GTECH_NOT I_40 ( .A(N241), .Z(N242) );
  GTECH_NOT I_41 ( .A(N244), .Z(N245) );
  GTECH_NOT I_42 ( .A(N247), .Z(N248) );
  GTECH_BUF B_12 ( .A(N249), .Z(empty) );
  GTECH_AND2 C639 ( .A(N250), .B(N251), .Z(N252) );
  GTECH_BUF B_13 ( .A(N252), .Z(full) );
  GTECH_BUF B_14 ( .A(N260), .Z(payload_count_wire) );
endmodule


module router_sync ( clock, resetn, detect_add, data_in, write_enb_reg, 
        read_enb_0, read_enb_1, read_enb_2, empty_0, empty_1, empty_2, full_0, 
        full_1, full_2, vld_out_0, vld_out_1, vld_out_2, write_enb, fifo_full, 
        soft_reset_0, soft_reset_1, soft_reset_2 );
  input [1:0] data_in;
  output [2:0] write_enb;
  input clock, resetn, detect_add, write_enb_reg, read_enb_0, read_enb_1,
         read_enb_2, empty_0, empty_1, empty_2, full_0, full_1, full_2;
  output vld_out_0, vld_out_1, vld_out_2, fifo_full, soft_reset_0,
         soft_reset_1, soft_reset_2;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120;
  wire   [1:0] addr_reg;
  wire   [4:0] clk_counter_0;
  wire   [4:0] clk_counter_1;
  wire   [4:0] clk_counter_2;

  \**SEQGEN**  \addr_reg_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N17), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        addr_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N15) );
  \**SEQGEN**  \addr_reg_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N16), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        addr_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N15) );
  GTECH_AND2 C25 ( .A(N20), .B(N21), .Z(N22) );
  GTECH_OR2 C27 ( .A(addr_reg[1]), .B(N21), .Z(N23) );
  GTECH_OR2 C30 ( .A(N20), .B(addr_reg[0]), .Z(N25) );
  GTECH_AND2 C32 ( .A(addr_reg[1]), .B(addr_reg[0]), .Z(N27) );
  GTECH_AND2 C50 ( .A(N20), .B(N21), .Z(N31) );
  GTECH_OR2 C52 ( .A(addr_reg[1]), .B(N21), .Z(N32) );
  GTECH_OR2 C55 ( .A(N20), .B(addr_reg[0]), .Z(N34) );
  GTECH_AND2 C57 ( .A(addr_reg[1]), .B(addr_reg[0]), .Z(N36) );
  LT_UNS_OP lt_77 ( .A(clk_counter_0), .B({1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), .Z(
        N40) );
  \**SEQGEN**  soft_reset_0_reg ( .clear(1'b0), .preset(1'b0), .next_state(N55), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(soft_reset_0), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_0_reg[4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N60), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_0[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_0_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N59), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_0[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_0_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N58), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_0[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_0_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N57), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_0[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_0_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N56), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_0[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  LT_UNS_OP lt_101 ( .A(clk_counter_1), .B({1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), 
        .Z(N67) );
  \**SEQGEN**  soft_reset_1_reg ( .clear(1'b0), .preset(1'b0), .next_state(N82), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(soft_reset_1), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_1_reg[4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N87), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_1[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_1_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N86), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_1[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_1_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N85), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_1[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_1_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N84), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_1[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_1_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N83), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_1[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  LT_UNS_OP lt_125 ( .A(clk_counter_2), .B({1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), 
        .Z(N94) );
  \**SEQGEN**  soft_reset_2_reg ( .clear(1'b0), .preset(1'b0), .next_state(
        N109), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        soft_reset_2), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_2_reg[4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N114), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_2[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_2_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N113), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_2[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_2_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N112), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_2[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_2_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N111), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_2[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \clk_counter_2_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N110), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(clk_counter_2[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  ADD_UNS_OP add_78 ( .A(clk_counter_0), .B(1'b1), .Z({N48, N47, N46, N45, N44}) );
  ADD_UNS_OP add_102 ( .A(clk_counter_1), .B(1'b1), .Z({N75, N74, N73, N72, 
        N71}) );
  ADD_UNS_OP add_126 ( .A(clk_counter_2), .B(1'b1), .Z({N102, N101, N100, N99, 
        N98}) );
  SELECT_OP C207 ( .DATA1({1'b0, 1'b0}), .DATA2(data_in), .CONTROL1(N0), 
        .CONTROL2(N18), .Z({N17, N16}) );
  GTECH_BUF B_0 ( .A(N14), .Z(N0) );
  SELECT_OP C208 ( .DATA1({1'b0, 1'b0, 1'b1}), .DATA2({1'b0, 1'b1, 1'b0}), 
        .DATA3({1'b1, 1'b0, 1'b0}), .DATA4({1'b0, 1'b0, 1'b0}), .CONTROL1(N1), 
        .CONTROL2(N2), .CONTROL3(N3), .CONTROL4(N4), .Z({N30, N29, N28}) );
  GTECH_BUF B_1 ( .A(N22), .Z(N1) );
  GTECH_BUF B_2 ( .A(N24), .Z(N2) );
  GTECH_BUF B_3 ( .A(N26), .Z(N3) );
  GTECH_BUF B_4 ( .A(N27), .Z(N4) );
  SELECT_OP C209 ( .DATA1({N30, N29, N28}), .DATA2({1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N5), .CONTROL2(N6), .Z(write_enb) );
  GTECH_BUF B_5 ( .A(write_enb_reg), .Z(N5) );
  GTECH_BUF B_6 ( .A(N19), .Z(N6) );
  SELECT_OP C210 ( .DATA1(full_0), .DATA2(full_1), .DATA3(full_2), .DATA4(1'b0), .CONTROL1(N7), .CONTROL2(N8), .CONTROL3(N9), .CONTROL4(N10), .Z(fifo_full)
         );
  GTECH_BUF B_7 ( .A(N31), .Z(N7) );
  GTECH_BUF B_8 ( .A(N33), .Z(N8) );
  GTECH_BUF B_9 ( .A(N35), .Z(N9) );
  GTECH_BUF B_10 ( .A(N36), .Z(N10) );
  SELECT_OP C211 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N48, N47, 
        N46, N45, N44}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N11), .CONTROL2(N63), .CONTROL3(N42), .Z({N53, N52, N51, N50, N49}) );
  GTECH_BUF B_11 ( .A(read_enb_0), .Z(N11) );
  SELECT_OP C212 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .CONTROL1(N11), 
        .CONTROL2(N63), .CONTROL3(N42), .Z(N54) );
  SELECT_OP C213 ( .DATA1(1'b0), .DATA2(N54), .DATA3(1'b0), .CONTROL1(N0), 
        .CONTROL2(N61), .CONTROL3(N38), .Z(N55) );
  SELECT_OP C214 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N53, N52, 
        N51, N50, N49}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N0), 
        .CONTROL2(N61), .CONTROL3(N38), .Z({N60, N59, N58, N57, N56}) );
  SELECT_OP C215 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N75, N74, 
        N73, N72, N71}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N12), .CONTROL2(N90), .CONTROL3(N69), .Z({N80, N79, N78, N77, N76}) );
  GTECH_BUF B_12 ( .A(read_enb_1), .Z(N12) );
  SELECT_OP C216 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .CONTROL1(N12), 
        .CONTROL2(N90), .CONTROL3(N69), .Z(N81) );
  SELECT_OP C217 ( .DATA1(1'b0), .DATA2(N81), .DATA3(1'b0), .CONTROL1(N0), 
        .CONTROL2(N88), .CONTROL3(N65), .Z(N82) );
  SELECT_OP C218 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N80, N79, 
        N78, N77, N76}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N0), 
        .CONTROL2(N88), .CONTROL3(N65), .Z({N87, N86, N85, N84, N83}) );
  SELECT_OP C219 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N102, N101, 
        N100, N99, N98}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(
        N13), .CONTROL2(N117), .CONTROL3(N96), .Z({N107, N106, N105, N104, 
        N103}) );
  GTECH_BUF B_13 ( .A(read_enb_2), .Z(N13) );
  SELECT_OP C220 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .CONTROL1(N13), 
        .CONTROL2(N117), .CONTROL3(N96), .Z(N108) );
  SELECT_OP C221 ( .DATA1(1'b0), .DATA2(N108), .DATA3(1'b0), .CONTROL1(N0), 
        .CONTROL2(N115), .CONTROL3(N92), .Z(N109) );
  SELECT_OP C222 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N107, N106, 
        N105, N104, N103}), .DATA3({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(
        N0), .CONTROL2(N115), .CONTROL3(N92), .Z({N114, N113, N112, N111, N110}) );
  GTECH_NOT I_0 ( .A(resetn), .Z(N14) );
  GTECH_OR2 C228 ( .A(detect_add), .B(N14), .Z(N15) );
  GTECH_AND2 C231 ( .A(detect_add), .B(resetn), .Z(N18) );
  GTECH_NOT I_1 ( .A(write_enb_reg), .Z(N19) );
  GTECH_NOT I_2 ( .A(addr_reg[1]), .Z(N20) );
  GTECH_NOT I_3 ( .A(addr_reg[0]), .Z(N21) );
  GTECH_NOT I_4 ( .A(N23), .Z(N24) );
  GTECH_NOT I_5 ( .A(N25), .Z(N26) );
  GTECH_NOT I_6 ( .A(N32), .Z(N33) );
  GTECH_NOT I_7 ( .A(N34), .Z(N35) );
  GTECH_OR2 C256 ( .A(vld_out_0), .B(N14), .Z(N37) );
  GTECH_NOT I_8 ( .A(N37), .Z(N38) );
  GTECH_BUF B_14 ( .A(N61), .Z(N39) );
  GTECH_OR2 C261 ( .A(N40), .B(read_enb_0), .Z(N41) );
  GTECH_NOT I_9 ( .A(N41), .Z(N42) );
  GTECH_AND2 C263 ( .A(N39), .B(N63), .Z(N43) );
  GTECH_AND2 C264 ( .A(vld_out_0), .B(resetn), .Z(N61) );
  GTECH_AND2 C265 ( .A(N39), .B(resetn) );
  GTECH_NOT I_10 ( .A(read_enb_0), .Z(N62) );
  GTECH_AND2 C267 ( .A(N40), .B(N62), .Z(N63) );
  GTECH_AND2 C268 ( .A(N43), .B(N62) );
  GTECH_OR2 C270 ( .A(vld_out_1), .B(N14), .Z(N64) );
  GTECH_NOT I_11 ( .A(N64), .Z(N65) );
  GTECH_BUF B_15 ( .A(N88), .Z(N66) );
  GTECH_OR2 C275 ( .A(N67), .B(read_enb_1), .Z(N68) );
  GTECH_NOT I_12 ( .A(N68), .Z(N69) );
  GTECH_AND2 C277 ( .A(N66), .B(N90), .Z(N70) );
  GTECH_AND2 C278 ( .A(vld_out_1), .B(resetn), .Z(N88) );
  GTECH_AND2 C279 ( .A(N66), .B(resetn) );
  GTECH_NOT I_13 ( .A(read_enb_1), .Z(N89) );
  GTECH_AND2 C281 ( .A(N67), .B(N89), .Z(N90) );
  GTECH_AND2 C282 ( .A(N70), .B(N89) );
  GTECH_OR2 C284 ( .A(vld_out_2), .B(N14), .Z(N91) );
  GTECH_NOT I_14 ( .A(N91), .Z(N92) );
  GTECH_BUF B_16 ( .A(N115), .Z(N93) );
  GTECH_OR2 C289 ( .A(N94), .B(read_enb_2), .Z(N95) );
  GTECH_NOT I_15 ( .A(N95), .Z(N96) );
  GTECH_AND2 C291 ( .A(N93), .B(N117), .Z(N97) );
  GTECH_AND2 C292 ( .A(vld_out_2), .B(resetn), .Z(N115) );
  GTECH_AND2 C293 ( .A(N93), .B(resetn) );
  GTECH_NOT I_16 ( .A(read_enb_2), .Z(N116) );
  GTECH_AND2 C295 ( .A(N94), .B(N116), .Z(N117) );
  GTECH_AND2 C296 ( .A(N97), .B(N116) );
  GTECH_NOT I_17 ( .A(empty_0), .Z(N118) );
  GTECH_BUF B_17 ( .A(N118), .Z(vld_out_0) );
  GTECH_NOT I_18 ( .A(empty_1), .Z(N119) );
  GTECH_BUF B_18 ( .A(N119), .Z(vld_out_1) );
  GTECH_NOT I_19 ( .A(empty_2), .Z(N120) );
  GTECH_BUF B_19 ( .A(N120), .Z(vld_out_2) );
endmodule


module router_fsm ( clock, resetn, pkt_valid, parity_done, data_in, 
        soft_reset_0, soft_reset_1, soft_reset_2, fifo_full, low_pkt_valid, 
        fifo_empty_0, fifo_empty_1, fifo_empty_2, busy, detect_add, ld_state, 
        laf_state, full_state, write_enb_reg, rst_int_reg, lfd_state );
  input [1:0] data_in;
  input clock, resetn, pkt_valid, parity_done, soft_reset_0, soft_reset_1,
         soft_reset_2, fifo_full, low_pkt_valid, fifo_empty_0, fifo_empty_1,
         fifo_empty_2;
  output busy, detect_add, ld_state, laf_state, full_state, write_enb_reg,
         rst_int_reg, lfd_state;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, parity_loaded_flag,
         parity_not_loaded_flag, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46,
         N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88,
         N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N123,
         N124, N125, N126, N127, N128, N129, N130, N131, N132, N133, N134,
         N135, N136, N137, N138, N139, N140, N141, N142, N143, N144, N145,
         N146, N147, N148, N149, N150, N151, N152, N153, N154, N155, N156,
         N157, N158, N159, N160, N161, N162, N163, N164, N165, N166, N167,
         N168, N169, N170, N171, N172, N173, N174, N175, N176, N177, N178,
         N179, N180, N181, N182, N183, N184, N185, N186, N187, N188, N189,
         N190, N191, N192, N193, N194, N195, N196, N197, N198, N199, N200,
         N201, N202, N203, N204, N205, N206, N207, N208, N209, N210, N211,
         N212, N213, N214, N215, N216, N217, N218, N219, N220, N221, N222,
         N223, N224, N225, N226, N227, N228, N229, N230, N231, N232, N233,
         N234, N235, N236, N237, N238, N239, N240, N241, N242;
  wire   [3:0] state;
  wire   [2:0] next_state;

  \**SEQGEN**  \state_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(state[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N17), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(state[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N16), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(state[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N15), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(state[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  parity_not_loaded_flag_reg ( .clear(1'b0), .preset(1'b0), 
        .next_state(N27), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(parity_not_loaded_flag), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N129) );
  \**SEQGEN**  parity_loaded_flag_reg ( .clear(1'b0), .preset(1'b0), 
        .next_state(N25), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(parity_loaded_flag), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N130) );
  GTECH_AND2 C48 ( .A(N140), .B(N135), .Z(N36) );
  GTECH_AND2 C49 ( .A(N36), .B(N141), .Z(N37) );
  GTECH_OR2 C51 ( .A(state[2]), .B(state[1]), .Z(N38) );
  GTECH_OR2 C52 ( .A(N38), .B(N141), .Z(N39) );
  GTECH_OR2 C55 ( .A(state[2]), .B(N135), .Z(N41) );
  GTECH_OR2 C56 ( .A(N41), .B(state[0]), .Z(N42) );
  GTECH_OR2 C60 ( .A(state[2]), .B(N135), .Z(N44) );
  GTECH_OR2 C61 ( .A(N44), .B(N141), .Z(N45) );
  GTECH_OR2 C64 ( .A(N140), .B(state[1]), .Z(N47) );
  GTECH_OR2 C65 ( .A(N47), .B(state[0]), .Z(N48) );
  GTECH_OR2 C69 ( .A(N140), .B(state[1]), .Z(N50) );
  GTECH_OR2 C70 ( .A(N50), .B(N141), .Z(N51) );
  GTECH_OR2 C74 ( .A(N140), .B(N135), .Z(N53) );
  GTECH_OR2 C75 ( .A(N53), .B(state[0]), .Z(N54) );
  GTECH_AND2 C77 ( .A(state[2]), .B(state[1]), .Z(N56) );
  GTECH_AND2 C78 ( .A(N56), .B(state[0]), .Z(N57) );
  GTECH_OR2 C291 ( .A(state[2]), .B(state[3]), .Z(N131) );
  GTECH_OR2 C292 ( .A(state[1]), .B(N131), .Z(N132) );
  GTECH_OR2 C293 ( .A(state[0]), .B(N132), .Z(N133) );
  GTECH_NOT I_0 ( .A(N133), .Z(N134) );
  GTECH_NOT I_1 ( .A(state[1]), .Z(N135) );
  GTECH_OR2 C296 ( .A(state[2]), .B(state[3]), .Z(N136) );
  GTECH_OR2 C297 ( .A(N135), .B(N136), .Z(N137) );
  GTECH_OR2 C298 ( .A(state[0]), .B(N137), .Z(N138) );
  GTECH_NOT I_2 ( .A(N138), .Z(N139) );
  GTECH_NOT I_3 ( .A(state[2]), .Z(N140) );
  GTECH_NOT I_4 ( .A(state[0]), .Z(N141) );
  GTECH_OR2 C302 ( .A(N140), .B(state[3]), .Z(N142) );
  GTECH_OR2 C303 ( .A(state[1]), .B(N142), .Z(N143) );
  GTECH_OR2 C304 ( .A(N141), .B(N143), .Z(N144) );
  GTECH_NOT I_5 ( .A(N144), .Z(N145) );
  GTECH_OR2 C307 ( .A(N140), .B(state[3]), .Z(N146) );
  GTECH_OR2 C308 ( .A(state[1]), .B(N146), .Z(N147) );
  GTECH_OR2 C309 ( .A(state[0]), .B(N147), .Z(N148) );
  GTECH_NOT I_6 ( .A(N148), .Z(N149) );
  GTECH_OR2 C314 ( .A(N140), .B(state[3]), .Z(N150) );
  GTECH_OR2 C315 ( .A(N135), .B(N150), .Z(N151) );
  GTECH_OR2 C316 ( .A(N141), .B(N151), .Z(N152) );
  GTECH_NOT I_7 ( .A(N152), .Z(N153) );
  GTECH_OR2 C319 ( .A(state[2]), .B(state[3]), .Z(N154) );
  GTECH_OR2 C320 ( .A(state[1]), .B(N154), .Z(N155) );
  GTECH_OR2 C321 ( .A(N141), .B(N155), .Z(N156) );
  GTECH_NOT I_8 ( .A(N156), .Z(N157) );
  GTECH_OR2 C324 ( .A(state[2]), .B(state[3]), .Z(N158) );
  GTECH_OR2 C325 ( .A(state[1]), .B(N158), .Z(N159) );
  GTECH_OR2 C326 ( .A(N141), .B(N159), .Z(N160) );
  GTECH_NOT I_9 ( .A(N160), .Z(N161) );
  GTECH_OR2 C330 ( .A(state[2]), .B(state[3]), .Z(N162) );
  GTECH_OR2 C331 ( .A(N135), .B(N162), .Z(N163) );
  GTECH_OR2 C332 ( .A(N141), .B(N163), .Z(N164) );
  GTECH_NOT I_10 ( .A(N164), .Z(N165) );
  GTECH_OR2 C335 ( .A(N140), .B(state[3]), .Z(N166) );
  GTECH_OR2 C336 ( .A(state[1]), .B(N166), .Z(N167) );
  GTECH_OR2 C337 ( .A(state[0]), .B(N167), .Z(N168) );
  GTECH_NOT I_11 ( .A(N168), .Z(N169) );
  GTECH_OR2 C341 ( .A(N140), .B(state[3]), .Z(N170) );
  GTECH_OR2 C342 ( .A(state[1]), .B(N170), .Z(N171) );
  GTECH_OR2 C343 ( .A(N141), .B(N171), .Z(N172) );
  GTECH_NOT I_12 ( .A(N172), .Z(N173) );
  GTECH_OR2 C347 ( .A(N140), .B(state[3]), .Z(N174) );
  GTECH_OR2 C348 ( .A(N135), .B(N174), .Z(N175) );
  GTECH_OR2 C349 ( .A(state[0]), .B(N175), .Z(N176) );
  GTECH_NOT I_13 ( .A(N176), .Z(N177) );
  GTECH_OR2 C352 ( .A(state[2]), .B(state[3]), .Z(N178) );
  GTECH_OR2 C353 ( .A(N135), .B(N178), .Z(N179) );
  GTECH_OR2 C354 ( .A(state[0]), .B(N179), .Z(N180) );
  GTECH_NOT I_14 ( .A(N180), .Z(N181) );
  GTECH_OR2 C358 ( .A(state[2]), .B(state[3]), .Z(N182) );
  GTECH_OR2 C359 ( .A(N135), .B(N182), .Z(N183) );
  GTECH_OR2 C360 ( .A(N141), .B(N183), .Z(N184) );
  GTECH_NOT I_15 ( .A(N184), .Z(N185) );
  GTECH_OR2 C364 ( .A(N140), .B(state[3]), .Z(N186) );
  GTECH_OR2 C365 ( .A(state[1]), .B(N186), .Z(N187) );
  GTECH_OR2 C366 ( .A(N141), .B(N187), .Z(N188) );
  GTECH_NOT I_16 ( .A(N188), .Z(N189) );
  GTECH_OR2 C370 ( .A(state[2]), .B(state[3]), .Z(N190) );
  GTECH_OR2 C371 ( .A(N135), .B(N190), .Z(N191) );
  GTECH_OR2 C372 ( .A(N141), .B(N191), .Z(N192) );
  GTECH_NOT I_17 ( .A(N192), .Z(N193) );
  GTECH_OR2 C376 ( .A(state[2]), .B(state[3]), .Z(N194) );
  GTECH_OR2 C377 ( .A(N135), .B(N194), .Z(N195) );
  GTECH_OR2 C378 ( .A(N141), .B(N195), .Z(N196) );
  GTECH_NOT I_18 ( .A(N196), .Z(N197) );
  GTECH_OR2 C380 ( .A(state[2]), .B(state[3]), .Z(N198) );
  GTECH_OR2 C381 ( .A(state[1]), .B(N198), .Z(N199) );
  GTECH_OR2 C382 ( .A(state[0]), .B(N199), .Z(N200) );
  GTECH_NOT I_19 ( .A(N200), .Z(N201) );
  GTECH_OR2 C384 ( .A(data_in[0]), .B(data_in[1]), .Z(N202) );
  GTECH_NOT I_20 ( .A(N202), .Z(N203) );
  GTECH_NOT I_21 ( .A(data_in[0]), .Z(N204) );
  GTECH_OR2 C387 ( .A(N204), .B(data_in[1]), .Z(N205) );
  GTECH_NOT I_22 ( .A(N205), .Z(N206) );
  GTECH_NOT I_23 ( .A(data_in[1]), .Z(N207) );
  GTECH_OR2 C390 ( .A(data_in[0]), .B(N207), .Z(N208) );
  GTECH_NOT I_24 ( .A(N208), .Z(N209) );
  SELECT_OP C410 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2(next_state), .CONTROL1(
        N0), .CONTROL2(N1), .Z({N17, N16, N15}) );
  GTECH_BUF B_0 ( .A(N14), .Z(N0) );
  GTECH_BUF B_1 ( .A(resetn), .Z(N1) );
  SELECT_OP C411 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .DATA4(1'b1), 
        .CONTROL1(N2), .CONTROL2(N29), .CONTROL3(N32), .CONTROL4(N23), .Z(N24)
         );
  GTECH_BUF B_2 ( .A(N18), .Z(N2) );
  SELECT_OP C412 ( .DATA1(1'b0), .DATA2(1'b1), .CONTROL1(N2), .CONTROL2(N29), 
        .Z(N25) );
  SELECT_OP C413 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b1), 
        .CONTROL1(N2), .CONTROL2(N29), .CONTROL3(N32), .CONTROL4(N23), .Z(N26)
         );
  SELECT_OP C414 ( .DATA1(1'b0), .DATA2(1'b1), .CONTROL1(N2), .CONTROL2(N32), 
        .Z(N27) );
  SELECT_OP C415 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b0, 1'b1}), .DATA3({1'b1, 
        1'b0}), .DATA4({1'b0, 1'b0}), .CONTROL1(N3), .CONTROL2(N103), 
        .CONTROL3(N106), .CONTROL4(N62), .Z({N64, N63}) );
  GTECH_BUF B_3 ( .A(N33), .Z(N3) );
  SELECT_OP C416 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({1'b1, 1'b0, 1'b0}), 
        .DATA3({1'b0, 1'b1, 1'b1}), .DATA4({1'b0, 1'b1, 1'b0}), .CONTROL1(N3), 
        .CONTROL2(N107), .CONTROL3(N110), .CONTROL4(N68), .Z({N71, N70, N69})
         );
  SELECT_OP C417 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b1, 1'b0}), .DATA3({1'b0, 
        1'b0}), .DATA4({1'b1, 1'b1}), .DATA5({1'b1, 1'b0}), .CONTROL1(N3), 
        .CONTROL2(N107), .CONTROL3(N111), .CONTROL4(N114), .CONTROL5(N76), .Z(
        {N78, N77}) );
  SELECT_OP C418 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2({1'b0, 1'b1, 1'b1}), 
        .DATA3({1'b0, 1'b1, 1'b0}), .DATA4({1'b0, 1'b0, 1'b0}), .DATA5({1'b1, 
        1'b0, 1'b1}), .CONTROL1(N3), .CONTROL2(N115), .CONTROL3(N118), 
        .CONTROL4(N121), .CONTROL5(N84), .Z({N87, N86, N85}) );
  SELECT_OP C419 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b0, 1'b1}), .DATA3({1'b1, 
        1'b0}), .CONTROL1(N3), .CONTROL2(N122), .CONTROL3(N90), .Z({N92, N91})
         );
  SELECT_OP C420 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b1, 1'b0}), .DATA3({1'b0, 
        1'b0}), .DATA4({1'b1, 1'b1}), .CONTROL1(N3), .CONTROL2(N123), 
        .CONTROL3(N126), .CONTROL4(N96), .Z({N98, N97}) );
  SELECT_OP C421 ( .DATA1({N64, N64, N63}), .DATA2({1'b0, 1'b1, 1'b0}), 
        .DATA3({N71, N70, N69}), .DATA4({1'b1, 1'b1, 1'b1}), .DATA5({N78, 1'b0, 
        N77}), .DATA6({N87, N86, N85}), .DATA7({N92, N92, N91}), .DATA8({N98, 
        N97, N97}), .CONTROL1(N4), .CONTROL2(N5), .CONTROL3(N6), .CONTROL4(N7), 
        .CONTROL5(N8), .CONTROL6(N9), .CONTROL7(N10), .CONTROL8(N11), .Z({N101, 
        N100, N99}) );
  GTECH_BUF B_4 ( .A(N37), .Z(N4) );
  GTECH_BUF B_5 ( .A(N40), .Z(N5) );
  GTECH_BUF B_6 ( .A(N43), .Z(N6) );
  GTECH_BUF B_7 ( .A(N46), .Z(N7) );
  GTECH_BUF B_8 ( .A(N49), .Z(N8) );
  GTECH_BUF B_9 ( .A(N52), .Z(N9) );
  GTECH_BUF B_10 ( .A(N55), .Z(N10) );
  GTECH_BUF B_11 ( .A(N57), .Z(N11) );
  SELECT_OP C422 ( .DATA1({N101, N100, N99}), .DATA2({1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N12), .CONTROL2(N13), .Z(next_state) );
  GTECH_BUF B_12 ( .A(N35), .Z(N12) );
  GTECH_BUF B_13 ( .A(state[3]), .Z(N13) );
  GTECH_NOT I_25 ( .A(resetn), .Z(N14) );
  GTECH_OR2 C428 ( .A(N212), .B(soft_reset_2), .Z(N18) );
  GTECH_OR2 C429 ( .A(N211), .B(soft_reset_1), .Z(N212) );
  GTECH_OR2 C430 ( .A(N210), .B(soft_reset_0), .Z(N211) );
  GTECH_OR2 C431 ( .A(N14), .B(N201), .Z(N210) );
  GTECH_AND2 C433 ( .A(N197), .B(N213), .Z(N19) );
  GTECH_NOT I_26 ( .A(fifo_full), .Z(N213) );
  GTECH_AND2 C435 ( .A(N193), .B(fifo_full), .Z(N20) );
  GTECH_OR2 C439 ( .A(N19), .B(N18), .Z(N21) );
  GTECH_OR2 C440 ( .A(N20), .B(N21), .Z(N22) );
  GTECH_NOT I_27 ( .A(N22), .Z(N23) );
  GTECH_NOT I_28 ( .A(N18), .Z(N28) );
  GTECH_AND2 C443 ( .A(N19), .B(N28), .Z(N29) );
  GTECH_NOT I_29 ( .A(N19), .Z(N30) );
  GTECH_AND2 C445 ( .A(N28), .B(N30), .Z(N31) );
  GTECH_AND2 C446 ( .A(N20), .B(N31), .Z(N32) );
  GTECH_OR2 C447 ( .A(N214), .B(soft_reset_2), .Z(N33) );
  GTECH_OR2 C448 ( .A(soft_reset_0), .B(soft_reset_1), .Z(N214) );
  GTECH_NOT I_30 ( .A(parity_done), .Z(N34) );
  GTECH_NOT I_31 ( .A(state[3]), .Z(N35) );
  GTECH_NOT I_32 ( .A(N39), .Z(N40) );
  GTECH_NOT I_33 ( .A(N42), .Z(N43) );
  GTECH_NOT I_34 ( .A(N45), .Z(N46) );
  GTECH_NOT I_35 ( .A(N48), .Z(N49) );
  GTECH_NOT I_36 ( .A(N51), .Z(N52) );
  GTECH_NOT I_37 ( .A(N54), .Z(N55) );
  GTECH_OR2 C480 ( .A(N219), .B(N221), .Z(N58) );
  GTECH_OR2 C481 ( .A(N216), .B(N218), .Z(N219) );
  GTECH_AND2 C482 ( .A(N215), .B(fifo_empty_0), .Z(N216) );
  GTECH_AND2 C483 ( .A(pkt_valid), .B(N203), .Z(N215) );
  GTECH_AND2 C484 ( .A(N217), .B(fifo_empty_1), .Z(N218) );
  GTECH_AND2 C485 ( .A(pkt_valid), .B(N206), .Z(N217) );
  GTECH_AND2 C486 ( .A(N220), .B(fifo_empty_2), .Z(N221) );
  GTECH_AND2 C487 ( .A(pkt_valid), .B(N209), .Z(N220) );
  GTECH_OR2 C488 ( .A(N228), .B(N231), .Z(N59) );
  GTECH_OR2 C489 ( .A(N224), .B(N227), .Z(N228) );
  GTECH_AND2 C490 ( .A(N222), .B(N223), .Z(N224) );
  GTECH_AND2 C491 ( .A(pkt_valid), .B(N203), .Z(N222) );
  GTECH_NOT I_38 ( .A(fifo_empty_0), .Z(N223) );
  GTECH_AND2 C493 ( .A(N225), .B(N226), .Z(N227) );
  GTECH_AND2 C494 ( .A(pkt_valid), .B(N206), .Z(N225) );
  GTECH_NOT I_39 ( .A(fifo_empty_1), .Z(N226) );
  GTECH_AND2 C496 ( .A(N229), .B(N230), .Z(N231) );
  GTECH_AND2 C497 ( .A(pkt_valid), .B(N209), .Z(N229) );
  GTECH_NOT I_40 ( .A(fifo_empty_2), .Z(N230) );
  GTECH_OR2 C502 ( .A(N58), .B(N33), .Z(N60) );
  GTECH_OR2 C503 ( .A(N59), .B(N60), .Z(N61) );
  GTECH_NOT I_41 ( .A(N61), .Z(N62) );
  GTECH_AND2 C505 ( .A(N213), .B(N232), .Z(N65) );
  GTECH_NOT I_42 ( .A(pkt_valid), .Z(N232) );
  GTECH_OR2 C509 ( .A(fifo_full), .B(N33), .Z(N66) );
  GTECH_OR2 C510 ( .A(N65), .B(N66), .Z(N67) );
  GTECH_NOT I_43 ( .A(N67), .Z(N68) );
  GTECH_AND2 C512 ( .A(N213), .B(parity_loaded_flag), .Z(N72) );
  GTECH_AND2 C513 ( .A(N213), .B(N233), .Z(N73) );
  GTECH_NOT I_44 ( .A(parity_loaded_flag), .Z(N233) );
  GTECH_OR2 C517 ( .A(N72), .B(N66), .Z(N74) );
  GTECH_OR2 C518 ( .A(N73), .B(N74), .Z(N75) );
  GTECH_NOT I_45 ( .A(N75), .Z(N76) );
  GTECH_AND2 C520 ( .A(N34), .B(low_pkt_valid), .Z(N79) );
  GTECH_AND2 C521 ( .A(N34), .B(N234), .Z(N80) );
  GTECH_NOT I_46 ( .A(low_pkt_valid), .Z(N234) );
  GTECH_OR2 C526 ( .A(N79), .B(N33), .Z(N81) );
  GTECH_OR2 C527 ( .A(N80), .B(N81), .Z(N82) );
  GTECH_OR2 C528 ( .A(parity_done), .B(N82), .Z(N83) );
  GTECH_NOT I_47 ( .A(N83), .Z(N84) );
  GTECH_OR2 C530 ( .A(N237), .B(N238), .Z(N88) );
  GTECH_OR2 C531 ( .A(N235), .B(N236), .Z(N237) );
  GTECH_AND2 C532 ( .A(fifo_empty_0), .B(N203), .Z(N235) );
  GTECH_AND2 C533 ( .A(fifo_empty_1), .B(N206), .Z(N236) );
  GTECH_AND2 C534 ( .A(fifo_empty_2), .B(N209), .Z(N238) );
  GTECH_OR2 C536 ( .A(N88), .B(N33), .Z(N89) );
  GTECH_NOT I_48 ( .A(N89), .Z(N90) );
  GTECH_OR2 C538 ( .A(fifo_full), .B(parity_not_loaded_flag), .Z(N93) );
  GTECH_OR2 C541 ( .A(N93), .B(N33), .Z(N94) );
  GTECH_OR2 C542 ( .A(N213), .B(N94), .Z(N95) );
  GTECH_NOT I_49 ( .A(N95), .Z(N96) );
  GTECH_NOT I_50 ( .A(N33), .Z(N102) );
  GTECH_AND2 C545 ( .A(N58), .B(N102), .Z(N103) );
  GTECH_NOT I_51 ( .A(N58), .Z(N104) );
  GTECH_AND2 C547 ( .A(N102), .B(N104), .Z(N105) );
  GTECH_AND2 C548 ( .A(N59), .B(N105), .Z(N106) );
  GTECH_AND2 C549 ( .A(fifo_full), .B(N102), .Z(N107) );
  GTECH_NOT I_52 ( .A(fifo_full), .Z(N108) );
  GTECH_AND2 C551 ( .A(N102), .B(N108), .Z(N109) );
  GTECH_AND2 C552 ( .A(N65), .B(N109), .Z(N110) );
  GTECH_AND2 C553 ( .A(N72), .B(N109), .Z(N111) );
  GTECH_NOT I_53 ( .A(N72), .Z(N112) );
  GTECH_AND2 C555 ( .A(N109), .B(N112), .Z(N113) );
  GTECH_AND2 C556 ( .A(N73), .B(N113), .Z(N114) );
  GTECH_AND2 C557 ( .A(N79), .B(N102), .Z(N115) );
  GTECH_NOT I_54 ( .A(N79), .Z(N116) );
  GTECH_AND2 C559 ( .A(N102), .B(N116), .Z(N117) );
  GTECH_AND2 C560 ( .A(N80), .B(N117), .Z(N118) );
  GTECH_NOT I_55 ( .A(N80), .Z(N119) );
  GTECH_AND2 C562 ( .A(N117), .B(N119), .Z(N120) );
  GTECH_AND2 C563 ( .A(parity_done), .B(N120), .Z(N121) );
  GTECH_AND2 C564 ( .A(N88), .B(N102), .Z(N122) );
  GTECH_AND2 C565 ( .A(N93), .B(N102), .Z(N123) );
  GTECH_NOT I_56 ( .A(N93), .Z(N124) );
  GTECH_AND2 C567 ( .A(N102), .B(N124), .Z(N125) );
  GTECH_AND2 C568 ( .A(N213), .B(N125), .Z(N126) );
  GTECH_BUF B_14 ( .A(N134), .Z(detect_add) );
  GTECH_BUF B_15 ( .A(N157), .Z(lfd_state) );
  GTECH_OR2 C571 ( .A(N241), .B(N177), .Z(N127) );
  GTECH_OR2 C572 ( .A(N240), .B(N173), .Z(N241) );
  GTECH_OR2 C573 ( .A(N239), .B(N169), .Z(N240) );
  GTECH_OR2 C574 ( .A(N161), .B(N165), .Z(N239) );
  GTECH_BUF B_16 ( .A(N127), .Z(busy) );
  GTECH_BUF B_17 ( .A(N139), .Z(ld_state) );
  GTECH_OR2 C577 ( .A(N242), .B(N189), .Z(N128) );
  GTECH_OR2 C578 ( .A(N181), .B(N185), .Z(N242) );
  GTECH_BUF B_18 ( .A(N128), .Z(write_enb_reg) );
  GTECH_BUF B_19 ( .A(N149), .Z(full_state) );
  GTECH_BUF B_20 ( .A(N145), .Z(laf_state) );
  GTECH_BUF B_21 ( .A(N153), .Z(rst_int_reg) );
  GTECH_AND2 C584 ( .A(N26), .B(N22), .Z(N129) );
  GTECH_AND2 C585 ( .A(N24), .B(N22), .Z(N130) );
endmodule


module router_reg ( clock, resetn, pkt_valid, data_in, fifo_full, rst_int_reg, 
        detect_add, ld_state, laf_state, full_state, lfd_state, parity_done, 
        low_pkt_valid, err, dout );
  input [7:0] data_in;
  output [7:0] dout;
  input clock, resetn, pkt_valid, fifo_full, rst_int_reg, detect_add, ld_state,
         laf_state, full_state, lfd_state;
  output parity_done, low_pkt_valid, err;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119;
  wire   [7:0] header;
  wire   [7:0] FIFO_full_state;
  wire   [7:0] internal_parity;
  wire   [7:0] pkt_parity;

  \**SEQGEN**  parity_done_reg ( .clear(1'b0), .preset(1'b0), .next_state(N7), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(parity_done), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N6) );
  \**SEQGEN**  low_pkt_valid_reg ( .clear(1'b0), .preset(1'b0), .next_state(
        N13), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        low_pkt_valid), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N12) );
  \**SEQGEN**  \header_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(N25), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(header[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N17) );
  \**SEQGEN**  \header_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(N24), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(header[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N17) );
  \**SEQGEN**  \header_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(N23), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(header[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N17) );
  \**SEQGEN**  \header_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(N22), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(header[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N17) );
  \**SEQGEN**  \header_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N21), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(header[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N17) );
  \**SEQGEN**  \header_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N20), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(header[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N17) );
  \**SEQGEN**  \header_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N19), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(header[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N17) );
  \**SEQGEN**  \header_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N18), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(header[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N17) );
  \**SEQGEN**  \FIFO_full_state_reg[7]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N36), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(FIFO_full_state[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N28) );
  \**SEQGEN**  \FIFO_full_state_reg[6]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N35), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(FIFO_full_state[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N28) );
  \**SEQGEN**  \FIFO_full_state_reg[5]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N34), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(FIFO_full_state[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N28) );
  \**SEQGEN**  \FIFO_full_state_reg[4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N33), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(FIFO_full_state[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N28) );
  \**SEQGEN**  \FIFO_full_state_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N32), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(FIFO_full_state[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N28) );
  \**SEQGEN**  \FIFO_full_state_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N31), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(FIFO_full_state[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N28) );
  \**SEQGEN**  \FIFO_full_state_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N30), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(FIFO_full_state[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N28) );
  \**SEQGEN**  \FIFO_full_state_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N29), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(FIFO_full_state[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N28) );
  \**SEQGEN**  \internal_parity_reg[7]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N65), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(internal_parity[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N41) );
  \**SEQGEN**  \internal_parity_reg[6]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N64), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(internal_parity[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N41) );
  \**SEQGEN**  \internal_parity_reg[5]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N63), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(internal_parity[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N41) );
  \**SEQGEN**  \internal_parity_reg[4]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N62), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(internal_parity[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N41) );
  \**SEQGEN**  \internal_parity_reg[3]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N61), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(internal_parity[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N41) );
  \**SEQGEN**  \internal_parity_reg[2]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N60), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(internal_parity[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N41) );
  \**SEQGEN**  \internal_parity_reg[1]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N59), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(internal_parity[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N41) );
  \**SEQGEN**  \internal_parity_reg[0]  ( .clear(1'b0), .preset(1'b0), 
        .next_state(N58), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), 
        .Q(internal_parity[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N41) );
  \**SEQGEN**  \pkt_parity_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N79), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        pkt_parity[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N71) );
  \**SEQGEN**  \pkt_parity_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N78), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        pkt_parity[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N71) );
  \**SEQGEN**  \pkt_parity_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N77), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        pkt_parity[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N71) );
  \**SEQGEN**  \pkt_parity_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N76), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        pkt_parity[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N71) );
  \**SEQGEN**  \pkt_parity_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N75), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        pkt_parity[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N71) );
  \**SEQGEN**  \pkt_parity_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N74), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        pkt_parity[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N71) );
  \**SEQGEN**  \pkt_parity_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N73), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        pkt_parity[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N71) );
  \**SEQGEN**  \pkt_parity_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        N72), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(
        pkt_parity[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N71) );
  EQ_UNS_OP eq_78 ( .A(internal_parity), .B(pkt_parity), .Z(N84) );
  \**SEQGEN**  err_reg ( .clear(1'b0), .preset(1'b0), .next_state(N86), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(err), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \dout_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(N99), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(dout[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N91) );
  \**SEQGEN**  \dout_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(N98), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(dout[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N91) );
  \**SEQGEN**  \dout_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(N97), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(dout[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N91) );
  \**SEQGEN**  \dout_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(N96), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(dout[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N91) );
  \**SEQGEN**  \dout_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N95), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(dout[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N91) );
  \**SEQGEN**  \dout_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N94), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(dout[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N91) );
  \**SEQGEN**  \dout_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N93), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(dout[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N91) );
  \**SEQGEN**  \dout_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N92), 
        .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(dout[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N91) );
  GTECH_AND2 C242 ( .A(data_in[0]), .B(data_in[1]), .Z(N106) );
  GTECH_NOT I_0 ( .A(N106), .Z(N107) );
  SELECT_OP C286 ( .DATA1(1'b0), .DATA2(1'b1), .CONTROL1(N0), .CONTROL2(N9), 
        .Z(N7) );
  GTECH_BUF B_0 ( .A(N4), .Z(N0) );
  SELECT_OP C287 ( .DATA1(1'b0), .DATA2(1'b1), .CONTROL1(N1), .CONTROL2(N15), 
        .Z(N13) );
  GTECH_BUF B_1 ( .A(N10), .Z(N1) );
  SELECT_OP C288 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .DATA2(data_in), .CONTROL1(N2), .CONTROL2(N26), .Z({N25, N24, N23, N22, 
        N21, N20, N19, N18}) );
  GTECH_BUF B_2 ( .A(N108), .Z(N2) );
  SELECT_OP C289 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .DATA2(data_in), .CONTROL1(N2), .CONTROL2(N37), .Z({N36, N35, N34, N33, 
        N32, N31, N30, N29}) );
  SELECT_OP C290 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .DATA2({N42, N43, N44, N45, N46, N47, N48, N49}), .DATA3({N50, N51, 
        N52, N53, N54, N55, N56, N57}), .CONTROL1(N3), .CONTROL2(N67), 
        .CONTROL3(N70), .Z({N65, N64, N63, N62, N61, N60, N59, N58}) );
  GTECH_BUF B_3 ( .A(N38), .Z(N3) );
  SELECT_OP C291 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .DATA2(data_in), .CONTROL1(N0), .CONTROL2(N80), .Z({N79, N78, N77, N76, 
        N75, N74, N73, N72}) );
  GTECH_NOT I_1 ( .A(N84), .Z(N85) );
  SELECT_OP C293 ( .DATA1(1'b0), .DATA2(N85), .DATA3(1'b0), .CONTROL1(N2), 
        .CONTROL2(N87), .CONTROL3(N82), .Z(N86) );
  SELECT_OP C294 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .DATA2(header), .DATA3(FIFO_full_state), .DATA4(data_in), .CONTROL1(N2), .CONTROL2(N100), .CONTROL3(N102), .CONTROL4(N105), .Z({N99, N98, N97, N96, 
        N95, N94, N93, N92}) );
  GTECH_OR2 C297 ( .A(N108), .B(detect_add), .Z(N4) );
  GTECH_NOT I_2 ( .A(resetn), .Z(N108) );
  GTECH_OR2 C299 ( .A(N112), .B(N115), .Z(N5) );
  GTECH_AND2 C300 ( .A(N110), .B(N111), .Z(N112) );
  GTECH_AND2 C301 ( .A(ld_state), .B(N109), .Z(N110) );
  GTECH_NOT I_3 ( .A(fifo_full), .Z(N109) );
  GTECH_NOT I_4 ( .A(pkt_valid), .Z(N111) );
  GTECH_AND2 C304 ( .A(N113), .B(N114), .Z(N115) );
  GTECH_AND2 C305 ( .A(laf_state), .B(low_pkt_valid), .Z(N113) );
  GTECH_NOT I_5 ( .A(parity_done), .Z(N114) );
  GTECH_OR2 C309 ( .A(N5), .B(N4), .Z(N6) );
  GTECH_NOT I_6 ( .A(N4), .Z(N8) );
  GTECH_AND2 C312 ( .A(N5), .B(N8), .Z(N9) );
  GTECH_OR2 C313 ( .A(N108), .B(rst_int_reg), .Z(N10) );
  GTECH_AND2 C315 ( .A(ld_state), .B(N111), .Z(N11) );
  GTECH_OR2 C319 ( .A(N11), .B(N10), .Z(N12) );
  GTECH_NOT I_7 ( .A(N10), .Z(N14) );
  GTECH_AND2 C322 ( .A(N11), .B(N14), .Z(N15) );
  GTECH_AND2 C324 ( .A(N116), .B(N107), .Z(N16) );
  GTECH_AND2 C325 ( .A(detect_add), .B(pkt_valid), .Z(N116) );
  GTECH_OR2 C328 ( .A(N16), .B(N108), .Z(N17) );
  GTECH_AND2 C331 ( .A(N16), .B(resetn), .Z(N26) );
  GTECH_AND2 C332 ( .A(ld_state), .B(fifo_full), .Z(N27) );
  GTECH_OR2 C334 ( .A(N27), .B(N108), .Z(N28) );
  GTECH_AND2 C336 ( .A(N27), .B(resetn), .Z(N37) );
  GTECH_OR2 C337 ( .A(N108), .B(N117), .Z(N38) );
  GTECH_AND2 C339 ( .A(detect_add), .B(pkt_valid), .Z(N117) );
  GTECH_AND2 C340 ( .A(N119), .B(pkt_valid), .Z(N39) );
  GTECH_AND2 C341 ( .A(ld_state), .B(N118), .Z(N119) );
  GTECH_NOT I_8 ( .A(full_state), .Z(N118) );
  GTECH_OR2 C346 ( .A(lfd_state), .B(N38), .Z(N40) );
  GTECH_OR2 C347 ( .A(N39), .B(N40), .Z(N41) );
  GTECH_XOR2 C349 ( .A(internal_parity[7]), .B(header[7]), .Z(N42) );
  GTECH_XOR2 C350 ( .A(internal_parity[6]), .B(header[6]), .Z(N43) );
  GTECH_XOR2 C351 ( .A(internal_parity[5]), .B(header[5]), .Z(N44) );
  GTECH_XOR2 C352 ( .A(internal_parity[4]), .B(header[4]), .Z(N45) );
  GTECH_XOR2 C353 ( .A(internal_parity[3]), .B(header[3]), .Z(N46) );
  GTECH_XOR2 C354 ( .A(internal_parity[2]), .B(header[2]), .Z(N47) );
  GTECH_XOR2 C355 ( .A(internal_parity[1]), .B(header[1]), .Z(N48) );
  GTECH_XOR2 C356 ( .A(internal_parity[0]), .B(header[0]), .Z(N49) );
  GTECH_XOR2 C357 ( .A(internal_parity[7]), .B(data_in[7]), .Z(N50) );
  GTECH_XOR2 C358 ( .A(internal_parity[6]), .B(data_in[6]), .Z(N51) );
  GTECH_XOR2 C359 ( .A(internal_parity[5]), .B(data_in[5]), .Z(N52) );
  GTECH_XOR2 C360 ( .A(internal_parity[4]), .B(data_in[4]), .Z(N53) );
  GTECH_XOR2 C361 ( .A(internal_parity[3]), .B(data_in[3]), .Z(N54) );
  GTECH_XOR2 C362 ( .A(internal_parity[2]), .B(data_in[2]), .Z(N55) );
  GTECH_XOR2 C363 ( .A(internal_parity[1]), .B(data_in[1]), .Z(N56) );
  GTECH_XOR2 C364 ( .A(internal_parity[0]), .B(data_in[0]), .Z(N57) );
  GTECH_NOT I_9 ( .A(N38), .Z(N66) );
  GTECH_AND2 C366 ( .A(lfd_state), .B(N66), .Z(N67) );
  GTECH_NOT I_10 ( .A(lfd_state), .Z(N68) );
  GTECH_AND2 C368 ( .A(N66), .B(N68), .Z(N69) );
  GTECH_AND2 C369 ( .A(N39), .B(N69), .Z(N70) );
  GTECH_OR2 C370 ( .A(N11), .B(N4), .Z(N71) );
  GTECH_AND2 C372 ( .A(N11), .B(N8), .Z(N80) );
  GTECH_OR2 C374 ( .A(parity_done), .B(N108), .Z(N81) );
  GTECH_NOT I_11 ( .A(N81), .Z(N82) );
  GTECH_BUF B_4 ( .A(N87), .Z(N83) );
  GTECH_AND2 C378 ( .A(parity_done), .B(resetn), .Z(N87) );
  GTECH_AND2 C379 ( .A(N83), .B(resetn) );
  GTECH_AND2 C380 ( .A(ld_state), .B(N109), .Z(N88) );
  GTECH_OR2 C384 ( .A(lfd_state), .B(N108), .Z(N89) );
  GTECH_OR2 C385 ( .A(laf_state), .B(N89), .Z(N90) );
  GTECH_OR2 C386 ( .A(N88), .B(N90), .Z(N91) );
  GTECH_AND2 C388 ( .A(lfd_state), .B(resetn), .Z(N100) );
  GTECH_AND2 C389 ( .A(resetn), .B(N68), .Z(N101) );
  GTECH_AND2 C390 ( .A(laf_state), .B(N101), .Z(N102) );
  GTECH_NOT I_12 ( .A(laf_state), .Z(N103) );
  GTECH_AND2 C392 ( .A(N101), .B(N103), .Z(N104) );
  GTECH_AND2 C393 ( .A(N88), .B(N104), .Z(N105) );
endmodule


module router_top ( clock, resetn, read_enb_0, read_enb_1, read_enb_2, data_in, 
        pkt_valid, data_out_0, data_out_1, data_out_2, valid_out_0, 
        valid_out_1, valid_out_2, error, busy );
  input [7:0] data_in;
  output [7:0] data_out_0;
  output [7:0] data_out_1;
  output [7:0] data_out_2;
  input clock, resetn, read_enb_0, read_enb_1, read_enb_2, pkt_valid;
  output valid_out_0, valid_out_1, valid_out_2, error, busy;
  wire   lfd_state, detect_add, write_enb_reg, fifo_full, parity_done,
         low_pkt_valid, ld_state, laf_state, full_state, rst_int_reg;
  wire   [2:0] write_enb;
  wire   [2:0] soft_reset;
  wire   [7:0] dout;
  wire   [2:0] empty;
  wire   [2:0] full;
  tri   [7:0] data_out_0;
  tri   [7:0] data_out_1;
  tri   [7:0] data_out_2;

  router_fifo \FIFO[0].FIFO  ( .clock(clock), .resetn(resetn), .write_enb(
        write_enb[0]), .soft_reset(soft_reset[0]), .read_enb(read_enb_0), 
        .data_in(dout), .lfd_state(lfd_state), .empty(empty[0]), .full(full[0]), .data_out(data_out_0) );
  router_fifo \FIFO[1].FIFO  ( .clock(clock), .resetn(resetn), .write_enb(
        write_enb[1]), .soft_reset(soft_reset[1]), .read_enb(read_enb_1), 
        .data_in(dout), .lfd_state(lfd_state), .empty(empty[1]), .full(full[1]), .data_out(data_out_1) );
  router_fifo \FIFO[2].FIFO  ( .clock(clock), .resetn(resetn), .write_enb(
        write_enb[2]), .soft_reset(soft_reset[2]), .read_enb(read_enb_2), 
        .data_in(dout), .lfd_state(lfd_state), .empty(empty[2]), .full(full[2]), .data_out(data_out_2) );
  router_sync Synchronizer ( .clock(clock), .resetn(resetn), .detect_add(
        detect_add), .data_in(data_in[1:0]), .write_enb_reg(write_enb_reg), 
        .read_enb_0(read_enb_0), .read_enb_1(read_enb_1), .read_enb_2(
        read_enb_2), .empty_0(empty[0]), .empty_1(empty[1]), .empty_2(empty[2]), .full_0(full[0]), .full_1(full[1]), .full_2(full[2]), .vld_out_0(valid_out_0), .vld_out_1(valid_out_1), .vld_out_2(valid_out_2), .write_enb(write_enb), 
        .fifo_full(fifo_full), .soft_reset_0(soft_reset[0]), .soft_reset_1(
        soft_reset[1]), .soft_reset_2(soft_reset[2]) );
  router_fsm FSM ( .clock(clock), .resetn(resetn), .pkt_valid(pkt_valid), 
        .parity_done(parity_done), .data_in(data_in[1:0]), .soft_reset_0(
        soft_reset[0]), .soft_reset_1(soft_reset[1]), .soft_reset_2(
        soft_reset[2]), .fifo_full(fifo_full), .low_pkt_valid(low_pkt_valid), 
        .fifo_empty_0(empty[0]), .fifo_empty_1(empty[1]), .fifo_empty_2(
        empty[2]), .busy(busy), .detect_add(detect_add), .ld_state(ld_state), 
        .laf_state(laf_state), .full_state(full_state), .write_enb_reg(
        write_enb_reg), .rst_int_reg(rst_int_reg), .lfd_state(lfd_state) );
  router_reg Register ( .clock(clock), .resetn(resetn), .pkt_valid(pkt_valid), 
        .data_in(data_in), .fifo_full(fifo_full), .rst_int_reg(rst_int_reg), 
        .detect_add(detect_add), .ld_state(ld_state), .laf_state(laf_state), 
        .full_state(full_state), .lfd_state(lfd_state), .parity_done(
        parity_done), .low_pkt_valid(low_pkt_valid), .err(error), .dout(dout)
         );
endmodule

