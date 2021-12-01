# ubuntu mpp lsdyna配置

1. 将解压出来的求解器`改名为ls971`，通过U盘拷贝到Linux机器下的/home/username(你的帐户名)/lsdyna/ 文件夹下。

2. 进入lsdyna文件夹，输入./ls971 info，./ 表示执行程序，若程序不在当前文件夹下，则程序名需要带上路径(见第7步)，info参数用于生成注册文件lstc.log，但如果你安装的Linux也是Ubuntu，将会报错，`错误为：缺少libnuma.so.1`，网上可下载，放入/usr/lib64/文件夹下即可。

3. 得到的LICENSE文件LSTC_FILE放到/usr/local/lstc/文件夹下， 并设置全局环境变量 `LSTC_FILE="/usr/local/lstc/LSTC_FILE"`

   > source /etc/profile

4. 进入/home/username/keyfiles/文件夹，执行算例: ./home/username/lsdyna/ls971 i=testcase.k 当然还可以设置memory、cpu等参数，与win下相同；计算结果文件会输出到当前文件夹下，应该可以通过指定o=参数更改。

5. 若要后台计算，可Ctrl+Z挂起程序，再输入bg进行后台运行，或者在执行dyna计算时命令后面加入 & 符号可以直接后台运行。

   若想与执行ls等命令一样只输入一个单词，而不是通过 ./home/username/lsdyna/ls971 这种形式执行dyna，可将dyna程序放到/bin/目录下。

   

查看CPU架构：

> 1. arch
> 2. uname -m
> 3. uname -a
> 4. dpkg --print-architecture



```bash
安装openmpi
sudo apt-get install openmpi-bin openmpi-doc libopenmpi-dev
安装mpi
sudo apt install mpich
```

/home/hyt/lsdyna/ls11mpp info

# ANSYS LIC配置

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

# 并行Openmpi安装

很多时候，安装Openmpi，输入sudo....后，会出现“无法找到安装包”的情况，又说先“update”或者再“upgrade”的。但我也照做了，可是并没有什么用。

后来我参考了很多方法，亲测了一种，有效！！！

\1. 下载解压，指定安装路径：

wget https://www.open-mpi.org/software/ompi/v2.0/downloads/openmpi-4.1.2.tar.gz

tar zxvf openmpi-4.1.2.tar.gz

cd openmpi-4.1.2 

sudo ./configure --prefix=/usr/local

2.编译安装：

sudo make

sudo make install

\3. 配置环境变量（~/.bashrc）

export PATH=$PATH:/usr/local/openmpi/bin 

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/openmpi/lib/

source ~/.bashrc 

sudo ldconfig 

4.测试：

cd examples

make

mpirun -np 8 hello_c
