transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Fabian/Documents/Quartus/Task2_test {C:/Users/Fabian/Documents/Quartus/Task2_test/updown_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Fabian/Documents/Quartus/Task2_test {C:/Users/Fabian/Documents/Quartus/Task2_test/clkEnable.v}
vlog -vlog01compat -work work +incdir+C:/Users/Fabian/Documents/Quartus/Task2_test {C:/Users/Fabian/Documents/Quartus/Task2_test/PLL.v}
vlog -vlog01compat -work work +incdir+C:/Users/Fabian/Documents/Quartus/Task2_test/db {C:/Users/Fabian/Documents/Quartus/Task2_test/db/pll_altpll.v}

