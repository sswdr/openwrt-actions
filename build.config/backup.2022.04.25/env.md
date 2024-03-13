lede env:
```
git clone --depth=1 https://github.com/rin0612/lede -b backup.2022.04.25 openwrt
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.10/g' target/linux/armvirt/Makefile
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

make defconfig
make menuconfig
```

lede & extra-apps.sh env:
```
git clone https://github.com/sswdr/openwrt-actions openwrt-actions
cd openwrt-actions
chmod +x extra-apps.sh
git clone https://github.com/rin0612/lede -b backup.2022.04.25 openwrt
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
sed -i "s/192.168.1.1/192.168.5.25/g" package/base-files/files/bin/config_generate
sed -i "s/OpenWrt/sswOpenWrt/g" package/base-files/files/bin/config_generate
sed -i "s/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.10/g" target/linux/armvirt/Makefile
sed -i "s/luci-theme-bootstrap/luci-theme-argonne/g" ./feeds/luci/collections/luci/Makefile
sed -i 's/OpenWrt /杀生丸大人 Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile
../extra-apps.sh main backup.2022.04.25
mv ../files ./files
cp ../build.config/backup.2022.04.25/min-v2.config ./.config

make defconfig
make menuconfig
```