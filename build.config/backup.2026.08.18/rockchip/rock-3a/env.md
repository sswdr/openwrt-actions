当前分支backup.2026.08.18备注:
```
1.此目录下编译target：TargetSystem(Rockchip)、Subtarget(RK33xx/RK35xx boards (64 bit))、TargetProfile(Radxa ROCK 3A)

2.默认编译内核选择6.12，即6.12.103

3.version：24.10.5 R26.05.20
LEDE R26.05.20 / LuCI backup.2026.08.18.openwrt-25.12 branch
Powered by LuCI backup.2026.08.18.openwrt-25.12 branch (26.215.67335~89dde1c) | ArgonTheme v2.4.3 | OpenWrt 24.10.5-r7876-a762138a5
```

lede env:
```
git clone --depth=1 https://github.com/rin0612/lede.git -b backup.2026.08.18 openwrt
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
