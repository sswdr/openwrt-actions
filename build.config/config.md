.config文件说明

```
文件               说明

min-v*.config      最小/最精简,用于开始配置的基础配置,需要最基本的需求,不添加无用和默认选择的依赖

max-v*.config      全量,主要用于获取全量离线的dl,测试和记录插件/依赖的使用,不用于正常环境使用

general-v*.config  自用写入emmc使用,不进行测试和记录插件/依赖,只记录选中的依赖,用于正常环境使用

test-v*.config     用于临时/快速编译全部/部分,进行测试
```
