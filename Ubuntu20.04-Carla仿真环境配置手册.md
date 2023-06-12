# 《Ubuntu20.04-Carla仿真环境配置手册》

## 前言：

**文本编辑与环境变量：**

```bash
vim ~/.bashrc # 文本编辑命令行
gedit  ~/.bashrc # 文本编辑编辑器
source  ~/.bashrc # 刷新环境变量
```

**一些命令：**

```bash
pwd # 输出当前路径
cd ~ # 进入用户根目录
sudo chmod -R 777 filename # 文件加权
ls -a # 显示所有文件包含隐藏文件
df -h # 查看磁盘空间
tar -zxvf [文件名].tar.gz -C [文件目录] # 解压.gz文件到指定目录
```

### 设定root密码：

` sudo passwd`

### 更新系统：

`sudo apt update`

`sudo apt upgrade`

### 双系统问题：

 - **双系统时间同步**
   终端执行： `timedatectl set-local-rtc 1`
   双系统的时间不同步是由于，ubuntu会设置主机中的COMS时间为UTC时间，然后加上ip时区计算出本地时间，而windows则是使用CMOS中的时间为本地时间。

 - **双系统重启切换**

   - 永久修改启动顺序：

     `/etc/default/grub`，通过修改`GRUB_DEFAULT=0`这个值。

   - 通过bash指令，指定重启到Windows系统，但不影响BIOS默认的选择：
   
     ```bash
     sudo grub-reboot 2 #指定选择Windows系统
     sudo reboot
     ```
   

### 图形化桌面问题：

- 默认图形修复、安装：

  ```bash
  sudo apt-get install ubuntu-desktop
  startx 
  # 设置ubuntu开机的默认开启方式为图形化界面显示
  sudo systemctl set-default graphical.target
  ```

- 图形用户管理器安装：

  ```bash
  # lightdm是一款用户登录管理器，ubuntu自带的管理器为gdm。
  # 这里建议使用默认的gdm，可以开机自动登录账户，同时远程桌面支持良好。
  sudo apt install lightdm
  # 卸载 sudo apt remove lightdm
  # 配置默认登录管理器
  #sudo dpkg-reconfigure lightdm
  sudo dpkg-reconfigure gdm
  # 设置ubuntu开机的默认开启方式为图形化界面显示
  sudo systemctl set-default graphical.target
  ```

### 安装Typora压缩包程序：

```bash
# 安装Typora应用为例，命令启动；增加桌面图标
tar xzvf Typora-linux-x64.tar.gz
#添加Typora环境变量
sudo gedit ~/.bashrc
export PATH=$PATH:/opt/Typora-linux-x64
source ~/.bashrc
```

```bash
# 添加桌面图标
cd /usr/share/applications
sudo gedit typora.desktop
# 写入以下内容
[Desktop Entry]
Name=Typora
Comment=Typora
Exec=/opt/Typora-linux-x64/Typora
Icon=/opt/Typora-linux-x64/resources/app/asserts/icon/icon_256x256.png
Terminal=false
Type=Application
Categories=Developer;
# 重启系统
```

### 安装Notepad++：

```sudo snap install notepad-plus-plus```

### samba共享文件夹配置：

```bash
sudo apt-get install samba
mkdir /home/share
chmod 777 /home/share
```

```bash
# 加入以下配置信息
sudo gedit /etc/samba/smb.conf

# 名为share的文件夹共享
[share]
comment = share test
path = /home/share
browseable = yes
guest ok = yes
writable = yes
available = yes
```

```bash
# 重启smb服务
service smbd restart
# 通过\\IP访问
```

## 一、Ubuntu科学上网

Qv2ray图形+v2ray内核，所需文件可在github项目找到：

