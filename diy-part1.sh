#!/bin/bash
# ----------------------------------------------通用diy-part1.sh解除系统限制-----------------------------------------------
ulimit -u 10000
ulimit -n 4096
ulimit -d unlimited
ulimit -m unlimited
ulimit -s unlimited
ulimit -t unlimited
ulimit -v unlimited
