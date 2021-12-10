	If you HAVE NO ANSYS 2021R1 with SSQ's crack installed

1. Extract folder lsdyna_smp_r11.2.1 to /usr

2. Define ANSYS licensing for LS-DYNA as:

   export LSTC_LICENSE=ANSYS
   export ANSYSLIC_DIR=/usr/lsdyna_smp_r11.2.1/ansys_inc/shared_files/licensing

3. Run lsdyna_smp_r11.2.1 solvers with:

/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>


	If you HAVE ANSYS 2021R1 with SSQ's crack installed

1. Extract folder lsdyna_smp_r11.2.1 to /usr

2. Define ANSYS licensing for LS-DYNA as:

   export LSTC_LICENSE=ANSYS
   export ANSYSLIC_DIR= full path to folder ./ansys_inc/shared_files/licensing on your computer
   (by default /opt/ansys_inc/shared_files/licensing )

3. Run lsdyna_smp_r11.2.1 solvers with:

/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_d_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>
/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_ifort160 <options> i=<inputfile>
/usr/lsdyna_smp_r11.2.1/ls-dyna_smp_s_R11_2_1_x64_centos610_pgi165 <options> i=<inputfile>

WWW.DOWNLOADLY.IR