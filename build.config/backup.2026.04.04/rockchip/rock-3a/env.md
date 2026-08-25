当前分支backup.2026.04.04备注:
```
1.此目录下编译target：TargetSystem(Rockchip)、Subtarget(RK33xx/RK35xx boards (64 bit))、TargetProfile(Radxa ROCK 3A)

2.默认编译内核选择6.12，即6.12.80

3.version：24.10.5 R26.02.20
LEDE R26.02.20 / LuCI backup.2026.04.04.openwrt-23.05 branch
Powered by LuCI backup.2026.04.04.openwrt-23.05 branch (git-25.317.09264-b692039) / ArgonTheme v2.3.1 / LEDE R26.02.20
```

lede env:
```
git clone --depth=1 https://github.com/rin0612/lede.git -b backup.2026.04.04 openwrt
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
