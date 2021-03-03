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

# 增加出国源
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
# Uncomment a feed source，如果用lede的源码只用加上这一句就可以看见ssr插件了！不用再次添加源的
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

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

#增加软件，这里只是一个示范，这里不需要sfe，因为lede的源码是自带的有，如果你要用天灵的源码（immortalwrt）还想要这个sfe软件那就在那里加上，这里仅仅是作为一个示范！
#读到的说明书是sfe支持4.14内核，4.19和5.4内核，都可以！ 三大源码其实最大的特色就是内核不一样，lede 内核5.4且最新，天灵18.07是master（4.14），lieonl是19.07master（应该是4.19）
#三个源码对应的是文件夹里的LEDE、Lieonl和Project ！这下知道差别了吧
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-sfe package/diy/luci-app-sfe
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/shadowsocksr-libev package/diy/shadowsocksr-libev
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt package/diy/pdnsd-alt
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/diy/microsocks
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/diy/dns2socks
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs package/diy/simple-obfs
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray-plugin package/diy/v2ray-plugin
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray package/diy/v2ray
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan package/diy/trojan
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/diy/ipt2socks
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/diy/redsocks2

