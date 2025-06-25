当前分支backup.2025.06.18备注:
```
1.此目录下编译target：Target System (Rockchip)、Subtarget (RK33xx/RK35xx boards (64 bit))、Target Profile (Radxa ROCK 3B)

2.默认编译内核选择6.6，即6.6.93

3.version：R24.10
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