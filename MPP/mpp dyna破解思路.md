# 1.mpp dyna安装

安装单独对应版本mpp dyna；配置mpi；安装完ANSYS LIC后，定义LIC环境变量。

# 2.ANSYS LIC配置，破解

> 1、先安装ansys，只保留dyna模块。不要安装ANSYS License Manager！
>
> 2、配置LSTC_LICENSE=ANSYS环境变量（此处注意！）。
>
> 两种方法：
>
> ​	一、sudo vim /etc/profile
>
> ​			加入：LSTC_LICENSE=ANSYS
>
> ​			在该home下的~/.bashrc文件末写上source /etc/profile。
>
> ​	二、或者把```export LSTC_LICENSE=ANSYS```语句写在home下的.bashrc文件末尾。
>
> 3、直接使用求解器求解。
>
> 遗留问题：crack文件夹里的破解文件怎么配置可不必安装ansys？需要增加配置一个环境变量ANSYSLIC_DIR=值即可吗？
>
> ### 求解命令：
>
> ```bash
> #!/bin/bash
> /usr/ansys_inc/v211/ansys/bin/linx64/solver/smpdyna12.1.0 i=/home/hyt/dynatest/test.k ncpu=2 memory=20m
> ```
>
> -----

> 以下破解为参考
> 
> 		If you HAVE NO ANSYS 2021R1 with SSQ's crack installed
>					
> 	1. Extract folder lsdyna_smp_r11.2.1 to /usr
>						
> 	2. Define ANSYS licensing for LS-DYNA as:
>						
> 	     export LSTC_LICENSE=ANSYS
> 	     export ANSYSLIC_DIR=/usr/lsdyna_smp_r11.2.1/ansys_inc/shared_files/licensing（安装ansys破解此句不必）
>						
> 	     > ###  注意！！！：把export语句写在home下的~/.bashrc文件里，或者在该文件里写上source /etc/profile
>						
> 	3. Run lsdyna_smp_r11.2.1 solvers with:
>						
> 	/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
> 	/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
> 	/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
> 	/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
>
>
> 		If you HAVE ANSYS 2021R1 with SSQ's crack installed
>						
> 	1. Extract folder lsdyna_smp_r11.2.1 to /usr
>						
> 	2. Define ANSYS licensing for LS-DYNA as:
>						
> 	  export LSTC_LICENSE=ANSYS
> 	  export ANSYSLIC_DIR= full path to folder ./ansys_inc/shared_files/licensing on your computer
> 	  (by default /opt/ansys_inc/shared_files/licensing )
>						
> 	3. Run lsdyna_smp_r11.2.1 solvers with:
>						
> 	/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
> 	/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
> 	/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
> 	/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
>						
> 	WWW.DOWNLOADLY.IR

# 3.调用mpi启动mpp求解器(root用户组)：

--allow-run-as-root

mpiexec --allow-run-as-root  -n 4 /home/hyt/dyna/ls11 i=test.k ncpu=4

调用mpi启动mpp求解器(普通用户组)：

mpiexec -n 4 Test_MPI.exe

mpiexec -n 4 /home/hyt/dyna/ls11 i=test.k ncpu=4

启动smp求解器：

/usr/lsdyna_smp_r11.2.1/ls11_smp i=test.k ncpu=4

mpiexec -n 4 /usr/lsdyna_smp_r11.2.1/ls11_smp i=test.k ncpu=4 (测试)

