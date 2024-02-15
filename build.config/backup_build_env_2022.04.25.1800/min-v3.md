部署以下编译环境: 
```
git clone https://github.com/sswdr/openwrt-actions openwrt-actions
chmod +x extra-apps.sh
cd openwrt-actions
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
../extra-apps.sh
mv files openwrt/files
cp ../build.config/backup_build_env_2022.04.25.1800/min-v2.config openwrt/.config

make defconfig
make menuconfig
```
进行如下操作：基于min-v2.config
```
将其复制到如上编译环境下的.config, 执行make defconfig
将生成的.config与min-v2.config使用diffinity文本对比工具对比
    在生成的.config中, 新增的行, 逐行查看, 找到开头为非#的行, 把这些都设置为#开头
    例如: CONFIG_PACKAGE_luci-app-ssr-plus=y -> # CONFIG_PACKAGE_luci-app-ssr-plus is not set
    确保最后生成的.config与min-v2.config对比, 新增的行都是#开头
去掉勾选luci-theme-bootstrap主题, 勾选luci-theme-argonne-config
```
