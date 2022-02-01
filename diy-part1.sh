#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# fw876/helloworld
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

# Lienol/openwrt-package
#sed -i '$a src-git lienol https://github.com/Lancenas/lienol-openwrt-package.git' feeds.conf.default

echo "LINUX_VERSION-5.4 = .108
LINUX_KERNEL_MD5SUM-5.4.108 = de5118715720cee96ed40afd33ab267d" > include/kernel-5.4

echo "KERNEL_PATCHVER:=5.4
KERNEL_TESTING_PATCHVER:=5.4" >> target/linux/x86/Makefile

mkdir ./dl/
wget https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.4.108.tar.xz -o ./dl/linux-5.4.108.tar.xz

cp ../x86.config .config
