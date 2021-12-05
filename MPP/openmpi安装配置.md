### 前言：

安装依赖：尽量使用默认ubuntu官方源，否则可能出错，当无法解决依赖冲突时，使用aptitude自动安装依赖。（sudo apt-get install aptitude；sudo aptitude install XXXX）

sudo apt-get install gcc

sudo apt-get install g++

sudo apt-get install gfortran

### 步骤

1.解压Openmpi源码包
sudo tar -xvf openmpi-4.0.7.tar.gz
2.安装OpenMPI、进入源码根目录，运行配置文件，开始安装：
cd openmpi-4.0.7/
./configure --prefix=/usr/openmpi
sudo make
sudo make install
3.配置环境变量

```
sudo vim /etc/profile
##openmpi##
export PATH=$PATH:/usr/openmpi/bin
export LD_LIBRARY_PAHT=/usr/openmpi/lib
source /etc/profile
```

​	

	sudo gedit /home/hyt/.bashrc
	##openmpi##
	export PATH=$PATH:/usr/openmpi/bin
	export LD_LIBRARY_PAHT=/usr/openmpi/lib
	source /home/hyt/.bashrc

4、测试
cd /usr/openmpi-4.0.7/examples
make
mpirun -np 4 ./hello_c
输出：打印4次



出现libmpi_mpifh.so cannot open shared object file错误，执行：

sudo apt-get install openmpi-bin openmpi-doc libopenmpi-dev。

dyna使用动态链库，.so加入环境变量。