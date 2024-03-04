部署编译环境: env.md/{lede & extra-apps.sh env}

进行如下操作：基于min-v2.config
```
> LuCI > Applications
<*> luci-app-zerotier
    还原openwrt-packages-ssw仓库的zerotier、luci-app-zerotier
    zerotier、luci-app-zerotier全部使用最新的lede仓库的，不混合其他的人使用
    测试需要验证zerotier版本是不是1.12.2，luci-app-zerotier是不是老版本了

<*> luci-app-baidupcs-web
    删除openwrt-packages-ssw仓库的baidupcs-go
    只选择baidupcs-web、luci-app-baidupcs-web测试是否可用

```