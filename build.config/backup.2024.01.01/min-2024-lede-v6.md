部署编译环境: env.md/{lede env}

2024.01.01

仅 https://github.com/rin0612/lede 分支 backup.2024.01.01

执行make defconfig，进行如下配置：
```
Target System  ->  QEMU ARM Virtual Machine 
Subtarget ->  64-bit ARM machines
Target Profile  ->  Generic EFI Boot
Target Images
    [*] tar.gz
    [*] GZip images
    (128) Kernel partition size (in MiB)
    (512) Root filesystem partition size (in MiB)

Languages -> Perl               
             ->  perl-http-date
             ->  perlbase-file
             ->  perlbase-getopt
             ->  perlbase-time
             ->  perlbase-unicode                              
             ->  perlbase-utf8        

Utilities -> Compression -> bsdtar、pigz
          -> Disc -> blkid、fdisk、lsblk、parted
          -> Filesystem -> attr、btrfs-progs(Build with zstd support)、chattr、dosfstools、
                           e2fsprogs、f2fs-tools、f2fsck、lsattr、mkf2fs、xfs-fsck、xfs-mkfs
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

ipv6 固件：
    Extra packages --->  ipv6helper（选上）
    Base system  --->  [*] Build with DHCPv6 support.  （如果前面不带 * 就选上）
    Network  --->  6in4 和 6rd 和 6to4  （三个都选上）

> LuCI > 3. Applications
    去掉勾选Include rclone-webui、Include rclone-ng (another webui)、UnblockNeteaseMusic Golang Version、luci-app-vlmcsd
```

暂时未选：
```
Boot Loaders  --->  < > grub2-efi-arm
```