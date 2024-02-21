基于min-v1.config, 在backup.2022.04.25_build.2022.04.25下执行make menuconfig进行如下操作: 

1.luci-app
```
luci-app-accesscontrol        服务-上网时间控制        控制ip/mac上网时间
luci-app-aliyundrive-fuse        服务-阿里云盘FUSE        用于观看视频，不支持写入
luci-app-aliyundrive-webdav        服务-阿里云盘WebDAV        支持写入
luci-app-aria2        网络存储-Aria2配置        下载文件用
luci-app-autotimeset        系统-定时设置        设置定时关机，重启等等
luci-app-baidupcs-web        网络存储-baidupcs-web        百度云盘
luci-app-cifs-mount        网络存储-挂载SMB网络共享        可以将 SMB/CIFS 的共享文件夹挂载到本地（修改挂载后，需要重启使用这些文件夹的客户端）
luci-app-cifsd        网络存储-网络共享        挂载磁盘给别人用，和Samba貌似类似？描述：Ksmbd 是一个开源的 Linux 内核级 SMB1/2/3 高性能文件共享服务器
luci-app-cpufreq        服务-CPU 性能优化调节        CPU 性能优化调节设置
luci-app-ddns        服务-动态dns        动态域名 DNS（集成阿里DDNS客户端）
luci-app-diskman        系统-磁盘管理        通过 LuCI 管理磁盘
        [*] Include btrfs-progs
        [*] Include lsblk
luci-app-dockerman        Docker        luci-app-docker + docker管理
luci-app-eqos        网络-EQsO        内网限速，根据ip/mac
luci-app-fileassistant        服务-文件助手        简单的查看下载op文件
luci-app-gowebdav        网络存储-GoWebDav        GoWebDav 是一个轻巧、简单、快速的 WebDav 服务端程序
luci-app-netdata        状态-实时监控        实时展示详细的系统信息，磁盘cpu占用等
luci-app-nlbwmon        带宽监视        实时流量，统计，配置等
luci-app-passwall        酸酸乳
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
luci-app-poweroff        系统-关机        直接关机
luci-app-qbittorrent        网络存储-qBittorrent        下载种子，相对transmission占用资源多，连接性好，速度快，适合抢上传，占用高，容易挂
luci-app-ramfree        状态-释放内存        释放内存
luci-app-serverchan        服务-微信推送        推送到微信，企业微信等
luci-app-ssr-plus        酸酸乳
        [*] Include Shadowsocks Rust Client
        [*] Include Shadowsocks Rust Server
        [*] Include ShadowsocksR Libev Client
        [*] Include Xray
luci-app-transmission        网络存储-transmission        下载种子，相对qbittorrent占用资源少，tr稳，适合保种，管理种子也方便
luci-app-ttyd        系统-putty        网页终端命令窗
luci-app-turboacc        网络-Turbo ACC 网络加速设置        开源流量分载驱动 (支持 Fast Path 或者 硬件 NAT)
        [*] Include Shortcut-FE
        [*] Include BBR CCA
luci-app-unblockmusic        服务-解锁网易云灰色歌曲        网易云音乐用
        [*] UnblockNeteaseMusic Golang Version
luci-app-upnp        服务-UPnP        UPnP 允许局域网内客户端自动设置路由器上的端口转发。
luci-app-webadmin        系统-web管理        openwrt的web管理，例如设置端口号之类的
luci-app-zerotier        VPN-ZeroTier        Zerotier 是一个开源，跨平台，而且适合内网穿透互联的傻瓜配置虚拟 VPN LAN
```

2.其他
```
Utilities <*> docker-compose
Network > SSH <*> openssh-sftp-server
Network > <*> socat
```

3.usb共享
```
> Kernel modules > USB Support
    <*> kmod-usb-net
    <*> kmod-usb-net-rndis
    -*- kmod-usb-net-cdc-ether
> Utilities
    <*> usbutils
未找到，暂未忽略勾选：<*> udev
```

4.摄像头内核模块
```
> Kernel modules > I2C support
    <*> kmod-i2c-core
> Kernel modules > USB Support
    -*- kmod-usb-core
> Kernel modules > Video Support
    <*> kmod-video-core
    <*> kmod-video-uvc
    <*> kmod-video-videobuf2
默认已选择：kmod-input-core， kmod-dma-buf
```

备注:
```
general-v1.config来自于: https://github.com/sswdr/openwrt-actions/blob/backup.2022.04.25/5.10-lede+kenzok8-max-v3.config

general-v1.config = 5.10-lede+kenzok8-max-v3.config 在 backup.2022.04.25_build.2022.04.25 下执行 make defconfig

general-v1.config = https://github.com/sswdr/openwrt-actions/releases/download/backup.2022.04.25_build.2022.04.25/workdir.tar.gz
    /workdir/openwrt/.config 
```
