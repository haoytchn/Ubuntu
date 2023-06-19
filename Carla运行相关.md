## 源码版：

- 安装编译版UE4和Carla后的启动

```bash
# 为了方便启动carla，在carla文件夹下建立启动脚本
${UE4_ROOT}/Engine/Binaries/Linux/UE4Editor "${PWD}/Unreal/CarlaUE4/CarlaUE4.uproject"
```

## 预编译版：

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
