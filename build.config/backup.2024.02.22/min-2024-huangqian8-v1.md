部署编译环境: env.md/{lede env}

sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.15/g' target/linux/armvirt/Makefile

使用https://github.com/huangqian8/Cloud-N1-OpenWrt/blob/main/config.sh

执行make defconfig
