部署以下编译环境: 
```
git clone https://github.com/sswdr/openwrt-actions openwrt-actions
cd openwrt-actions
chmod +x extra-apps.sh
git clone https://github.com/rin0612/lede -b backup.2022.04.25 openwrt
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
sed -i "s/192.168.1.1/192.168.5.25/g" package/base-files/files/bin/config_generate
sed -i "s/OpenWrt/sswOpenWrt/g" package/base-files/files/bin/config_generate
sed -i "s/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.10/g" target/linux/armvirt/Makefile
sed -i "s/luci-theme-bootstrap/luci-theme-argonne/g" ./feeds/luci/collections/luci/Makefile
sed -i 's/OpenWrt /杀生丸大人 Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile
../extra-apps.sh
mv ../files ./files
cp ../build.config/backup_build_env_2022.04.25.1800/min-v3.config ./.config

make defconfig
make menuconfig
```

进行如下操作：基于min-v3.config
```
> LuCI > Applications
<*> luci-app-accesscontrol                                  [5kb]服务-上网时间控制(控制ip/mac上网时间)
<*> luci-app-adguardhome                                    TODO待处理(广告过滤)
        [*] Include Binary File                             TODO待处理(广告过滤)
<*> luci-app-advanced                                       TODO待处理
<*> luci-app-advanced-reboot                                TODO待处理
<*> luci-app-autotimeset                                    [5kb]系统-定时设置(设置定时关机，重启等等)
<*> luci-app-baidupcs-web                                   TODO待处理(lede的源码by ssw 2024.02.16)网络存储-baidupcs-web百度云盘()
<*> luci-app-cifs-mount                                     [5kb]网络存储-挂载SMB网络共享(挂载SMB到本地，修改挂载后，需要重启使用这些文件夹的客户端)
<*> luci-app-ddns                                           [50kb]服务-动态dns(集成阿里DDNS客户端)
<*> luci-app-ddnsto                                         TODO待处理
<*> luci-app-diskman                                        [25kb]系统-磁盘管理
        [*] Include btrfs-progs                             [1mb]
        [*] Include lsblk                                   [100kb]
        [ ] Include mdadm
<*> luci-app-dockerman                                      [25mb]Docker(luci-app-docker + docker管理)
<*> luci-app-eqos                                           [5kb]网络-IP限速
< > luci-app-fileassistant(和luci-app-advanced冲突)          [10kb]服务-文件助手
<*> luci-app-frpc                                           TODO待处理
<*> luci-app-frps                                           TODO待处理
<*> luci-app-gowebdav                                       TODO待处理[1.5mb]网络存储-GoWebDav
        Network > File Transfer > [*] Compress executable files with UPX
<*> luci-app-hd-idle                                        TODO待处理
<*> luci-app-homebox                                        TODO待处理
<*> luci-app-nlbwmon                                        [50KB]带宽监控(实时流量，统计，配置等)
<*> luci-app-openclash                                      TODO待处理
<*> luci-app-passwall                                       TODO待处理(都是默认选上的和2022的一致)
        [*] Transparent Proxy
        [ ] Include Brook
        [*] Include ChinaDNS-NG
        [*] Include Haproxy
        [ ] Include Hysteria
        [ ] Include IPv6 Nat
        [ ] Include NaiveProxy
        [*] Include PDNSD
        [*] Include Shadowsocks Libev Client
        [*] Include Shadowsocks Libev Server
        [*] Include Shadowsocks Rust Client
        [*] Include ShadowsocksR Libev Client
        [ ] Include ShadowsocksR Libev Server
        [*] Include Simple-Obfs (Shadowsocks Plugin)
        [ ] Include Trojan-GO
        [*] Include Trojan-Plus
        [*] Include V2ray
        [*] Include V2ray-Plugin (Shadowsocks Plugin)
        [*] Include Xray
        [ ] Include Xray-Plugin (Shadowsocks Plugin)
<*> luci-app-poweroff                                       [5KB]系统-关机
<*> luci-app-pushbot                                        TODO待处理
<*> luci-app-qbittorrent                                    [16MB]网络存储-qBittorrent(下载种子，相对transmission占用资源多，连接性好，速度快，适合抢上传，占用高，容易挂)
<*> luci-app-ramfree                                        [5KB]状态-释放内存(释放内存)
<*> luci-app-samba4                                         TODO待处理(支持Samba 4.x，Samba 4.x完全兼容Windows 10。Samba 4.x包括对SMBv2和SMBv3协议的支持)
<*> luci-app-serverchan                                     [200KB]服务-微信推送
<*> luci-app-statistics                                     TODO待处理(状态统计图表)
<*> luci-app-ssr-plus                                       TODO待处理(新增了部分Include)
        [*] Include Kcptun                              TODO待处理(这次新增的待测试)
        [*] Include NaiveProxy                          TODO待处理(这次新增的待测试)
        [*] Include ipt2socks                           TODO待处理(这次新增的待测试)
        [*] Include Redsocks2                           TODO待处理(这次新增的待测试)
        [*] Include Shadowsocks Libev Client            TODO待处理(这次新增的待测试)
        [*] Include Shadowsocks Libev Server            TODO待处理(这次新增的待测试)       
        [*] Include Shadowsocks Rust Client
        [*] Include Shadowsocks Rust Server
        [*] Include ShadowsocksR Libev Client
        [*] Include ShadowsocksR Libev Server           TODO待处理(这次新增的待测试) 
        [*] Include Shadowsocks Simple Obfs Plugin      TODO待处理(这次新增的待测试)
        [*] Include Trojan                              TODO待处理(这次新增的待测试)
        [*] Include Shadowsocks V2ray Plugin            TODO待处理(这次新增的待测试)
        [*] Include Xray
<*> luci-app-transmission                                   [1.5mb]网络存储-transmission(下载种子，相对qbittorrent占用资源少，tr稳，适合保种，管理种子也方便)
<*> luci-app-ttyd                                           [250KB]系统-putty(网页终端命令窗)
<*> luci-app-turboacc                                       [50KB]网络-Turbo ACC 网络加速设置(开源流量分载驱动 支持 Fast Path 或者 硬件 NAT)
        [*] Include Shortcut-FE
        [*] Include BBR CCA
        [*] Include DNSForwarder                        TODO待处理(这次新增的待测试)
        [*] Include DNSProxy                            TODO待处理(这次新增的待测试)
<*> luci-app-unblockmusic                                   TODO待处理(lede的源码by ssw 2024.02.16)
    [*] UnblockNeteaseMusic Golang Version                  TODO待处理(lede的源码by ssw 2024.02.16)
    [*] UnblockNeteaseMusic NodeJS Version                  不建议编译，会引入node，编译可能一直卡在make[3] -C feeds/packages/lang/node host-compile和这个有关系？
<*> luci-app-upnp                                           [100KB]服务-UPnP(UPnP 允许局域网内客户端自动设置路由器上的端口转发)
<*> luci-app-watchcat                                       TODO待处理
<*> luci-app-webadmin                                       [5kb]系统-web管理(openwrt的web管理，例如设置端口号之类的)
<*> luci-app-zerotier                                       TODO待处理[500KB]VPN-ZeroTier

> Network > SSH
<*> openssh-sftp-server                                     [60kb]
> Network > WWAN
<*> adb-enablemodem                                         TODO待处理(Enable modem via adb)
> Network 
<*> socat                                                   TODO待处理[100kb]
    [ ]   SSL support

> Utilities > Filesystem
<*> ntfs-3g                                                 TODO待处理(支持挂载ntfs)
    [ ]   use external FUSE library, selects package libfuse
    [*]   install the ntfs-3g.probe utility
> Utilities
<*> adb                                                     TODO待处理(Android Debug Bridge CLI tool)
<*> docker-compose                                          [8mb]
```

