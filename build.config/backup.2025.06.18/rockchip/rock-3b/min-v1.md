1.部署编译环境: env.md/{lede env}

2.执行make menuconfig：选择如下依赖(核心配置 + ipv6 支持)
```
rock 3b已选择的编译配置默认：DEVICE_PACKAGES := 
    kmod-usb-net-cdc-ncm
    kmod-usb-net-rndis
    kmod-ata-ahci
    kmod-ata-ahci-dwc
    kmod-ata-ahci-platform
    kmod-nvme
    kmod-scsi-core
    kmod-drm-rockchip
    kmod-r8125-rss

Target System  ->  Rockchip
Subtarget      ->  RK33xx/RK35xx boards (64 bit)
Target Profile ->  Radxa ROCK 3B
Target Images
             ->  [*] ext4 (NEW)
             ->  [*] squashfs (NEW)
             ->  [*] GZip images (NEW)
             ->  (32) Kernel partition size (in MiB) (NEW)
             ->  (160) Root filesystem partition size (in MiB) (NEW) 

Utilities -> Disc -> blkid、fdisk、lsblk、parted
          -> Filesystem -> attr、btrfs-progs([*]Build with zstd support)、chattr、dosfstools、
                           e2fsprogs、f2fs-tools、f2fsck、lsattr、ntfs-3g([*]install the ntfs-3g.probe utility)、mkf2fs、sysfsutils、xfs-fsck、xfs-mkfs
          -> Compression -> bsdtar、pigz
          -> Shells  ->  bash
          -> gawk、getopt、losetup、tar、uuidgen
Kernel modules  ->   Wireless Drivers
          -> kmod-brcmfmac
              [*]   Enable SDIO bus interface support
              [*]   Enable USB bus interface support
              [*]   Enable PCIE bus interface support
         -> kmod-brcmutil
         -> kmod-cfg80211
         -> kmod-mac80211
Network  ->  WirelessAPD -> hostapd-common
                          -> wpad-basic
                          -> wpa-cli
          ->  iw

ipv6支持：
    Extra packages --->  ipv6helper
    Network  --->  6in4、6rd、6to4
    Base system  --->  [*] Build with DHCPv6 support
```

3.执行make defconfig：基于生成的.config，进行如下操作(部分添加和删除在make menuconfig中操作)
```
确认当前默认：
    一个主题[luci-theme-bootstrap]
    linux内核版本[CONFIG_LINUX_6_6=y]

添加主题：
    <*> luci-theme-argon  # 注意：默认是勾选luci-theme-bootstrap=y，且不可取消的，勾选上luci-theme-argon=y就行，默认会先启用luci-theme-argon；壁纸目录：/www/luci-static/argon/background

去掉非必要依赖：
    > LuCI > 3. Applications
        < > luci-app-accesscontrol
        < > luci-app-autoreboot
        < > luci-app-ddns
        < > luci-app-diskman、[ ] Include btrfs-progs、[ ] Include lsblk
        < > luci-app-ipsec-vpnds
        < > luci-app-nlbwmon
        < > luci-app-ramfree
        < > luci-app-rclone、[ ] Include rclone-webui、[ ] Include rclone-ng (another webui)
        < > luci-app-samba
        < > luci-app-ttyd
        < > luci-app-turboacc、[ ] Include Flow Offload、[ ] Include BBR CCA
        < > luci-app-unblockmusic、[ ] UnblockNeteaseMusic Golang Version (确保Multimedia下UnblockNeteaseMusic-Go是n)
        < > luci-app-upnp
        < > luci-app-vlmcsd (确保在network下的vlmcsd是n)
        < > luci-app-wireguard
        < > luci-app-xlnetacc
        < > luci-app-zerotier
    > LuCI > 5. Protocols
        < > luci-proto-bonding
        < > luci-proto-wireguard
    > Network > VPN
        < > strongswan
        < > wireguard-tools
        < > zerotier
    > Utilities > Terminal 
        < > ttyd
    > Network
        < > adbyby
        < > samba36-server
        < > vlmcsd
        < > proto-bonding
        < > nlbwmon
        < > samba4-server
        < > samba4-libs  下面全部,包括wsdd2
    > Extra packages
        < > autosamba
    > Base system > [*] Customize busybox options > Linux System Utilities
        < > lspci  # BusyBox内置的 lspci 功能非常有限，不支持 -v、-vv 等详细输出选项。BusyBox的 lspci 仅能显示最基本的PCI设备列表，无法提供详细信息（如厂商、设备名称、配置空间等）
        < > lsusb  # BusyBox内置的 lsusb 同上
    .config文件手动处理：CONFIG_PACKAGE_wsdd2 is not set

添加必要依赖：
    > Network > NMAP Suite  <*> ncat                            (例如测试github的push和update是否可用: ncat -zv github.com 443)
    > Network  <*> ethtool                                      (用于调整太网适配器参数/模式)
    > Utilities > Compression  <*> unzip                        (解压zip)
    > Utilities <*> pv                                          (openwrt-ddbr命令 依赖于pv)
    > Utilities <*> pciutils，包含pciids、libpci、libkmod         (查看PCI总线，非busybox的不完整的lspci命令，此处的lspci -vv才能输出详细的pcie信息)
    > Utilities <*> usbutils <*> usbids                         (完整的lsusb功能)
    > Network > SSH  <*> openssh-sftp-server                    (提供sftp服务)
    > Network > File Transfer  <*> curl                         (下载文件)
    > Base system  <*> resolveip                                (用于解析主机名为IP地址: resolveip sswPC)
```
