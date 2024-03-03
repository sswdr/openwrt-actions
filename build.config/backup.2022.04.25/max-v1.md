部署编译环境: env.md/{lede & extra-apps.sh env}

进行如下操作：基于min-v3.config
```
> LuCI > Applications
<*> luci-app-accesscontrol                                  [5kb]服务-上网时间控制(能用)(控制ip/mac上网时间)
<*> luci-app-adguardhome                                    [10mb]服务-AdGuard Home(能用，暂不需要)(广告过滤后非常卡顿；首次使用，无法加载核心，卸载重装编译的ipk/手动更新核心又好了)
        [*] Include Binary File
<*> luci-app-advanced                                       [15kb]系统-高级设置(能用，暂不需要)(luci-app-advanced包含了luci-app-fileassistant，同时选择会编译的install会错误，文件冲突)
<*> luci-app-advanced-reboot                                [10kb]系统-高级重启(能用，暂不需要)
<*> luci-app-autotimeset                                    [10kb]Control-任务设置(能用)(使用仓库openwrt-packages-ssw)(设置定时关机，重启等等)
<*> luci-app-baidupcs-web                                   [6.5mb]网络存储-BaiduPCS Web(能用)(不选择<> baidupcs-go也可以正常使用，使用仓库openwrt-packages-ssw，lede的源码by ssw 2024.02.16)
<*> luci-app-cifs-mount                                     [5kb]网络存储-挂载SMB网络共享(挂载SMB到本地，修改挂载后，需要重启使用这些文件夹的客户端)
<*> luci-app-ddns                                           [50kb]服务-动态dns(集成阿里DDNS客户端)
<*> luci-app-ddnsto                                         [1.5mb]服务-DDNSTO 远程控制(能用)(使用仓库openwrt-packages-ssw)(ddnsto内网穿透)
<*> luci-app-diskman                                        [25kb]系统-磁盘管理
        [*] Include btrfs-progs                             [1mb]
        [*] Include lsblk                                   [100kb]
        [ ] Include mdadm
<*> luci-app-dockerman                                      [25mb]Docker(luci-app-docker + docker管理)
<*> luci-app-eqos                                           [5kb]网络-IP限速
< > luci-app-fileassistant(和luci-app-advanced冲突)          [10kb]服务-文件助手
<*> luci-app-frpc                                           [2.6mb]服务-Frp 内网穿透(需要公网IP，暂不需要，编译备用)(frp客户端)
<*> luci-app-frps                                           [3.2mb]服务-Frps(需要公网IP，暂不需要，用于部署Frps - 服务器)(frp服务端)
<*> luci-app-gowebdav                                       [1.5mb]网络存储-GoWebDav(能用，使用仓库openwrt-packages-ssw，也可以不选择Compress executable files with UPX就能用)
        Network > File Transfer > [*] Compress executable files with UPX
<*> luci-app-hd-idle                                        [10kb]网络存储-硬盘休眠(未测试，编译备用)
<*> luci-app-homebox                                        [2.8mb]服务-homebox(网络测速，使用仓库openwrt-packages-ssw)
<*> luci-app-nlbwmon                                        [50KB]带宽监控(实时流量，统计，配置等)
<*> luci-app-openclash                                      [3.6mb]服务-OpenClash(网络代理，首次使用，无法加载核心，无法在线更新，需要手动下载到目录；建议使用2024源码编译的luci-app-openclash，新版本可正常使用)
<*> luci-app-passwall                                       [1mb]服务-PassWall(暂不使用，编译备用)(都是默认选上的和2022的一致)
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
<*> luci-app-poweroff                                       [5KB]系统-关机(使用仓库openwrt-packages-ssw)
<*> luci-app-pushbot                                        [30kb]服务-全能推送(未测试，暂不使用，编译备用)
<*> luci-app-qbittorrent                                    [16MB]网络存储-qBittorrent(下载种子，相对transmission占用资源多，连接性好，速度快，适合抢上传，占用高，容易挂)
<*> luci-app-ramfree                                        [5KB]状态-释放内存(释放内存)
<*> luci-app-samba4                                         [8mb]网络存储-网络共享(正常使用，需要调好配置文件)(支持Samba 4.x，Samba 4.x完全兼容Windows 10。Samba 4.x包括对SMBv2和SMBv3协议的支持)
<*> luci-app-serverchan                                     [200KB]服务-微信推送(正常使用)
<*> luci-app-statistics                                     [40kb]统计(能用，暂不需要，不能实时查看)(状态统计图表)
<*> luci-app-ssr-plus                                       TODO待处理[200kb](新增了部分Include)
        [*] Include Kcptun                              TODO待处理[2.2MB](这次新增的待测试)
        [*] Include NaiveProxy                          TODO待处理[2.4MB](这次新增的待测试)
        [*] Include ipt2socks                           TODO待处理[35kb](这次新增的待测试)
        [*] Include Redsocks2                           TODO待处理[60kb](这次新增的待测试)
        [*] Include Shadowsocks Libev Client            TODO待处理[100kb](这次新增的待测试)
        [*] Include Shadowsocks Libev Server            TODO待处理[55kb](这次新增的待测试)       
        [*] Include Shadowsocks Rust Client                 [2.5mb]
        [*] Include Shadowsocks Rust Server                 [1.7mb]
        [*] Include ShadowsocksR Libev Client               [120kb]
        [*] Include ShadowsocksR Libev Server           TODO待处理[65kb](这次新增的待测试) 
        [*] Include Shadowsocks Simple Obfs Plugin      TODO待处理[30kb](这次新增的待测试)
        [*] Include Trojan                              TODO待处理[260kb](这次新增的待测试)
        [*] Include Shadowsocks V2ray Plugin            TODO待处理[4.3mb](这次新增的待测试)
        [*] Include Xray                                    [6.6mb]
<*> luci-app-transmission                                   [1.5mb]网络存储-transmission(下载种子，相对qbittorrent占用资源少，tr稳，适合保种，管理种子也方便)
<*> luci-app-ttyd                                           [250KB]系统-putty(网页终端命令窗)
<*> luci-app-turboacc                                       [10KB]网络-Turbo ACC 网络加速设置(开源流量分载驱动 支持 Fast Path 或者 硬件 NAT)
        [*] Include Shortcut-FE                             [40KB]
        [*] Include BBR CCA                                 [6kb]
        [*] Include DNSForwarder                            [100kb](未测试，暂不使用)(这次新增的待测试)
        [*] Include DNSProxy                                [3mb](未测试，暂不使用)(这次新增的待测试)
<*> luci-app-unblockmusic                                   [10kb](使用仓库openwrt-packages-ssw，lede的源码by ssw 2024.02.16)
    [*] UnblockNeteaseMusic Golang Version                  [2.2mb](目前无法使用)(使用仓库openwrt-packages-ssw，lede的源码by ssw 2024.02.16)
    [*] UnblockNeteaseMusic NodeJS Version                  [8mb](能用，会引入node环境大概8mb，本身node应用只有270kb)(使用仓库openwrt-packages-ssw，lede的源码by ssw 2024.02.16)
<*> luci-app-upnp                                           [100KB]服务-UPnP(UPnP 允许局域网内客户端自动设置路由器上的端口转发)
<*> luci-app-watchcat                                       TODO待处理[8kb]断网检测功能与定时重启
<*> luci-app-webadmin                                       [5kb]系统-web管理(openwrt的web管理，例如设置端口号之类的)
<*> luci-app-zerotier                                       [500KB](能用,zerotier更新至1.12.2，luci-app-zerotier启动停止正常，使用无问题)VPN-ZeroTier

> Network > SSH
<*> openssh-sftp-server                                     [60kb]
> Network > WWAN
<*> adb-enablemodem                                         [2kb](无法使用，不编译)(Enable modem via adb)
> Network 
<*> socat                                                   [100kb](能用，未测试，编译备用)
    [ ]   SSL support

> Utilities > Filesystem
<*> ntfs-3g                                                 [200kb](能用)(支持挂载ntfs)
    [ ]   use external FUSE library, selects package libfuse
    [*]   install the ntfs-3g.probe utility
> Utilities
<*> adb                                                     [60kb](能用)(Android Debug Bridge CLI tool)
<*> docker-compose                                          [8mb](能用)
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
    <*> luci-app-mjpg-streamer                             [14kb](未测试，暂不使用)(兼容Linux-UVC的摄像头程序)
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
