编译配置文件获取环境准备: 
```
git clone https://github.com/rin0612/lede -b backup.2022.04.25
cd lede

./scripts/feeds update -a
./scripts/feeds install -a

sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.10/g' target/linux/armvirt/Makefile
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

make defconfig
make menuconfig
```
##### 一个主题[luci-theme-bootstrap]
##### linux内核版本[CONFIG_LINUX_5_10=y]
##### 添加必要依赖: CONFIG_PACKAGE_pv=y
##### 去除无用默认选上的配置: # CONFIG_PACKAGE_UnblockNeteaseMusic-Go is not set
##### 添加了autocore-arm支持但是没有选择编译: # CONFIG_PACKAGE_autocore-arm is not set
##### [核心配置] + [ipv6 固件]: 
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