- 内核：[v2ray-linux-64.zip](https://github.com/v2ray/v2ray-core/releases/download/v4.27.5/v2ray-linux-64.zip)

- 图形：[Qv2ray-v2.7.0-linux-x64.AppImage](https://github.com/Qv2ray/Qv2ray/releases/download/v2.7.0/Qv2ray-v2.7.0-linux-x64.AppImage)
- 内核设置：
  - V2Ray 核心可执行文件路径：home/user/v2ray-linux-64/v2ray
  - V2Ray 资源目录：/home/user/v2ray-linux-64

只需要给文件```Qv2ray-v2.7.0-linux-x64.AppImage```赋予可运行权限```sudo chmod -R 777 filename```，直接运行。

## 二、Miniconda安装和配置

### 1.  安装

安装过程选yes，安装完毕在conda环境中运行`conda init`命令完成初始化。

> user用户和root用户需要分别初始化用户环境。

**环境配置问题最直接解决办法：**

`vim ~/.bashrc`

最后一行插入以下命令：

```bash
eval "$(/home/user/miniconda3/bin/conda shell.bash hook)"

conda activate 自定义名字
```

刷新环境变量：

`source .bashrc`

done.

### 2.  Conda 更新

   更新：

   `conda update conda` #更新至最新版本，也会更新其它相关包

   `conda update --all` #更新所有包

   查看源：
   `conda config --show-sources`

   添加国内源：

```bash
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
conda config --set show_channel_urls yes
```

   换回默认源：
   `conda config --remove-key channels`

### 3.  Pip 更新

```bash
python -m pip install --upgrade pip
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple # 换源
```

### 4.  环境变量配置(user+root)

   - user用户：

   1. `cd ~`用户根目录

   2. `ls -a`显示所有文件包括隐藏

   3. `vim .bashrc`最后一行插入以下命令

      `eval "$(/home/user/miniconda3/bin/conda shell.bash hook)"`

      conda activate py37

   4. `source .bashrc`

   - root用户：

   1. 切换到root用户，操作同上

## 三、Carla-Ubuntu安装配置

### 注意事项，避免踩坑：

1. Python版本使用3.7，建议使用pip包管理（pip库比conda全和新？），先配置好Python环境再进行下一步。
2. UE：CALAR 0.9.12 以后的版本Unreal Engine 4.26；以前是4.24。
2. 显卡驱动问题：N卡VMware虚拟机驱动不支持；docker驱动支持。

### 1. Python环境配置

- 使用miniconda管理环境。

### 2. Carla安装使用

####  Carla的几种安装方式：

>- 下载编译好的Release版本运行
>
>  只能运行，不能自定义场景等。
>
>- Clone源码编译安装
>
>  推荐方式。
>
>- 下载Docker镜像运行
>
>  网上反馈并不好用。

#### a. 使用编译好的版本

​	最新版本`CARLA_0.9.14`

**安装：**	

```tar -zxvf CARLA_0.9.14.tar.gz -C ./carla```
```tar -zxvf AdditionalMaps_0.9.14.tar.gz -C ./carla```

```bash
# 将下载的 AdditionalMaps_0.9.13.tar.gz 放到 carla 的 import 目录下
cd carla
./ImportAssets.sh
sudo apt-get install libomp5 # 安装需要的动态链库```
```

**运行：**

​	```./CarlaUE4.sh -prefernvidia```
​	```./CarlaUE4.sh -prefernvidia -quality-level=Low -benchmark -fps=15```

**启动 CARLA 时，有一些配置选项可用：**

- carla-rpc-port=N：侦听端口 N 处的客户端连接。默认情况下，流式端口 Streaming port 设置为 N+1

- ```carla-streaming-port=N```：指定用于传感器数据流的端口。 使用 0 获取随机未使用的端口。 第二个端口将自动设置为 N + 1
- ```quality-level={Low,Epic}```：更改图形质量级别
- ```-carla-server```：让 carla以服务的方式运行
- ```-benchmark -fps=15```：引擎以1/15秒的固定时间逐步运行
- ```-windowed -ResX=800 -ResY=600```：屏幕窗口大小

**操作：**

隐藏房屋建筑，仅留下道路，减少显卡渲染的任务量，方法：Shift+V  全选建筑物   Shift+B 隐藏所有建筑物。

#### b.  Clone源码编译安装

##### 编译环境准备：

> 以0.9.12为例

- 安装依赖

  ```bash
  # 编译工具
  sudo apt-get install cmake gcc g++
  # ubuntu20.04自带clang-10，中途会提示缺失clang-8
  sudo apt-get install clang-8 
  # 编译PythonAPI会报错缺少ninja-build
  sudo apt-get install ninja-build
  ```

- 坑一 - clang

  ```bash
  # clang-8的坑
  # 如果冲突是在无法解决，使用aptitude进行安装，aptitude 会对依赖关系进行智能处理
  sudo apt-get install aptitude
  sudo aptitude install clang-8
  
  # 仍然无法解决，另一种方案
  # http://www.taodudu.cc/news/show-1291615.html?action=onClick
  
  # 这里还有一个办法，将路径下calra/Util/BuildTools中的Setup.sh里的clang++-8.0等的8全部改成10.0，由于UE使用Clang-8，除非无法编译否则不建议这样改。
  ```

- 坑二 - pyconfig.h

  ```bash
  #在 make pythonAPI 的时候，可能会报错 `pyconfig.h not found`， 这里需要添加一下路径到 .bashrc 中
  export CPLUS_INCLUDE_PATH=/home/用户名/miniconda3/envs/py37/include/python3.7m
  ```

- 坑三 - 安装xerces-c-3.2.3.tar.gz

  ```bash
  # 在运行脚本Setup.sh的时候，需要安装xerces-c-3.2.3.tar.gz，可是这个包的地址已经被修改了，需要修改/Util/BuildTools/Setup.sh文件中xerces的下载地址，把432行
  #XERCES_REPO的地址改为:
  https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.3.tar.gz
  ```

##### ①安装UE

- 注册关联UE与Github账号，成为开发者成员。`https://www.unrealengine.com/en-US/ue-on-github`

- 下载

  ```bash
  # aria2是一个下载加速工具
  sudo apt-get install aria2
  # 克隆UE
  git clone --depth 1 -b carla https://oauth2:你的github token@github.com/CarlaUnreal/UnrealEngine.git ~/UnrealEngine_4.26
  
  # 上面方法未经验证，以下备用
  # git clone -b 4.26 git@github.com:EpicGames/UnrealEngine.git ~/UnrealEngine_4.26
  ```

  ~/UnrealEngine_4.26这里还需要修改一下，下载指定branch版本

- 编译

  ```bash
  # 编译UE4
  cd ~/UnrealEngine_4.26
  ./Setup.sh && ./GenerateProjectFiles.sh && make
  ```
  
  ```bash
  # UE4环境变量，注意用户环境变量，不要用root
  gedit ~/.bashrc
  export UE4_ROOT=~/UnrealEngine_4.26
  source ~/.bashrc
  ```
  
- 启动

  ```bash
  # 第一次启动UE会非常慢
  cd ~/UnrealEngine_4.26/Engine/Binaries/Linux && ./UE4Editor
  ```

##### ②安装Carla

- 克隆仓库

  ```
  git clone -b 0.9.12 git@github.com:carla-simulator/carla.git ~/carla
  ```

- 安装依赖

  ```bash
  # 安装依赖，doc上的命令：
  sudo apt-get update &&
  sudo apt-get install wget software-properties-common &&
  sudo add-apt-repository ppa:ubuntu-toolchain-r/test &&
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add - &&
  sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" &&
  sudo apt-get update
  
  # Ubuntu 20.04.
  sudo apt-add-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal main"
  sudo apt-get install build-essential clang-10 lld-10 g++-7 cmake ninja-build libvulkan1 python python-dev python3-dev python3-pip libpng-dev libtiff5-dev libjpeg-dev tzdata sed curl unzip autoconf libtool rsync libxml2-dev git
  
  # 使用和UE同版本clang-8，关联clang-8
  sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-10/bin/clang++ 180 &&
  sudo update-alternatives --install /usr/bin/clang clang /usr/lib/llvm-10/bin/clang 180
  ```

- python配置

  ```bash
  # 关于python的配置
  # For Python 3
  pip3 install --upgrade pip
  
  # 必须安装以下Python依赖:
  pip3 install --user -Iv setuptools==47.3.1 &&
  pip3 install --user distro &&
  pip3 install --user wheel auditwheel
  ```

- carla编译

  > 需要编译：
  >
  > PythonAPI
  >
  > launch
  >
  > make LibCarla 

  | Command          | Description                                                  |
  | ---------------- | ------------------------------------------------------------ |
  | `make help`      | Prints all available commands.                               |
  | `make launch`    | Launches CARLA server in Editor window.                      |
  | `make PythonAPI` | Builds the CARLA client.                                     |
  | `make LibCarla`  | Prepares the CARLA library to be imported anywhere.          |
  | `make package`   | Builds CARLA and creates a packaged version for distribution. |
  | `make clean`     | Deletes all the binaries and temporals generated by the build system. |
  | `make rebuild`   | `make clean` and `make launch` both in one command.          |

  ```bash
  # 确保上述所有进行完之后再编译carla
  cd ~/carla
  ./Update.sh
  make PythonAPI # 遇到坑一、二、三
  make launch
  make LibCarla
  ```

#### c. 下载docker镜像运行

见网络。

## 四、Git配置

```bash
# 命令，看是否已有配置
~/.ssh
# 出现 /c/Users/XXXX/.ssh: No such file or directory，表示未配置ssh

# 命令，生成rsa密钥
ssh-keygen -t rsa -C "yourmail@gmail.com"

# 生成两个文件：
# id_rsa
# id_rsa.pub
# 将id_rsa.pub内容复制到github账号里

# 命令，查看是否成功连接github账号
ssh -T git@github.com

Are you sure you want to continue connecting (yes/no/[fingerprint])? 
yes
# 输入yes

You've successfully authenticated, but GitHub does not provide shell access.
# 表示连接成功
```

