备注：
```
基于 backup.2026.08.18/rockchip/rock-3a/general-v0.md，关于通讯模块测试：

1、支持 / 兼容 modemmanager 的插件路线：

> LuCI
    > 5. Protocols
        <*> luci-proto-modemmanager         # 位于 状态 - 蜂窝网络，这个只是一个概览页面，基于modemmanager组件
    > 3. Applications
        <*> luci-app-5gmodem                # 位于 调制解调器 - 5G 调制解调器，依赖luci-proto-modemmanager，能兼容modemmanager的综合管理插件，需要额外添仓库加进编译

> Kernel modules
    > Network Devices
        <*> kmod-mii                        # MII 总线支持，部分 USB 网卡驱动依赖
        <*> kmod-mhi-pci-generic            # MHI 总线的通用 PCIe 驱动
        <*> kmod-mhi-net                    # MHI 总线上的网络驱动
        <*> kmod-mhi-wwan-ctrl              # MHI WWAN 控制接口驱动
        <*> kmod-mhi-wwan-mbim              # MHI WWAN MBIM 驱动
        <*> kmod-qrtr-mhi                   # 基于 MHI 的 QRTR 协议支持
    > USB Support
        <*> kmod-usb2                       # 内核对 USB 2.0 的支持
        <*> kmod-usb3                       # 内核对 USB 3.0 的支持
        <*> kmod-usb-acm                    # USB ACM 类调制解调器支持
        <*> kmod-usb-wdm                    # USB WDM 类设备支持
        <*> kmod-usb-net                    # USB 网络设备核心驱动
        <*> kmod-usb-net-cdc-ether          # USB CDC-Ethernet 协议驱动
        <*> kmod-usb-net-cdc-ncm            # USB CDC-NCM 协议驱动
        <*> kmod-usb-net-huawei-cdc-ncm     # 华为模块专用 CDC-NCM 驱动
        <*> kmod-usb-net-qmi-wwan           # QMI 协议 WWAN 网络驱动
        <*> kmod-usb-net-cdc-mbim           # MBIM 协议 WWAN 网络驱动
        <*> kmod-usb-net-rndis              # RNDIS 协议网络驱动
        <*> kmod-usb-serial-option          # Option 等厂商 USB 串口设备支持
        <*> kmod-usb-serial-wwan            # WWAN 模块 USB 串口驱动
        <*> kmod-usb-serial-qualcomm        # 高通 Gobi 系列 USB 串口驱动

> Network
    <*> modemmanager                        # 通用调制解调器管理守护进程
    > WWAN
        <*> comgt-ncm                       # NCM 模式拨号与控制工具
        <*> umbim                           # MBIM 协议命令行控制工具
        <*> uqmi                            # QMI 协议轻量级命令行控制工具

> Utilities
    <*> usb-modeswitch                  # USB 模式切换工具
    <*> mbim-utils                      # MBIM 协议工具集
    <*> qmi-utils                       # QMI 协议工具集
    <*> fibocom-dial                    # 广和通模块专用拨号工具
    <*> sms-tool                            # 通过 AT 命令收发短信的工具
    > Terminal
        <*> picocom                         # 极简串口终端工具
        <*> minicom                         # 功能较丰富的串口通信工具
    > coreutils
        <*> coreutils-stty                  # 串口终端参数配置工具

```
