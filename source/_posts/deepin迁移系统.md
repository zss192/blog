---
tags:
  - Linux
categories:
  - Linux
date: 2020-09-24 18:45:00
---
# 写在前面

因为实验室电脑重装了deepin系统，想把笔记本上备份下直接恢复到实验室台式机上，但是数据恢复了，启动项也覆盖了，整了一两天也没整好，卒。

后尝试把用户目录下的.config文件夹下软件配置直接copy过来发现可行，这样不用再配置软件了。

本篇文章仅为个人笔记，方便日后重装系统免去配置软件等步骤。

# 迁移具体操作

> 进行数据迁移前建议备份下原文件或者用timeshift备份下系统

个人安装的软件一般在opt目录下，把这些软件直接copy到台式机上的opt目录下，如sublime_text

![image-20200920112036363](https://img-blog.csdnimg.cn/img_convert/5dd31e01b012c465c92c2adcfb1bb074.png)

然后把笔记本下的.config目录下的sublime对应的文件夹copy到台式机上对应文件夹即可

![image-20200920112109178](https://img-blog.csdnimg.cn/img_convert/7127f51005fd5ae1256545151abee587.png)



然后我们打开sublime，会惊奇的发现下载的插件还有配置什么的都还在

> 注意在opt目录下的软件需要先创建个快捷图标(y=用桌面文件创建工具即可)

![image-20200920112446748](https://img-blog.csdnimg.cn/img_convert/ae9bffee4bbeaf6156825c060ebbb0ed.png)

其他软件同理，只需把.config下文件copy过来即可，注意copy过来之前不要打开软件否则可能会覆盖你copy过来的文件导致打开软件还需要配置

# deepin其它配置

安装好deepin后还需要很多配置

1.首先在设置里更新下系统然后把智能镜像源切换成国内的源

![image-20200920112804733](https://img-blog.csdnimg.cn/img_convert/dce0a17cef5e42ee5712ae8bce48882e.png)

2.把Windows下的C:\Windows\Fonts文件夹复制到deepin下。打开deepin字体安装器，直接把Fonts文件夹拖进去即可。然后去设置里更改下字体

![image-20200920113329172](https://img-blog.csdnimg.cn/img_convert/74567fb7803add9ec6ff04056712b30b.png)

3.由于经常要为一些可执行文件创建桌面图标，安装下一个桌面文件创建软件。[点我下载](https://blog.csdn.net/zss192/article/details/104427330)

4.谷歌浏览器登录账号同步即可。若浏览器字体不清楚可以

- 用stylus插件，[点我下载](https://chrome.google.com/webstore/detail/stylus/clngdbkpkpeebahjckkjfobafhncgmne?utm_source=chrome-ntp-icon)。然后下载思源黑体即可，[点我下载](https://userstyles.org/styles/123597/theme)。这样会强制渲染浏览器字体为思源黑体。
- 全部设置字体为微软雅黑（外观->自定义字体）

5.普通用户使用sudo免密码：dedit /etc/sudoers 修改your_user_name ALL=(ALL) NOPASSWD: ALL