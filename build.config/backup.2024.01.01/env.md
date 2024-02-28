lede env:
```
git clone --depth=1 https://github.com/rin0612/lede -b backup.2024.01.01 openwrt
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.15/g' target/linux/armvirt/Makefile

make defconfig
make menuconfig
```