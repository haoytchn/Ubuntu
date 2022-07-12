# Lsdyna安装——Windows平台

## 准备：

安装C++和Fortran编译器（lsdyna依赖Fortran编译器）：

> ww_ifort_redist_msi_2019.5.281.zip
>
> ww_icl_redist_msi_2019.5.281.zip

## 1.licence配置

- 复制破解目录licensingclient到某处

- 设置环境变量

  > LSTC_LICENSE=ANSYS

- 设置环境变量

  > ANSYSLMD_LICENSE_FILE=XX\licensingclient\ansyslmd.lic

- 运行SolidSQUADLoaderEnabler.reg增加注册表

- 重启电脑

- 使用lsrun或者命令行直接调用求解器程序

## 2.Windows mpp配置

- 安装msmpi程序

  > msmpisdk.msi
  >
  > msmpisetup.exe

- C:\Program Files\Microsoft MPI\Bin下输入指令：`set MSMPI`

- 屏幕输出4行环境变量则mpp配置成功

- 使用lsrun或者命令行调用mpp求解器

  ```shell
  mpiexec -c 8 -aa "E:\Program Files\LSTC\LS-Run 1.0\R13.0.0\ls-dyna_mpp_s_R13.0_365-gf8a97bda2a_winx64_ifort190_msmpi.exe" i=test.k memory=100m
  ```

  

# Lsdyna安装——Linux平台

## 准备：

安装运行库………………

## 1.licence配置

- 复制破解目录licensingclient到某处

- 设置环境变量

  ```shell
  ## 普通用户
  gedit ~/.bashrc
  # 末尾增加以下两行，保存
  export LSTC_LICENSE=ANSYS
  export ANSYSLIC_DIR=/usr/lsdyna_smp_r11.2.1/ansys_inc/shared_files/licensing
  source ~/.bashrc
  
  ## root用户
  sudo gedit /etc/profile
  # 末尾增加以下两行，保存
  LSTC_LICENSE=ANSYS
  ANSYSLIC_DIR=/usr/lsdyna_smp_r11.2.1/ansys_inc/shared_files/licensing
  sudo source /etc/profile
  ```

  

- 使用lsrun或者命令行调用求解器

## 2.Linux mpp配置

安装依赖………………

安装mpi………………
