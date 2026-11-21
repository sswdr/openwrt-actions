备注：
```
基于 backup.2026.08.18/rockchip/rock-3a/general-v0.md 测试：

1. 内核驱动 (Kernel modules -> USB Support)

	驱动层面建议“大而全”，把主流的USB数据模式都覆盖到，避免未来换模块时重新编译固件。

	kmod-usb-net-qmi-wwan：QMI协议驱动，EM7430当前工作模式的必备驱动。

	kmod-usb-net-cdc-mbim：MBIM协议驱动，OpenWrt推荐的标准模式，兼容性最好。

	kmod-usb-net-rndis：RNDIS驱动，FM350-GL等模块在USB模式下通常依赖此驱动。

	kmod-usb-net-cdc-ncm：NCM驱动，Rock 3A的设备包中已默认包含，作为备选模式支持。

	kmod-usb-net-cdc-ether：ECM驱动，部分模块的备选USB网卡模式。

	kmod-usb-serial-option：串口驱动，用于生成AT命令端口，是调试和短信功能的底层基础。

	kmod-usb-serial-wwan：WWAN串口支持，kmod-usb-serial-option的依赖项。

2. 连接管理与LuCI界面 (Network & LuCI)

	这是实现你要求的“LuCI管理台”和“短信管理”的核心。

	modemmanager：蜂窝连接管理守护进程核心。

	⚠️ 关键确认：在 Network -> ModemManager 下，确保 Include QMI support 和 Include MBIM support 处于选中状态（通常默认即为 y），这样ModemManager自身就具备管理QMI和MBIM模块的能力。

	luci-proto-modemmanager：ModemManager的LuCI网页配置界面，在“网络-接口”中提供管理入口。

	luci-proto-ipv6：确保IPv6协议在LuCI界面中可用（如果尚未包含）。

3. 诊断与调试工具 (Utilities)

	方便后期通过SSH排查问题，不依赖网页界面也能工作。

	picocom：轻量级串口终端。SSH登录后，可用它直接连接 /dev/ttyUSB* 发送AT指令，比minicom更简洁。
	
	uqmi：QMI协议命令行工具。当ModemManager网页界面异常时，可用它进行底层QMI拨号测试。

	umbim：MBIM协议命令行工具。同样作为ModemManager的底层调试备用。

	usb-modeswitch：确保模块从初始的“虚拟光驱”等模式正确切换到串口/网卡模式。

4. 其他补充
    minicom                         # AT串口调试工具
    fibocom-dial                    # 广和通拨号工具
    kmod-usb2
    kmod-usb3
    kmod-usb-net                    # 确认已勾选
    usb-modeswitch                  # 确认已勾选
    kmod-mii                        # 确认已勾选
    kmod-usb-wdm                    # 确认已勾选
    comgt-ncm                       # NCM模式支持
    kmod-usb-net-cdc-ncm            # NCM模式支持
    kmod-usb-net-huawei-cdc-ncm     # NCM模式支持

5. PCIe模块支持
    kmod-mhi-net
    kmod-qrtr-mhi
    kmod-mhi-pci-generic
    kmod-mhi-wwan-mbim
    kmod-mhi-wwan-ctrl


luci-app-5gmodem


```
