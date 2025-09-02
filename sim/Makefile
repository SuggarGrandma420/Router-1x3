help:
	@echo
	@echo "========================== Makefile Help ========================================="
	@echo
	@echo "| Target      | Description                                       		|"
	@echo "|-------------|------------------------------------------------------------------|"
	@echo "| cmp         | Compile the design and testbench                  		|"
	@echo "| sim1        | Run the payload < 14 simulation with coverage enabled    	|"
	@echo "| sim2        | Run the payload = 14 simulation with coverage enabled    	|"
	@echo "| sim3        | Run the payload > 14 simulation with coverage enabled    	|"
	@echo "| sim4        | Run the error parity simulation with coverage enabled    	|"
	@echo "| sim5        | Run the clock count > 30 simulation with coverage enabled    	|"
	@echo "| view_wave1  | Open the waveform viewer for the payload < 14 simulation 	|"
	@echo "| view_wave2  | Open the waveform viewer for the payload = 14 simulation 	|"
	@echo "| view_wave3  | Open the waveform viewer for the payload > 14 simulation 	|"
	@echo "| view_wave4  | Open the waveform viewer for the error parity simulation 	|"
	@echo "| view_wave5  | Open the waveform viewer for the clock count > 30 simulation 	|"
	@echo "| cov         | Open the coverage HTML report                     		|"
	@echo "| clean       | Remove generated files                            		|"
	@echo "| regress     | Run all simulations and generate reports          		|"
	@echo
	@echo "=================================================================================="

SIMULATOR = Questa

FSDB_PATH=/home/cad/eda/SYNOPSYS/VERDI_2022/verdi/T-2022.06-SP1/share/PLI/VCS/LINUX64

