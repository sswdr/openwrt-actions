lede env:
```
git clone https://github.com/rin0612/lede -b backup.2024.01.01 openwrt
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a

TODO 选择不同的CONFIG_LINUX版本
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.10/g' target/linux/armvirt/Makefile
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.15/g' target/linux/armvirt/Makefile

make defconfig
make menuconfig
```