#!/bin/usr/tcsh -f

#Testing touch ~/arun_$1_arun.log
#Testing touch ~/arun_"$1"_arun2.log

# set test_name = $1
# echo Test Name : $test_name
#
# set run_cmd = 'simbuild -dut hdas -1c -CUST ICPLP -1c- -ace_args -command "ace -x -m hdas_tb -hdas_test '$test_name' -waves -nocleanup -results $IP_ROOT/results/'$test_name' -xprop -upf_mode -epi -simv_args "-power,${MODEL_ROOT}/tools/isogen/cnl/common/power.cfg"" -ace_args- | tee $verif/simbuild_testrun_'$test_name'.log'
# echo "run_cmd = $run_cmd"
# $run_cmd

set testname = $1
set x = `date +%Y%m%d_%H%M%S`
set results_dir = "$testname"_"$x"
set logfile     = "$testname"_"$x".log


echo "==============================================="
echo "Cust name  : $MY_CUST"
echo "Test name  : $testname"
echo "Log  File  : $logfile"
echo "Results Dir: $results_dir"
echo "==============================================="

simbuild -dut hdas -1c -CUST $MY_CUST -1c- -ace_args -command ace -x -m hdas_tb -hdas_test $testname -waves -nocleanup -results $IP_ROOT/results/$results_dir -xprop -upf_mode -epi -simv_args "-power,${MODEL_ROOT}/tools/isogen/cnl/common/power.cfg" -ace_args- | tee $verif/$logfile

echo "==============================================="
echo "Cust name  : $MY_CUST"
echo "Test name  : $testname"
echo "Log  File  : $logfile"
echo "Results Dir: $results_dir"
echo "==============================================="
