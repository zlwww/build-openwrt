## 不要随意拉取源地址更新的代码
此版算是备份吧，源地址少了很多自定义选项，倾向于自动化！！！只能依赖上游了

Date:20210218 gli300nv2 终于编译成功了，只保留了ssr+xray1.3核心的插件，固件其实还有问题当修改WiFi名称之后，再一次就打不开路由地址了，但是ssh以及路由自身功能不任何受影响，
所以编译以前最好确定好你自己的路由器ip地址和要自定义的名称，否则更改起来不知道会有什么问题。目前运行起来效果良好。
在拉取上游更新以前请先看看上有改变的多不，如果上游不更了，删了再拉取就晚了！
破案了。开启splice就无法登录login页面了，可能是sfe高通加速的锅，turbo acc 不受影响
再次关于加速选哪个，暂时看到的是只有7621支持硬件加速，其他的都是软件算法的软加速，Porject的固件默认是flowoffload加速，取消掉它之后会出现sfe加速选项，所以这里的7628AN选用sfe加速。
试过5.4内核的LEDE的固件编译了两个加速同时存在，实测并无太大差别！不知道4.14表现如何

xray1.31+4.14.222内核开启sfe转发，关闭桥接加速，开启DNS加速和多线程（真的是响应快），并设置了联通代理，观察到的是负载可能更大了，但是下载速度提到了2.5M最大，并且speedtest可以到80左右了。 
可用固件 
> #19 固件
> #30  xray1.4

### ~~Lieonl的固件搞不了~~
添加天灵的相对比较新的turbo acc插件，无法被此固件正常拉取融合进去
Lieonl的自带package有很多已经很老了，所以再添加新版本的时候会出重名和冲突，暂时试了一个解决办法不知道可以不，如果不行的话之后就固定天灵的固件了。在 下载${{matrix.target}}源码 的部分
添加要替换的package，如 luci-app-sfe,在rm -rf package/lean/ 语句里添加即可，其他牌子的固件对应修改即可，同时你要在sh-1里面添加上你要替换的package源。编译成功了，新版sfe也编译进去了，但是固件无法正常联网，~~所以Lieonl的固件不折腾了~~。
因为 acc加速 
>目前仅支持 PDNSD 和 DNSForwarder

而Lieonl使用的是DDNS，所以使用加速要把DNSForwarder加上即可，不出意外编译的就可以用了。19.07

Lieonl 如果要替换自带软件，在对应的sh2文件添加语句即可，如为了要安装最新版的luci-app-sfe,而固件自带了，你只要在sh2文件中添加 rm -rf package/lean/luci-app-sfe 就删除了固件自带的 luci-app-sfe，在sh1中设置好自己的就可以了。


## Actions-OpenWrt

#### - 【[Telegram交流群](https://t.me/joinchat/AAAAAE3eOMwEHysw9HMcVQ)】-&nbsp;&nbsp;&nbsp;- 【[Telegram下载](https://telegram.org/)】-&nbsp;&nbsp;&nbsp;- 【[Telegram使用中文方法](https://github.com/danshui-git/shuoming/blob/master/tele.md)】-
#

