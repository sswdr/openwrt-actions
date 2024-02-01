#!/bin/bash
# TODO 这部分加入编译环境编译yml中.txt，去掉这个脚本在其他关联的地方，重命名diy-part2.sh -> my-config.sh
echo "解除系统限制"
ulimit -u 10000
ulimit -n 4096
ulimit -d unlimited
ulimit -m unlimited
ulimit -s unlimited
ulimit -t unlimited
ulimit -v unlimited
