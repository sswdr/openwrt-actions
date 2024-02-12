action yml env Json: 
```
{
  REPO_URL: https://github.com/coolsnowwolf/lede,
  REPO_BRANCH: master,
  FEEDS_CONF: feeds.conf.default,
  CONFIG_FILE: build.config/backup_build_env_2024.02.06.1648/2024-min-v2.config,
  INIT_CONFIG_SH: init-config.sh,
  UPLOAD_BIN_DIR: true
}
```
init-config.sh: 
```
#!/bin/bash
# ----------------------------------------------配置相关--------------------------------------------------------------------
# TODO 待处理 配置相关的参数提取到公共配置文件

# 修改ip
sed -i 's/192.168.1.1/192.168.5.25/g' package/base-files/files/bin/config_generate

# 修改默认主题,这样就可以只编译一个主题,因为默认主题无法取消编译,注意luci-theme-argonne/在lede仓库没有，需要在扩展仓库中添加
# TODO 待处理: 只编译一个默认主题; luci-theme-argonne是kenzok8/openwrt-packages在2022的,目前是kenzok8/openwrt-packages/luci-theme-argone
# sed -i 's/luci-theme-bootstrap/luci-theme-argone/g' ./feeds/luci/collections/luci/Makefile

# 设置固件build信息
sed -i "s/OpenWrt /杀生丸大人 Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改主机名
sed -i 's/OpenWrt/sswOpenWrt/g' package/base-files/files/bin/config_generate

# 指定lede仓库内核版本编译,目前最新代码中使用[KERNEL_PATCHVER:=5.15]
# 这个是lede旧仓库的参数指定方式: sed -i 's/PATCHVER:=5.4/PATCHVER:=5.10/g' target/linux/armvirt/Makefile
# TODO 待处理: 指定内核版本编译
# sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.10/g' target/linux/armvirt/Makefile

# ---------------------------------------------扩展仓库--------------------------------------------------------------------
# luci关机
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
# luci定时设置
git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset
# kenzok8 vpn相关
git clone https://github.com/kenzok8/small package/small
# kenzok8 packages
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages

# 扩展仓库加进来的中可能会和lede库有重复插件,最好删除
rm -rf package/openwrt-packages/UnblockNeteaseMusic
rm -rf package/openwrt-packages/luci-app-unblockneteasemusic
rm -rf package/openwrt-packages/luci-theme-argon
rm -rf package/openwrt-packages/luci-app-argon-config

# ----------------------------------------------通用init-config.sh更新安装feeds----------------------------------------------
./scripts/feeds update -a
./scripts/feeds install -a
```