#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 基本不需要添加啥插件了,我搜集了各位大神的插件都集成一个软件包直接打入源码里面了
# 要了解增加了什么东西，就到我的专用软件包里面看看看吧，如果还是没有你需要的插件，请不要一下子就拉取别人的插件包
# 相同的文件都拉一起，因为有一些可能还是其他大神修改过的容易造成编译错误的
# 想要什么插件就单独的拉取什么插件就好，或者告诉我，我把插件放我的插件包就行了
# 软件包地址：https://github.com/281677160/openwrt-package
# 拉取插件请看《各种命令的简单介绍》第4条、第5条说明,不管大神还是新手请认真的看看,再次强调请不要一下子就拉取别人一堆插件的插件包,容易造成编译错误的
#添加自定义插件链接（自己想要什么就github里面搜索然后添加）

git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/diy/luci-theme-edge  #主题-edge
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/diy/luci-theme-infinityfreedom  #透明主题
git clone -b master https://github.com/vernesong/OpenClash.git package/diy/luci-app-openclash  #openclash出国软件
git clone https://github.com/frainzy1477/luci-app-clash.git package/diy/luci-app-clash  #clash出国软件
git clone https://github.com/tty228/luci-app-serverchan.git package/diy/luci-app-serverchan  #微信推送
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/diy/luci-app-smartdns  #smartdns DNS加速
git clone https://github.com/garypang13/luci-app-eqos.git package/diy/luci-app-eqos  #内网IP限速工具
git clone https://github.com/jerrykuku/node-request.git package/diy/node-request  #京东签到依赖
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/diy/luci-app-jd-dailybonus  #京东签到
git clone https://github.com/esirplayground/luci-app-poweroff.git package/diy/luci-app-poweroff  #关机（增加关机功能）

#增加LEDE的ShadowSocksR Plus+出国软件 (源码自带passwall出国软件)
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# fullcone NAT patch
# git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
# https://github.com/LGA1150/openwrt-fullconenat/issues/4
# sed -i 's/SUBDIRS/M/' package/fullconenat/Makefile
# following two lines need to be added in iptables
# iptables -t nat -A POSTROUTING -o eth0 -j FULLCONENAT
# iptables -t nat -A PREROUTING -i eth0 -j FULLCONENAT

rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  #新的argon主题
git clone https://github.com/jerrykuku/luci-app-argon-config package/lean/luci-app-argon-config  #argon主题设置（编译时候选上,在固件的‘系统’里面）
