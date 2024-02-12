#!/bin/bash

# 自用备份插件库 by ssw
git clone https://github.com/rin0612/openwrt-packages-ssw  package/openwrt-packages-ssw

# kenzok8 packages by backup.2022.04.25
git clone https://github.com/rin0612/openwrt-packages  package/openwrt-packages -b backup.2022.04.25

# kenzok8 vpn相关 by backup.2022.04.25
git clone https://github.com/rin0612/small  package/small -b backup.2022.04.25

rm -rf package/openwrt-packages/UnblockNeteaseMusic
rm -rf package/openwrt-packages/luci-app-unblockneteasemusic
rm -rf package/openwrt-packages/luci-theme-argon
rm -rf package/openwrt-packages/luci-app-argon-config

rm -rf package/openwrt-packages/luci-theme-argonne
rm -rf package/openwrt-packages/luci-app-argonne-config
rm -rf package/openwrt-packages/ddnsto
rm -rf package/openwrt-packages/luci-app-ddnsto
