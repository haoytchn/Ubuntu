# 1.mpp dyna安装

安装单独对应版本mpp dyna；配置mpi；安装完ANSYS LIC后，定义LIC环境变量。

# 2.ANSYS LIC配置，破解

> 	If you HAVE NO ANSYS 2021R1 with SSQ's crack installed
>
> 1. Extract folder lsdyna_smp_r11.2.1 to /usr
>
> 2. Define ANSYS licensing for LS-DYNA as:
>
>       export LSTC_LICENSE=ANSYS
>       export ANSYSLIC_DIR=/usr/lsdyna_smp_r11.2.1/ansys_inc/shared_files/licensing
>
> 3. Run lsdyna_smp_r11.2.1 solvers with:
>
> /usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
> /usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
> /usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
> /usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
>
>
> 	If you HAVE ANSYS 2021R1 with SSQ's crack installed
>
> 1. Extract folder lsdyna_smp_r11.2.1 to /usr
>
> 2. Define ANSYS licensing for LS-DYNA as:
>
>    export LSTC_LICENSE=ANSYS
>    export ANSYSLIC_DIR= full path to folder ./ansys_inc/shared_files/licensing on your computer
>    (by default /opt/ansys_inc/shared_files/licensing )
>
> 3. Run lsdyna_smp_r11.2.1 solvers with:
>
> /usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
> /usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
> /usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
> /usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
>
> WWW.DOWNLOADLY.IR

调用mpi启动mpp求解器(root用户组)：

--allow-run-as-root

mpiexec --allow-run-as-root  -n 4 /home/hyt/dyna/ls11 i=test.k ncpu=4

调用mpi启动mpp求解器(普通用户组)：

mpiexec -n 4 Test_MPI.exe

mpiexec -n 4 /home/hyt/dyna/ls11 i=test.k ncpu=4

启动smp求解器：

/usr/lsdyna_smp_r11.2.1/ls11_smp i=test.k ncpu=4

mpiexec -n 4 /usr/lsdyna_smp_r11.2.1/ls11_smp i=test.k ncpu=4 (测试)

