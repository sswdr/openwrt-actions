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
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# 设置固件build信息
sed -i "s/OpenWrt /杀生丸大人 Build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改主机名
sed -i 's/OpenWrt/SSWdeOpenWrt/g' package/base-files/files/bin/config_generate

# Modify some code adaptation
#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile

# readd cpufreq for aarch64
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' feeds/luci/applications/luci-app-cpufreq/Makefile
sed -i 's/services/system/g'  feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# ---------------------------------------------------------------------------------------------------
# （lean仓库没有的）拉取晶晨宝盒
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
# 晶晨宝盒相关配置
sed -i 's#https://github.com/breakings/OpenWrt#自己编译仓库地址例如https://github.com/breakings/OpenWrt#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#ARMv8#openwrt_armvirt#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic

# （lean仓库没有的）拉取关机luci插件
git clone https://github.com/sirpdboy/luci-app-poweroffdevice package/luci-app-poweroffdevice
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff

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

./scripts/feeds update -a
./scripts/feeds install -a
