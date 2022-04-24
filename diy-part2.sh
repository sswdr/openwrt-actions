#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# ---------------------------------------------------------------------------------------------------
# 修改ip
sed -i 's/192.168.1.1/192.168.2.254/g' package/base-files/files/bin/config_generate

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' ./feeds/luci/collections/luci/Makefile

# 设置固件build信息
sed -i "s/OpenWrt /杀生丸大人 Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改主机名
sed -i 's/OpenWrt/sswOpenWrt/g' package/base-files/files/bin/config_generate

# 修改默认lede仓库编译分支
sed -i 's/PATCHVER:=5.4/PATCHVER:=5.10/g' target/linux/armvirt/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# 暂时未用：readd cpufreq for aarch64
# sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile
# sed -i 's/services/system/g'  feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# 暂时未用：samba4无效用户root：关闭
# sed -i 's/invalid users = root/#invalid users = root/g' feeds/packages/net/samba4/files/smb.conf.template

# 暂时未用：软件源修改
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings

# ---------------------------------------------------------------------------------------------------
# （lean仓库没有的）拉取晶晨宝盒
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
# 晶晨宝盒相关配置
sed -i 's#https://github.com/breakings/OpenWrt#自己编译仓库如https://github.com/breakings/OpenWrt#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#ARMv8#openwrt_armvirt#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic

# （lean仓库没有的）拉取关机luci插件
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
# （lean仓库没有的）拉取定时设置插件luci插件
git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset

# （lean仓库没有的）拉取网络存储 luci-app-gowebdav
svn co https://github.com/immortalwrt-collections/openwrt-gowebdav/trunk/luci-app-gowebdav package/luci-app-gowebdav
svn co https://github.com/immortalwrt-collections/openwrt-gowebdav/trunk/gowebdav package/gowebdav

# （lean仓库没有的）拉取扩展插件库 kenzok8：openwrt-packages
git clone https://github.com/kenzok8/small package/small
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
# 删除重复插件
rm -rf package/openwrt-packages/luci-app-amlogic
rm -rf package/openwrt-packages/UnblockNeteaseMusic
rm -rf package/openwrt-packages/luci-app-unblockneteasemusic
rm -rf package/openwrt-packages/luci-theme-argon
rm -rf package/openwrt-packages/luci-app-argon-config

# ########################################################################################################
# 暂时未用：（lean仓库没有的）拉取openwrt-chinadns-ng
# git clone -b luci https://github.com/pexcn/openwrt-chinadns-ng.git package/luci-app-chinadns-ng
# 暂时未用：移除lean仓库luci的argon主题，拉取jerrykuku仓库的argon主题：18.06
# rm -rf feeds/luci/themes/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# 暂时未用：拉取解锁音乐，解锁音乐修改
# git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic
# NAME=$"package/luci-app-unblockneteasemusic/root/usr/share/unblockneteasemusic" && mkdir -p $NAME/core
# curl 'https://api.github.com/repos/UnblockNeteaseMusic/server/commits?sha=enhanced&path=precompiled' -o commits.json
# echo "$(grep sha commits.json | sed -n "1,1p" | cut -c 13-52)">"$NAME/core_local_ver"
# curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/app.js -o $NAME/core/app.js
# curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/precompiled/bridge.js -o $NAME/core/bridge.js
# curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/ca.crt -o $NAME/core/ca.crt
# curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.crt -o $NAME/core/server.crt
# curl -L https://github.com/UnblockNeteaseMusic/server/raw/enhanced/server.key -o $NAME/core/server.key
# 暂时未用：拉取关机luci插件
# git clone https://github.com/sirpdboy/luci-app-poweroffdevice package/luci-app-poweroffdevice
# 暂时未用：passwall插件
# git clone https://github.com/xiaorouji/openwrt-passwall package/passwall
# 暂时未用：helloworld插件
# git clone https://github.com/fw876/helloworld package/helloworl
# 暂时未用：拉取kenzok8的small-package软件包（同名软件包默认使用lean的，要使用其他仓库插件，先删除lean的再clone其他库），删除重复包
# git clone https://github.com/kenzok8/small-package package/small-package
# rm -rf package/small-package/luci-app-openvpn-server
# rm -rf package/small-package/openvpn-easy-rsa-whisky
# rm -rf package/small-package/luci-app-wrtbwmon
# rm -rf package/small-package/wrtbwmon
# rm -rf package/small-package/luci-app-koolproxyR
# rm -rf package/small-package/luci-app-godproxy
# rm -rf package/small-package/luci-app-argon*
# rm -rf package/small-package/luci-theme-argon*
# rm -rf package/small-package/luci-app-amlogic
# rm -rf package/small-package/luci-app-unblockneteasemusic
# ########################################################################################################

./scripts/feeds update -a
./scripts/feeds install -a
