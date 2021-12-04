1.解压Openmpi源码包
sudo tar -xvf openmpi-4.0.7.tar.gz
2.安装OpenMPI、进入源码根目录，运行配置文件，开始安装：
cd openmpi-4.0.7/
./configure --prefix=/usr/openmpi
sudo make
sudo make install
3.配置环境变量
	sudo vim /etc/profile
	##openmpi##
	export PATH=$PATH:/usr/openmpi/bin
	export LD_LIBRARY_PAHT=/usr/openmpi/lib
	source /etc/profile
	
	sudo vim /home/.bashrc
	##openmpi##
	export PATH=$PATH:/usr/openmpi/bin
	export LD_LIBRARY_PAHT=/usr/openmpi/lib
	source /etc/.bashrc

4、测试
cd /usr/openmpi-4.0.7/examples
make
mpirun -np 4 ./hello_c
输出：打印4次