基于min-v1.config

新增：luci-app-ddnsto、luci-app-netspeedtest


echo >> feeds.conf.default
echo 'src-git linkease_nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
echo 'src-git linkease_nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default
./scripts/feeds update linkease_nas linkease_nas_luci
./scripts/feeds install -a -p linkease_nas
./scripts/feeds install -a -p linkease_nas_luci
echo >> feeds.conf.default
echo 'src-git sirpdboy_netspeedtest https://github.com/sirpdboy/netspeedtest' >> feeds.conf.default
./scripts/feeds update sirpdboy_netspeedtest
./scripts/feeds install -a -p sirpdboy_netspeedtest