支持openvpn
```
> Network > VPN
<*> openvpn-easy-rsa (提供了 Easy-RSA 工具的支持，Easy-RSA 是一个用于生成 OpenVPN 证书和密钥的简单工具集。使用这个插件可以方便地生成 OpenVPN 服务器和客户端的证书和密钥)
<*> openvpn-openssl (提供了 OpenVPN 的支持，并使用 OpenSSL 加密库。它允许在 OpenWrt 上安装和配置 OpenVPN 客户端和服务器，使用 OpenSSL 实现加密和安全连接。)
    --- openvpn-openssl
    [*]   Enable LZO compression support
    [*]   Enable LZ4 compression support
    [ ]   Enable the --x509-username-field feature
    [ ]   Enable management server support
    [*]   Enable internal fragmentation support (--fragment)
    [*]   Enable multi-homed UDP server support (--multihome)
    [*]   Enable TCP server port-share support (--port-share)
    [*]   Enable deferred authentication
    [*]   Enable internal packet filter
    [ ]   Enable support for iproute2
    [*]   Enable size optimization
> Utilities
-*- openssl-util (提供了 OpenSSL 工具的支持，包括用于生成证书和密钥的工具。OpenVPN 在配置过程中通常需要使用 OpenSSL 工具来生成证书和密钥)
> LuCI > Applications
<*> luci-app-openvpn (OpenWrt 上的一个 LuCI 应用程序，它提供了一个 Web 界面来配置和管理 OpenVPN 客户端和服务器。通过这个应用程序，用户可以方便地配置 OpenVPN 的各种选项，包括服务器设置、证书管理等)
> depends依赖已选择：
    CONFIG_PACKAGE_openvpn-openssl=y
    CONFIG_OPENVPN_openssl_ENABLE_LZO=y
    CONFIG_OPENVPN_openssl_ENABLE_LZ4=y
    # CONFIG_OPENVPN_openssl_ENABLE_X509_ALT_USERNAME is not set
    # CONFIG_OPENVPN_openssl_ENABLE_MANAGEMENT is not set
    CONFIG_OPENVPN_openssl_ENABLE_FRAGMENT=y
    CONFIG_OPENVPN_openssl_ENABLE_MULTIHOME=y
    CONFIG_OPENVPN_openssl_ENABLE_PORT_SHARE=y
    CONFIG_OPENVPN_openssl_ENABLE_DEF_AUTH=y
    CONFIG_OPENVPN_openssl_ENABLE_PF=y
    # CONFIG_OPENVPN_openssl_ENABLE_IPROUTE2 is not set
    CONFIG_OPENVPN_openssl_ENABLE_SMALL=y
```

