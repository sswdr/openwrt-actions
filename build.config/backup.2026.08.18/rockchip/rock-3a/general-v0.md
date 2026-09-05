备注：
```
一、使用下面的[1、2、3、4]，基于已有的[backup.2025.06.18 rockchip rock-3a general-v0.md]的配置

二、在backup.2026.08.18 env中，勾选缺失的下面[1、2、3、4]中的选项

三、当前情况：
    ①、目前文件勾选了vsftpd和vsftpd-alt，这两个包存在文件冲突，编译会报错，需要取消勾选vsftpd-alt，保留vsftpd
        因为原先的luci-app-vsftpd默认是依赖vsftpd-alt，现在是vsftpd，导致两个都勾选了
        > Network
            > File Transfer
                -*- vsftpd
                < > vsftpd-alt

    ②、缺失了：
        luci-app-fileassistant
        luci-app-webadmin
        kmod-aic8800u
    
    ③、目前仅补齐aic8800、mt7601、nfa765驱动
    > Kernel modules
        > Bluetooth Support
            <*> kmod-aic8800-btusb      # 蓝牙暂时无用
        > Wireless Drivers
            <*> kmod-aic8800-usb
            <*> kmod-ath11k-pci
            <*> kmod-mt7601u
    > Firmware
        -*- aic8800-usb-firmware
        <*> ath11k-firmware-wcn6855

```

1.部署编译环境: env.md/{lede env}

2.配置Target：
```
Target System  ->  Rockchip
Subtarget      ->  RK33xx/RK35xx boards (64 bit)
Target Profile ->  Radxa ROCK 3A
Target Images
             ->  [*] ext4
             ->  [ ] squashfs  # 不勾选
             ->  [*] GZip images
             ->  (64) Kernel partition size (in MiB)
             ->  (960) Root filesystem partition size (in MiB) 
```

3.去掉非必要依赖：
```
> LuCI > 3. Applications
    < > luci-app-rclone、[ ] Include rclone-webui、[ ] Include rclone-ng (another webui)
    < > luci-app-turboacc、[ ] Include Flow Offload、[ ] Include BBR CCA
    < > luci-app-vlmcsd
> Network
    < > vlmcsd
```

