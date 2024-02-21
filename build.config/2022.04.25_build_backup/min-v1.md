min-v1.config = [CONFIG_LINUX_5_10=y] + [核心配置] + [ipv6 固件] + [必要固定配置] - [无用默认选上的配置]

其中 [核心配置] + [ipv6 固件] 如下: 
```
Target System  ->  QEMU ARM Virtual Machine 
Subtarget ->  QEMU ARMv**8 Virtual Machine (cortex-a53)
Target Profile  ->  Default
Target Images  ->   tar.gz
Languages -> Perl               
             ->  perl-http-date
             ->  perlbase-file
             ->  perlbase-getopt
             ->  perlbase-time
             ->  perlbase-unicode                              
             ->  perlbase-utf8        
Utilities -> Disc -> blkid、fdisk、lsblk、parted            
          -> Filesystem -> attr、btrfs-progs(Build with zstd support)、chattr、dosfstools、
                           e2fsprogs、f2fs-tools、f2fsck、lsattr、mkf2fs、xfs-fsck、xfs-mkfs
          -> Compression -> bsdtar、pigz
          -> Shells  ->  bash         
          -> gawk、getopt、losetup、tar、uuidgen
Kernel modules  ->   Wireless Drivers -> kmod-brcmfmac(SDIO) 
                                       -> kmod-brcmutil
                                       -> kmod-cfg80211
                                       -> kmod-mac80211 
Network  ->  WirelessAPD -> hostapd-common
                          -> wpa-cli
                          -> wpad-basic
          ->  iw
ipv6 固件：
        1、Global build settings --->  Enable IPv6 support in packages (NEW)（选上）
        2、Extra packages --->  ipv6helper（选上）
        3、Base system  --->  [*] Build with DHCPv6 support.  （如果前面不带 * 就选上）
        4、Network  --->  6in4 和 6rd 和 6to4  （三个都选上）
```

备注:
```
min-v1.config来自于: https://github.com/sswdr/openwrt-actions/blob/backup.2022.04.25/5.10-lede+kenzok8-min-v3.config

min-v1.config = 5.10-lede+kenzok8-min-v3.config 在 2022.04.25_build_backup 下执行 make defconfig

其中lede+kenzok8-min-v1.config -> lede+kenzok8-min-v2.config -> 5.10-lede+kenzok8-min-v3.config

具体改动参考文件对比工具对比差异
```