- 2021月1月26号说明，26号开始插件包取消任何科学上网插件，有需要的请自行拉取《[拉取插件方法](https://github.com/danshui-git/shuoming/blob/master/ming.md)》，如果编译出现错误或者什么情况的，请大家都拉取我的最新仓库使用。

- 弄了一个启动教程视频，mp4格式，存网盘了，需要的自己下载。《[谷歌云](https://drive.google.com/drive/folders/1WEUtVfiVtR5lyG8aX4RcDGdUPV6uMlxt?usp=sharing)》、《[百度（密码：apek）](https://pan.baidu.com/s/1RVi4nN8Y1ak9LTWzhV5bSQ)》、《[微云](https://share.weiyun.com/33SgJdCO)》

- 制作了一个一键重新拉取我编译仓库的脚本，有需要的可以去看看。《[一键重新拉取编译仓库](https://github.com/281677160/sync-forks)》

- 选择Lede_phicomm_n1或Project_phicomm_n1的机型文件夹编译的话，会自动编译出（ N1、微加云、贝壳云、我家云、S9xxx ）OpenWrt固件，固件已经自动打包好【[写入emmc方法](https://github.com/danshui-git/shuoming/blob/master/n1.md)】

- 除了编译 openwrt 机型外，其他机型都直接打入了常用插件了，不需要自己再拉取插件，除非我的插件包跟源码自带的都没有，你就自己添加吧 【[插件包](https://github.com/281677160/openwrt-package)】
#
## 编译说明：
### - 以下的说明教程都是在我另外的仓库的，查看说明时候就跳转到另外仓库了，浏览器回退就会回来，别拉取到我说明的仓库，注意了！
#
- 1、`注册及登录github账号`《[注册链接](https://github.com)》
#
- 2、`拉取我的仓库到你的仓库`《[拉取仓库教程](https://github.com/danshui-git/shuoming/blob/master/1%E6%8B%89%E5%8F%96%E4%BB%93%E5%BA%93.md)》
#
- 3、[必须了解](https://github.com/danshui-git/shuoming/blob/master/%E7%AE%80%E5%8D%95%E4%BB%8B%E7%BB%8D%E6%96%B0%E8%84%9A%E6%9C%AC.md)下脚本的简单介绍《[脚本简单介绍](https://github.com/danshui-git/shuoming/blob/master/%E7%AE%80%E5%8D%95%E4%BB%8B%E7%BB%8D%E6%96%B0%E8%84%9A%E6%9C%AC.md)》
#
- 4、`选择要编译的源码跟机型`《[教程](https://github.com/danshui-git/shuoming/blob/master/%E9%80%89%E6%8B%A9%E6%9C%BA%E5%9E%8B.md)》
#
- 5、设置好要编译的机型后，在build文件夹--你要编译的对应机型文件夹（跟第4步修改的机型一样的文件夹）里的【diy-2.sh】修改登录IP，好等编译完成安装后顺利登录openwrt《[修改ip教程](https://github.com/danshui-git/shuoming/blob/master/ip.md)》
#
- 6、修改好ip后，根据个人需求打开或者关闭各功能，开关控制在build文件夹--你要编译的对应机型文件夹（跟第4步修改的机型一样的文件夹）里的【settings.ini】设置《[各开关控制教程](https://github.com/danshui-git/shuoming/blob/master/kaiguan.md)》
#
- 7、第4、5、6步骤都完成后，就可以启动编译了《[[启动教程](https://github.com/danshui-git/shuoming/blob/master/%E6%89%8B%E5%8A%A8%E5%BC%80%E5%A7%8B.md)]》,启动编译的时候也可以顺手打开SSH连接的，请认真看教程的第一张图片
#
- 8、`SSH远程连接服务器配置固件`《[SSH连接教程](https://github.com/danshui-git/shuoming/blob/master/3SSH%E8%BF%9E%E6%8E%A5%E8%AF%B4%E6%98%8E.md)》，SSH远程默认关闭的，需要打开的请在build文件夹里面的对应机型文件夹的‘settings.ini’设置，或者按钮启动编译的时候顺手打开
#
- 9、`配置固件`《[youtube大神的固件配置视频教程](https://www.youtube.com/watch?v=jEE_J6-4E3Y)》《[恩山大神xtwz整理的插件中文对照](https://www.right.com.cn/forum/thread-3682029-1-1.html)》，《[youtube大神的网卡、无线网卡配置视频教程](https://www.youtube.com/watch?v=X9v6Nd3wxkk)》，放视频在这里只是给大家了解一下怎么选择插件而已，不是叫大家对着视频照着干，千万不要这样做，你就看会什么东西在哪个位置就好了。
#
- 10、`完成编译，下载固件`《[固件下载教程](https://github.com/danshui-git/shuoming/blob/master/4%E5%9B%BA%E4%BB%B6%E4%B8%8B%E8%BD%BD.md)》
#
- 11、`安装固件`，安装固件时出现“Please press Enter to activate this console”就表示安装好了，出现这个就不会跑码的，稍等1分钟就可以进入网页了
- 如果会跑码，就耐心等待跑码完成，应该不需要1分钟就能跑完的
#
- 12、`保存固件配置`，编译固件之前打开‘`SSH连接服器配置固件`’跟‘`上传【.config】配置文件在github空间`’，编译的时候SSH连接服务器修改好插件跟其他应用，编译成功后会有固件跟.config配置文件的，下载.config配置文件后，解压得到一个【config.buildinfo】文件，用记事本打开，把里面的内容都复制，然后覆盖对应机型.config里面原来的内容，这样就会保持你的配置了，下次编译在不修改配置的情况下可以使用定时编译功能，或者手机启动编译，本地提取.config配置文件覆盖进去也可以
#
- 13、
《[定时触发编译说明](https://github.com/danshui-git/shuoming/blob/master/%E5%AE%9A%E6%97%B6%E7%BC%96%E8%AF%91%E8%AF%B4%E6%98%8E.md)》
《[修改跟删除](https://github.com/danshui-git/shuoming/blob/master/%E5%88%A0%E9%99%A4%E5%92%8C%E4%BF%AE%E6%94%B9%E6%96%87%E4%BB%B6.md)》
《[本地提取.config](https://github.com/danshui-git/shuoming/blob/master/%E6%9C%AC%E5%9C%B0%E6%8F%90%E5%8F%96.config.md)》
《[IPV4/IPV6选择](https://github.com/danshui-git/shuoming/blob/master/%E5%85%B6%E4%BB%96%E8%AF%B4%E6%98%8E.md)》
《[固件包减负](https://github.com/danshui-git/shuoming/blob/master/%E5%9B%BA%E4%BB%B6%E6%96%87%E4%BB%B6%E5%A4%B9%E6%95%B4%E7%90%86.md)》
《[banner的说明](https://github.com/danshui-git/shuoming/blob/master/banner%E8%AF%B4%E6%98%8E.md)》
《[patch补丁制作](https://github.com/danshui-git/shuoming/blob/master/buding.md)》
《[NTFS优盘挂载](https://github.com/danshui-git/shuoming/blob/master/ntfs.md)》
《[各种命令的简单介绍](https://github.com/danshui-git/shuoming/blob/master/ming.md)》
《[微信通知跟自动发布固功能密匙获取跟使用教程](https://github.com/danshui-git/shuoming/blob/master/ms.md)》
《[Telegram机器人推送信息教程](https://github.com/danshui-git/shuoming/blob/master/bot.md )》
#
- 14、建议准备梯子一把，虽然云编译不需要梯子，不过你使用SSH连接、下载固件、打开github网页也是需要梯子比较好的（没有也行，比较卡就是）

#
#
- 感谢[coolsnowwolf](https://github.com/coolsnowwolf/lede.git)大神提供的源码
- 感谢[Lienol](https://github.com/Lienol/openwrt.git)大神提供的源码
- 感谢[ctcgfw](https://github.com/project-openwrt/openwrt.git)大神提供的源码
- 感谢[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)大神提供的一键编译脚本
- 感谢[garypang13](https://github.com/garypang13/Actions-OpenWrt)大神提供的一键编译脚本
- 感谢[tuanqing](https://github.com/tuanqing/mknop)大神提供的一键打包脚本
- 感谢[hyird](https://github.com/hyird/Action-Openwrt)大神，是这仁兄告诉我有patch补丁这回事的
- 还有要感谢<a href="#/README.md">World Peace</a>仁兄，这个仁兄是在P3TERX大神的Telegram群认识的，我刚接触云编译时告诉我使用files修改设置的，非常感谢!
- 感谢微软免费提供的编译平台
- 感谢各位大佬提供的各种各样的插件
- 感谢各位帮助过我的人，祝福各位好人一生平安
