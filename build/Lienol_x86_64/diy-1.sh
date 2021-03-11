#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 基本不需要添加啥插件了,我搜集了各位大神的插件都集成一个软件包直接打入源码里面了
# 要了解增加了什么东西，就到我的专用软件包里面看看看吧，如果还是没有你需要的插件，请不要一下子就拉取别人的插件包
# 相同的文件都拉一起，因为有一些可能还是其他大神修改过的容易造成编译错误的
# 想要什么插件就单独的拉取什么插件就好，或者告诉我，我把插件放我的插件包就行了
# 软件包地址：https://github.com/281677160/openwrt-package
# 拉取插件请看《各种命令的简单介绍》第4条、第5条说明,不管大神还是新手请认真的看看,再次强调请不要一下子就拉取别人一堆插件的插件包,容易造成编译错误的
# 增加出国源
# sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
# 你可能需要删除lienol的插件
# Uncomment a feed source，如果用lede的源码只用加上这一句就可以看见ssr插件了！不用再次添加源的
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-sfe package/diy/luci-app-sfe
# svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-flowoffload package/diy/luci-app-flowoffload

#真的是每一个都不一样，lienol维护的是19.07的主分支，如果需要添加passwall添加下面2行就可以，第二个是依赖，跟新的也算频繁，貌似很稳定，该有的插件都有了
# sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
# 下面这个据说是官方支持的passwall，最好和上面的不要同时启用，怕冲突！！！
#sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default

# 这里展示的是另外一种拉取方式，可能更加稳妥？
git clone https://github.com/xiaorouji/openwrt-passwall package/diy/luci-app-passwall
# 可能再加一个官方ssrplus
git clone https://github.com/fw876/helloworld package/diy/helloworld
