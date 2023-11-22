# OpenCDA环境变量配置
set CARLA_HOME=D:\carla_0.9.12
set CARLA_VERSION=0.9.12
echo %CARLA_HOME%
echo %CARLA_VERSION%

set SUMO_HOME=D:\Sumo
echo %SUMO_HOME%

# cmd进conda环境脚本
C:\ProgramData\miniconda3\Scripts\activate.bat
# git bash进conda环境脚本
C:\ProgramData\miniconda3\Scripts\activate


conda activate opencda

# OpenCDA测试carla
python opencda.py -t single_2lanefree_carla -v 0.9.12

# OpenCDA测试carla+sumo
python opencda.py -t platoon_joining_2lanefree_cosim -v 0.9.12

# OpenCDA测试carla+sumo+Pytorch
python opencda.py -t single_town06_cosim  -v 0.9.12 --apply_ml
