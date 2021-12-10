	If you HAVE NO ANSYS 2021R1 with SSQ's crack installed

1. Copy folder "lsdyna_smp_r11.2.1" to any root drive (C:, D:, E:, etc) of computer 

2. Create environment variables:

   LSTC_LICENSE=ANSYS
   ANSYSLMD_LICENSE_FILE pointing to .\lsdyna_smp_r11.2.1\licensingclient\ansyslmd.lic

3. Run "SolidSQUADLoaderEnabler.reg" and confirm to add info into Windows Registry

4. REBOOT!

   Run LS-DYNA solvers from CMD line:

   .\lsdyna_smp_r11.2.1\ls-dyna_smp_d_R11_2_1_winx64_ifort170.exe <options> i=<inputfile>
   .\lsdyna_smp_r11.2.1\ls-dyna_smp_s_R11_2_1_winx64_ifort170.exe <options> i=<inputfile>


	If you HAVE ANSYS 2021R1 with SSQ's crack installed

1. Copy folder "lsdyna_smp_r11.2.1" to any root drive (C:, D:, E:, etc) of computer 

2. Create environment variables:

   LSTC_LICENSE=ANSYS
   ANSYSLMD_LICENSE_FILE pointing to .\ANSYS Inc\Shared Files\Licensing\license_files\ansyslmd.lic
   on your computer
   (by default: C:\Program Files\ANSYS Inc\Shared Files\Licensing\license_files\ansyslmd.lic )

3. Run "SolidSQUADLoaderEnabler.reg" and confirm to add info into Windows Registry

4. REBOOT!

      Run LS-DYNA solvers from CMD line:

   .\lsdyna_smp_r11.2.1\ls-dyna_smp_d_R11_2_1_winx64_ifort170.exe <options> i=<inputfile>
   .\lsdyna_smp_r11.2.1\ls-dyna_smp_s_R11_2_1_winx64_ifort170.exe <options> i=<inputfile>

WWW.DOWNLOADLY.IR