部署编译环境: env.md/{lede & extra-apps.sh env}

进行如下操作：基于min-v2.config
```
将其复制到如上编译环境下的.config, 执行make defconfig
将生成的.config与min-v2.config使用diffinity文本对比工具对比
    在生成的.config中, 新增的行, 逐行查看, 找到开头为非#的行, 把这些都设置为#开头
    例如: CONFIG_PACKAGE_luci-app-ssr-plus=y -> # CONFIG_PACKAGE_luci-app-ssr-plus is not set
    确保最后生成的.config与min-v2.config对比, 新增的行都是#开头
去掉勾选luci-theme-bootstrap主题, 确认勾选luci-theme-argonne, 勾选luci-theme-argonne-config
```