4.编译配置：
```
> Base system
    [*]     Build with DHCPv6 support
    <*> resolveip  # 用于解析主机名为IP地址: resolveip sswPC

> Extra packages
    <*> ipv6helper

> Firmware
    <*> rtl8821ce-firmware

> Kernel modules 
    > Block Devices
        <*> kmod-ata-ahci
        <*> kmod-ata-ahci-platform
        <*> kmod-nvme
        <*> kmod-scsi-core
    > I2C support
        <*> kmod-i2c-core
    > Network Devices
        <*>   kmod-r8125-rss
        <*> kmod-r8168
    > USB Support
        -*- kmod-usb-core
        -*- kmod-usb-net
        -*- kmod-usb-net-cdc-ether
        <*> kmod-usb-net-cdc-ncm
        <*> kmod-usb-net-rndis
        <*> kmod-usb-serial
        <*> kmod-usb-serial-ch341
    > Video Support
        <*> kmod-drm-rockchip
        <*> kmod-video-core
        <*> kmod-video-uvc
        -*- kmod-video-videobuf2
    > Wireless Drivers
        <*> kmod-aic8800u
        <*> kmod-cfg80211
        <*> kmod-mac80211
        <*> kmod-mt7921-firmware
        <*> kmod-mt7921e
        <*> kmod-mt7922-firmware
        <*> kmod-rtw88-8821ce

> LuCI
    > 3. Applications
        <*> luci-app-accesscontrol                                  [5kb]服务-上网时间控制(能用)(控制ip/mac上网时间)
        <*> luci-app-autoreboot                                     [3kb]系统-定时重启
        <*> luci-app-cifs-mount                                     [5kb]网络存储-挂载SMB网络共享(挂载SMB到本地，修改挂载后，需要重启使用这些文件夹的客户端)
        <*> luci-app-ddns                                           [50kb]服务-动态dns(集成阿里DDNS客户端)
        <*> luci-app-diskman                                        [25kb]系统-磁盘管理
                [*] Include btrfs-progs                             [1mb]
                [*] Include lsblk                                   [100kb]
                [ ] Include mdadm
        <*> luci-app-dockerman                                      [25mb]Docker(luci-app-docker + docker管理)
        <*> luci-app-fileassistant(和luci-app-advanced冲突)         [10kb]服务-文件助手
        <*> luci-app-hd-idle                                        [10kb]网络存储-硬盘休眠(未测试，编译备用)
        <*> luci-app-mjpg-streamer                                  [14kb](未测试)(兼容Linux-UVC的摄像头程序)
        <*> luci-app-nlbwmon                                        [50KB]带宽监控(实时流量，统计，配置等)
        <*> luci-app-ramfree                                        [5KB]状态-释放内存(释放内存)
        <*> luci-app-samba4                                         [8mb]网络存储-网络共享(正常使用，需要调好配置文件)(支持Samba 4.x，Samba 4.x完全兼容Windows 10。Samba 4.x包括对SMBv2和SMBv3协议的支持)
        <*> luci-app-ttyd                                           [250KB]系统-putty(网页终端命令窗)
        <*> luci-app-upnp                                           [100KB]服务-UPnP(UPnP 允许局域网内客户端自动设置路由器上的端口转发)
        <*> luci-app-watchcat                                       [8kb]断网检测功能与定时重启
        <*> luci-app-webadmin                                       [5kb]系统-web管理(openwrt的web管理，例如设置端口号之类的)
        <*> luci-app-zerotier                                       [500KB]VPN-ZeroTier(能用,zerotier更新至1.12.2，luci-app-zerotier启动停止正常，使用无问题)(使用仓库openwrt-packages-ssw，lede的源码by ssw 2024.03.03)
    > 4. Themes
        <*> luci-theme-argon  # 默认勾选luci-theme-bootstrap=y不可取消，勾选luci-theme-argon=y，默认启用luci-theme-argon

> Multimedia
    -*- mjpg-streamer                                                               [8kb](luci-app-mjpg-streamer的核心依赖)
    <*> mjpg-streamer-input-uvc........................ MJPG-streamer (UVC input)   [18kb](必选，uvc输入模式)
    <*> mjpg-streamer-output-file.................... MJPG-streamer (file output)   [7kb](输出到指定目录插件)
    <*> mjpg-streamer-output-http.................... MJPG-streamer (HTTP output)   [15kb](必选，http页面的输出模式)
    <*> mjpg-streamer-www............................... MJPG-streamer (full www)   [130kb](必选和www-simple二选一，此页面是全量的)

> Network
    <*> 6in4
    <*> 6rd
    <*> 6to4
    <*> ethtool  # 用于调整太网适配器参数/模式
    <*> iperf3   # 调试测速
    <*> iw
    <*> iputils-ping  # 完整的ping命令
    [*]   Install legacy ping4 and ping6 symlinks
    > File Transfer
        <*> curl
    > NMAP Suite
        <*> ncat  # 例如测试github的push和update是否可用: ncat -zv github.com 443
    > SSH
        <*> openssh-sftp-server  # 提供sftp服务
    > WirelessAPD
        <*> hostapd-common
        <*>     wpad-openssl
        <*> wpa-cli

> Utilities
    <*> adb
    <*> coreutils
        <*>   coreutils-cp
        <*>   coreutils-dd
        <*>   coreutils-ls
        <*>   coreutils-mv
        <*>   coreutils-rm
    <*> docker-compose
    <*> gawk
    <*> getopt
    <*> grep
    <*> less
    <*> losetup
    <*> lm-sensors
    <*> pciutils  # 完整的lspci命令，包含pciids、libpci、libkmod，查看PCI总线，非busybox的不完整的lspci命令，此处的lspci -vv才能输出详细的pcie信息
    <*> procps-ng
        <*>   procps-ng-free
        <*>   procps-ng-ps
        <*>   procps-ng-top
        <*>   procps-ng-uptime
    <*> pv  # openwrt-ddbr命令 依赖于pv
    <*> smartmontools
    <*> smartmontools-drivedb
    <*> sysstat
    <*> tar
    <*> tree
    <*> usbids  # 完整的lsusb功能
    <*> usbutils  # 完整的lsusb功能
    <*> uuidgen
    > Compression
        <*> bsdtar
        <*> gzip
        <*> pigz
        <*> unrar
        <*> unzip
    > Disc
        <*> blkid
        <*> fdisk
        <*> fio
        <*> lsblk
        <*> parted
    > Filesystem
        <*> attr
        <*> btrfs-progs
        [*]   Build with zstd support
        <*> chattr
        <*> dosfstools
        <*> e2fsprogs
        <*> f2fs-tools
        <*> f2fsck
        <*> lsattr
        <*> mkf2fs
        <*> ntfs-3g
        [ ]   use external FUSE library, selects package libfuse
        [*]   install the ntfs-3g.probe utility
        <*> sysfsutils
        <*> tune2fs
        <*> xfs-fsck
        <*> xfs-mkfs
    > Shells
        <*> bash
```
