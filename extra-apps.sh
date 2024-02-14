#!/bin/bash
#
# 只增删插件仓库/修改feeds
#

# 自用备份插件库 by ssw, main分支
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

rm -rf feeds/packages/net/zerotier
cp -R feeds/openwrt_packages_ssw/zerotier/ feeds/packages/net/
rm -rf feeds/luci/applications/luci-app-zerotier
cp -R feeds/openwrt_packages_ssw/luci-app-zerotier/ feeds/luci/applications/

# TODO 如果需要对feeds仓库有调整, 可以到这里进行修改, 即当前目录下的feeds.conf.default, eg:
# cat > feeds.conf.default <<EOF
# src-git packages https://github.com/coolsnowwolf/packages
# src-git luci https://github.com/coolsnowwolf/luci
# src-git routing https://github.com/coolsnowwolf/routing
# src-git telephony https://git.openwrt.org/feed/telephony.git
# #src-git helloworld https://github.com/fw876/helloworld.git
# #src-git oui https://github.com/zhaojh329/oui.git
# #src-git video https://github.com/openwrt/video.git
# #src-git targets https://github.com/openwrt/targets.git
# #src-git oldpackages http://git.openwrt.org/packages.git
# #src-link custom /usr/src/openwrt/custom-feed
# EOF

./scripts/feeds update -a
./scripts/feeds install -a
