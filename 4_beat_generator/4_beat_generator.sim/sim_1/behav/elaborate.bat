@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto 415304b94b814a03ac5b8415cc2bc316 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L util_vector_logic_v2_0 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot test_behav xil_defaultlib.test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