支持usb-net-rndis网络共享
```
> Kernel modules > USB Support
    -*- kmod-usb-net
    -*- kmod-usb-net-cdc-ether
    <*> kmod-usb-net-rndis
> Utilities
    <*> usbutils
> depends依赖已选择：
    CONFIG_PACKAGE_kmod-mii=y
    CONFIG_PACKAGE_libeudev=y
    CONFIG_PACKAGE_libusb-1.0=y
    CONFIG_PACKAGE_usbids=y
```

支持usb摄像头内核和luci
```
> Kernel modules > I2C support
    <*> kmod-i2c-core
> Kernel modules > USB Support
    -*- kmod-usb-core
> Kernel modules > Video Support
    <*> kmod-video-core
    <*> kmod-video-uvc
    <*> kmod-video-videobuf2
> depends依赖已选择：
    CONFIG_PACKAGE_kmod-input-core=y
    CONFIG_PACKAGE_kmod-mii=y
    CONFIG_PACKAGE_kmod-dma-buf=y
    CONFIG_PACKAGE_kmod-usb-net=y
    CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
    CONFIG_PACKAGE_kmod-usb-net-rndis=y
    CONFIG_PACKAGE_libeudev=y
    CONFIG_PACKAGE_libusb-1.0=y
    CONFIG_PACKAGE_usbids=y
    CONFIG_PACKAGE_usbutils=y
> LuCI > Applications
    <*> luci-app-mjpg-streamer                             TODO待处理(兼容Linux-UVC的摄像头程序)
> depends依赖已选择：
    CONFIG_PACKAGE_libjpeg-turbo=y
    CONFIG_PACKAGE_mjpg-streamer=y
    # CONFIG_PACKAGE_mjpg-streamer-input-file is not set
    # CONFIG_PACKAGE_mjpg-streamer-input-http is not set
    # CONFIG_PACKAGE_mjpg-streamer-input-uvc is not set
    # CONFIG_PACKAGE_mjpg-streamer-output-file is not set
    # CONFIG_PACKAGE_mjpg-streamer-output-http is not set
    # CONFIG_PACKAGE_mjpg-streamer-output-rtsp is not set
    # CONFIG_PACKAGE_mjpg-streamer-output-zmq is not set
    # CONFIG_PACKAGE_mjpg-streamer-www is not set
    # CONFIG_PACKAGE_mjpg-streamer-www-simple is not set
```