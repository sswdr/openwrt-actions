workflows yml export: workdir.tar.gz / env.tar.gz / env-dl.tar.gz
```
use .yml: 
https://github.com/sswdr/openwrt-actions/blob/backup.2022.04.25/.github/workflows/action-dev-export.yml

yml env Json:
{
  REPO_URL: https://github.com/coolsnowwolf/lede,
  REPO_BRANCH: master,
  FEEDS_CONF: feeds.conf.default,
  CONFIG_FILE: 5.10-lede+kenzok8-max-v3.config,
  DIY_P1_SH: diy-part1.sh,
  DIY_P2_SH: diy-part2-5.10.x.sh,
  TZ: Asia/Shanghai
}

diy-part2-5.10.x.sh: https://github.com/sswdr/openwrt-actions/blob/backup.2022.04.25/diy-part2-5.10.x.sh
```

workflows yml export: bin / rootfs / img
```
{use=n1,ip=192.168.5.25,user=root,password=password}

use .yml: 
https://github.com/sswdr/openwrt-actions/blob/backup.2022.04.25/.github/workflows/action-n1-5.10.x-max-compile.yml
https://github.com/sswdr/openwrt-actions/blob/backup.2022.04.25/.github/workflows/action-n1-5.10.x-min-compile.yml

use .config:
https://github.com/sswdr/openwrt-actions/blob/backup.2022.04.25/5.10-lede+kenzok8-max-v3.config
https://github.com/sswdr/openwrt-actions/blob/backup.2022.04.25/5.10-lede+kenzok8-min-v3.config
```
