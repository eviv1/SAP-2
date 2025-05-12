onerror {quit -f}
vlib work
vlog -work work mMPU.vo
vlog -work work mMPU.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mMPU_vlg_vec_tst
vcd file -direction mMPU.msim.vcd
vcd add -internal mMPU_vlg_vec_tst/*
vcd add -internal mMPU_vlg_vec_tst/i1/*
add wave /*
run -all