WORK = work
RTL = ../rtl/*
PKG = ../test/router_pkg.sv
INCDIR = +incdir+../test +incdir+../tb +incdir+../wr_agt_top +incdir+../rd_agt_top
TOP = ../tb/router_tb_top.sv ../tb/router_assertions.sv
VSIMOPT = -vopt -voptargs=+acc 
VSIMCODECOV = -cm branch+cond+tgl+fsm+line
VSIMFUNCOV= -coverage -sva
VSIMBATCH1= -c -do " log -r /* ;coverage save -onexit router_cov1;run -all; exit"
VSIMBATCH2= -c -do " log -r /* ;coverage save -onexit router_cov2;run -all; exit"
VSIMBATCH3= -c -do " log -r /* ;coverage save -onexit router_cov3;run -all; exit"
VSIMBATCH4= -c -do " log -r /* ;coverage save -onexit router_cov4;run -all; exit"
VSIMBATCH5= -c -do " log -r /* ;run -all; exit"

clean : clean_$(SIMULATOR)
cmp : cmp_$(SIMULATOR)
sim1 : sim1_$(SIMULATOR)
sim2 : sim2_$(SIMULATOR)
sim3 : sim3_$(SIMULATOR)
sim4 : sim4_$(SIMULATOR)
sim5 : sim5_$(SIMULATOR)
view_wave1 : view_wave1_$(SIMULATOR)
view_wave2 : view_wave2_$(SIMULATOR)
view_wave3 : view_wave3_$(SIMULATOR)
view_wave4 : view_wave4_$(SIMULATOR)
view_wave5 : view_wave5_$(SIMULATOR)
report : report_$(SIMULATOR)
regress : regress_$(SIMULATOR)
cov : cov_$(SIMULATOR)

# ----------------------------- Start of Definitions for Mentor's Questa Specific Targets -------------------------------#

cmp_Questa :
	@vlib $(WORK)
	@vmap work $(WORK) 
	@vlog $(RTL) $(PKG) $(TOP) $(INCDIR)

sim1_Questa : clean cmp
	@vsim -cvgperinstance $(VSIMOPT) $(VSIMFUNCOV) $(VSIMBATCH1) -wlf wave_file1.wlf -l test1.log -sv_seed random work.router_tb_top +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_payload_lt_14
	@vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov1

sim2_Questa : clean cmp
	@vsim -cvgperinstance $(VSIMOPT) $(VSIMFUNCOV) $(VSIMBATCH2) -wlf wave_file2.wlf -l test2.log -sv_seed random work.router_tb_top +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_payload_eq_14
	@vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov2

sim3_Questa : clean cmp
	@vsim -cvgperinstance $(VSIMOPT) $(VSIMFUNCOV) $(VSIMBATCH3) -wlf wave_file3.wlf -l test3.log -sv_seed random work.router_tb_top +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_payload_gt_14
	@vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov3

sim4_Questa : clean cmp
	@vsim -cvgperinstance $(VSIMOPT) $(VSIMFUNCOV) $(VSIMBATCH4) -wlf wave_file4.wlf -l test4.log -sv_seed random work.router_tb_top +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_wrong_parity
	@vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov4

sim5_Questa : clean cmp
	@vsim $(VSIMOPT) $(VSIMBATCH5) -wlf wave_file5.wlf -l test5.log -sv_seed random work.router_tb_top +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_clock_count_gt_30

view_wave1_Questa :
	@vsim -view wave_file1.wlf

view_wave2_Questa :
	@vsim -view wave_file2.wlf

view_wave3_Questa :
	@vsim -view wave_file3.wlf

view_wave4_Questa :
	@vsim -view wave_file4.wlf

view_wave5_Questa :
	@vsim -view wave_file5.wlf

report_Questa:
	@vcover merge router_cov router_cov1 router_cov2 router_cov3 router_cov4
	@vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html router_cov

regress_Questa: sim1_Questa sim2_Questa sim3_Questa sim4_Questa report_Questa cov_Questa

cov_Questa:
# Windows
	cmd /c start covhtmlreport/index.html

# Linux
#	firefox covhtmlreport/index.html&

clean_Questa:
	@rm -rf transcript* *log* fcover* covhtml* router_cov* *.wlf modelsim.ini work vsim*
	@clear

# ----------------------------- End of Definitions for Mentor's Questa Specific Targets -------------------------------#

# ----------------------------- Start of Definitions for Synopsys's VCS Specific Targets -------------------------------#

cmp_VCS:
	@vcs -l vcs.log -timescale=1ns/1ps -sverilog -ntb_opts uvm -debug_access+all -full64 -cm assert -kdb -lca $(VSIMCODECOV) -P $(FSDB_PATH)/novas.tab $(FSDB_PATH)/pli.a $(RTL) $(PKG) $(TOP) $(INCDIR)
		      
sim1_VCS: clean cmp_VCS
	@./simv -a vcs.log +fsdbfile+wave1.fsdb -cm_log router_cov1.log -cm_dir ./router_cov1 +ntb_random_seed_automatic +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_payload_lt_14
	@urg -dir router_cov1.vdb -format both -report urgReport1

sim2_VCS: clean cmp_VCS
	@./simv -a vcs.log +fsdbfile+wave2.fsdb -cm_log router_cov2.log -cm_dir ./router_cov2 +ntb_random_seed_automatic +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_payload_eq_14
	@urg -dir router_cov2.vdb -format both -report urgReport2

sim3_VCS: clean cmp_VCS
	@./simv -a vcs.log +fsdbfile+wave3.fsdb -cm_log router_cov3.log -cm_dir ./router_cov3 +ntb_random_seed_automatic +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_payload_gt_14
	@urg -dir router_cov3.vdb -format both -report urgReport3

sim4_VCS: clean cmp_VCS
	@./simv -a vcs.log +fsdbfile+wave4.fsdb -cm_log router_cov4.log -cm_dir ./router_cov4 +ntb_random_seed_automatic +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_wrong_parity
	@urg -dir router_cov4.vdb -format both -report urgReport4

sim5_VCS: clean cmp_VCS
	@./simv -a vcs.log +fsdbfile+wave5.fsdb +ntb_random_seed_automatic +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=test_clock_count_gt_30

view_wave1_VCS: 
	@verdi -ssf wave1.fsdb

view_wave2_VCS: 
	@verdi -ssf wave2.fsdb

view_wave3_VCS: 
	@verdi -ssf wave3.fsdb

view_wave4_VCS: 
	@verdi -ssf wave4.fsdb

view_wave5_VCS: 
	@verdi -ssf wave5.fsdb

report_VCS:
	@urg -dir router_cov1.vdb router_cov2.vdb router_cov3.vdb router_cov4.vdb -dbname merged_dir/merged_test -format both -report urgReport

regress_VCS: sim1_VCS sim2_VCS sim3_VCS sim4_VCS report_VCS cov_VCS

cov_VCS:
	@verdi -cov -covdir merged_dir.vdb

clean_VCS:
	@rm -rf simv* csrc* *.tmp *.vpd *.vdb *.key *.log *hdrs.h urgReport* *.fsdb novas* verdi*
	@clear

# ----------------------------- END of Definitions for Synopsys's VCS Specific Targets -------------------------------#
