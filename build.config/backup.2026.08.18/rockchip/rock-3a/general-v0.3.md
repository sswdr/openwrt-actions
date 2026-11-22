备注：
```
基于 backup.2026.08.18/rockchip/rock-3a/general-v0.1.md，关于通讯模块测试：

1、支持 / 兼容 qmodem 的插件路线、支持 / 兼容 qmodem 的插件路线：

勾选
> LuCI
    > 3. Applications
        <*> luci-app-5gmodem                # 位于 调制解调器 - 5G 调制解调器，依赖luci-proto-modemmanager，能兼容modemmanager的综合管理插件，需要额外添仓库加进编译
    > 5. Protocols
        <*> luci-proto-modemmanager         # 位于 状态 - 蜂窝网络，这个只是一个概览页面，基于modemmanager组件
> Network
    <*> modemmanager                        # 通用调制解调器管理守护进程

勾选
> LuCI
    > 3. Applications
        <*> luci-app-qmodem-next            # 面向 OpenWrt 和 ImmortalWrt 的蜂窝模组管理与拨号组件。它负责发现 USB、PCIe 模组，管理 AT 端口和数据接口，并通过 LuCI 提供拨号、状态监控、短信和厂商高级功能

```
