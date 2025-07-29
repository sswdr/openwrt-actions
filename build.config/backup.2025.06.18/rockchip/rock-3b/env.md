当前分支backup.2025.06.18备注:
```
1.此目录下编译target：TargetSystem(Rockchip)、Subtarget(RK33xx/RK35xxboards(64bit))、TargetProfile(RadxaROCK3B)

2.默认编译内核选择6.6，即6.6.93

3.version：24.10.1 R25.5.25
LEDER25.5.25/LuCIbackup.2025.06.18.openwrt-23.05branchgit-25.167.72489-7cd82b0
PoweredbyLuCIbackup.2025.06.18.openwrt-23.05branch(git-25.167.72489-7cd82b0)/OpenWrt24.10.1(r0-80d06981)
```

lede env:
```
git clone --depth=1 https://github.com/rin0612/lede.git -b backup.2025.06.18 openwrt
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a

make defconfig
make menuconfig
```

lede & extra-apps.sh env:
```
TODO 待从 m68s-plus中复制出来这里分支和记录

```