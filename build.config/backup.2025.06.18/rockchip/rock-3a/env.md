```
和rock-3b的区别：

rock-3b默认是生成双网口的配置
rock-3a默认是生成单网口的配置
    target/linux/rockchip/armv8/base-files/etc/board.d/02_network

.config区别
    # CONFIG_TARGET_rockchip_armv8_DEVICE_radxa_rock-3a is not set
    CONFIG_TARGET_rockchip_armv8_DEVICE_radxa_rock-3b=y
    改为
    CONFIG_TARGET_rockchip_armv8_DEVICE_radxa_rock-3a=y
    # CONFIG_TARGET_rockchip_armv8_DEVICE_radxa_rock-3b is not set
    
    CONFIG_TARGET_PROFILE="DEVICE_radxa_rock-3b"
    改为
    CONFIG_TARGET_PROFILE="DEVICE_radxa_rock-3a"

    CONFIG_DEFAULT_iptables-mod-tproxy=y
    CONFIG_DEFAULT_kmod-ata-ahci=y
    CONFIG_DEFAULT_kmod-ata-ahci-dwc=y
    CONFIG_DEFAULT_kmod-ata-ahci-platform=y
    CONFIG_DEFAULT_kmod-button-hotplug=y
    CONFIG_DEFAULT_kmod-drm-rockchip=y
    CONFIG_DEFAULT_kmod-ipt-nat6=y
    CONFIG_DEFAULT_kmod-ipt-raw=y
    CONFIG_DEFAULT_kmod-nf-nathelper=y
    CONFIG_DEFAULT_kmod-nf-nathelper-extra=y
    CONFIG_DEFAULT_kmod-nvme=y
    CONFIG_DEFAULT_kmod-r8125-rss=y
    CONFIG_DEFAULT_kmod-scsi-core=y
    CONFIG_DEFAULT_kmod-tun=y
    CONFIG_DEFAULT_kmod-usb-net-cdc-ncm=y
    CONFIG_DEFAULT_kmod-usb-net-rndis=y
    CONFIG_DEFAULT_libc=y
    改为
    CONFIG_DEFAULT_iptables-mod-tproxy=y
    CONFIG_DEFAULT_kmod-button-hotplug=y
    CONFIG_DEFAULT_kmod-ipt-nat6=y
    CONFIG_DEFAULT_kmod-ipt-raw=y
    CONFIG_DEFAULT_kmod-nf-nathelper=y
    CONFIG_DEFAULT_kmod-nf-nathelper-extra=y
    CONFIG_DEFAULT_kmod-tun=y
    CONFIG_DEFAULT_libc=y
    
    CONFIG_PACKAGE_u-boot-rock-3b-rk3568=y
    改为
    CONFIG_PACKAGE_u-boot-rock-3a-rk3568=y

其余全部同rock-3b
```
