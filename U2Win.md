sudo grub-reboot 2 #指定选择Windows系统
sudo reboot

# 为了快捷方便，可以在桌面创建快捷方式，并写一个可执行脚本来实现重启
[Desktop Entry]
Encoding=UTF-8
Name=Reboot to Windows
Icon=help-about
Exec=bash /home/你的.sh文件绝对路径
Type=Application
Terminal=false
