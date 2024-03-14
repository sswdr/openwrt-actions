1.部署编译环境: env.md/{lede env}

3.执行make defconfig：基于生成的.config，进行如下操作(部分添加和删除在make menuconfig中操作)
```
确认当前默认：
    一个主题[luci-theme-bootstrap]
    linux内核版本[CONFIG_LINUX_5_10=y]
    添加了autocore-arm依赖支持但是没有选择编译[# CONFIG_PACKAGE_autocore-arm is not set]

去掉非必要依赖：
    > LuCI > 3. Applications
        < > luci-app-accesscontrol
        < > luci-app-autoreboot
        < > luci-app-ddns
        < > luci-app-diskman、[ ] Include btrfs-progs、[ ] Include lsblk
        < > luci-app-nlbwmon
        < > luci-app-ramfree
        < > luci-app-rclone、[ ] Include rclone-webui、[ ] Include rclone-ng (another webui)
        < > luci-app-turboacc、[ ] Include Shortcut-FE、[ ] Include BBR CCA
        < > luci-app-unblockmusic、[ ] UnblockNeteaseMusic Golang Version (确保Multimedia下UnblockNeteaseMusic-Go是n)
        < > luci-app-upnp
        < > luci-app-vlmcsd (确保在network下的vlmcsd是n)

添加必要依赖：
    > Network > NMAP Suite  <*> ncat            (例如测试github的push和update是否可用: ncat -zv github.com 443)
    > Network  <*> ethtool                      (用于调整太网适配器参数/模式)
    > Utilities > Compression  <*> unzip        (解压zip)
    > Utilities  <*> pv                         (openwrt-ddbr命令 依赖于pv)
    > Network > SSH  <*> openssh-sftp-server    (提供sftp服务)
    > Network > File Transfer  <*> curl         (下载文件)
    > Base system  <*> resolveip                (用于解析主机名为IP地址: resolveip sswPC)
```
2.执行make menuconfig：选择如下依赖(核心配置 + ipv6 支持)
```
Target System  ->  QEMU ARM Virtual Machine 
Subtarget      ->  QEMU ARMv8 Virtual Machine (cortex-a53)
Target Profile ->  Default
Target Images  ->  tar.gz (只选这一个)
Languages -> Perl
             ->  perl-http-date
             ->  perlbase-file
             ->  perlbase-getopt
             ->  perlbase-time
             ->  perlbase-unicode
             ->  perlbase-utf8
Utilities -> Disc -> blkid、fdisk、lsblk、parted
          -> Filesystem -> attr、btrfs-progs([*]Build with zstd support)、chattr、dosfstools、
                           e2fsprogs、f2fs-tools、f2fsck、lsattr、mkf2fs、xfs-fsck、xfs-mkfs
          -> Compression -> bsdtar、pigz
          -> Shells  ->  bash
          -> gawk、getopt、losetup、tar、uuidgen
Kernel modules  ->   Wireless Drivers
          -> kmod-brcmfmac(SDIO)
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
        1、Global build settings --->  Enable IPv6 support in packages (NEW)（选上）
        2、Extra packages --->  ipv6helper（选上）
        3、Base system  --->  [*] Build with DHCPv6 support.  （如果前面不带 * 就选上）
        4、Network  --->  6in4 和 6rd 和 6to4  （三个都选上）
```
