---
tags: []
categories:
  - 日常办公
date: 2020-04-06 14:45:00
cover: /img/post/7.jpg
---

---

>本文章仅供交流学习使用，请勿用作违法行为。


# 1.安装Sublime
注意：根据自己的系统选择相应的版本下载，安装完成之后看是否需要激活，如果需要激活继续往下看）

# 2. 安装软件
这个我就不多BB了。 安装完请勿打开SublimeText3。 （若已打开关了就是）

# 3. 修改
3207版本基本杜绝了共享license key的方法

所以我们要修改验证license时的trigger

因官方采用revoke illegal licenses的方式，即使当时显示激活成功，联网验证时便会凉凉。

所以我们还要采用hosts屏蔽法复制以下地址直接粘贴到相应系统的hosts文件内

```bash
127.0.0.1 license.sublimehq.com
127.0.0.1 www.sublimetext.com
50.116.34.243 sublime.wbond.net
50.116.34.243 packagecontrol.io
```

## 3.1 修改trigger
### 3.1.1 Win
利用HexEditor打开软件根目录下的sublime_text.exe
搜索到 97 94 0D 00  改为  00 00 00 00
保存

### 3.1.2 Mac
拷出/Applications/Sublime Text.app/Contents/MacOS/Sublime Text
其实就是 应用程序 文件夹下找到SublimeText应用，然后右键->显示包内容，
然后打开/Contents/MacOS/ 然后找到 Sublime Text 这个文件 拷出来
利用0xED(网盘会有)或者其他HexEditor打开它
搜索16进制 97 94 0D 00
改为  00 00 00 00
如果实在不会修改网盘里有修改好的现成的
保存
打开终端，切换到当前目录
然后键入chmod 755 Sublime\ Text
替换掉/Applications/Sublime Text.app/Contents/MacOS/Sublime Text
完事儿
### 3.1.3 Linux
基本同Mac操作
找个16进制编辑器打开软件根目录下的Sublime Text
搜索16进制 97 94 0D 00
改为  00 00 00 00
保存
打开终端，切换到当前目录
然后键入chmod 755 Sublime\ Text
完事儿
## 3.2 修改host
### 3.2.1 Win
Windows的hosts文件在：

系统盘:C:\windows\system32\drivers\etc

Tips: Win下的权限获取可能有点复杂，不如先拷到桌面，编辑完替换回去。
在最后一行插入

```bash
127.0.0.1 license.sublimehq.com
127.0.0.1 www.sublimetext.com
50.116.34.243 sublime.wbond.net
50.116.34.243 packagecontrol.io
```

### 3.2.2 Mac
打开Terminal(终端)
输入 sudo nano /Private/etc/hosts 回车
输入密码后回车
在最后一行插入

```bash
127.0.0.1 license.sublimehq.com
127.0.0.1 www.sublimetext.com
50.116.34.243 sublime.wbond.net
50.116.34.243 packagecontrol.io
```

### 3.2.3 Linux
同Mac

# 4. 激活
打开Sublime Text 3 选择Help -> Enter License 输入

```bash
----- BEGIN LICENSE -----
TwitterInc
200 User License
EA7E-890007
1D77F72E 390CDD93 4DCBA022 FAF60790
61AA12C0 A37081C5 D0316412 4584D136
94D7F7D4 95BC8C1C 527DA828 560BB037
D1EDDD8C AE7B379F 50C9D69D B35179EF
2FE898C4 8E4277A8 555CE714 E1FB0E43
D5D52613 C3D12E98 BC49967F 7652EED2
9D2D2E61 67610860 6D338B72 5CF95C69
E36B85CC 84991F19 7575D828 470A92AB
------ END LICENSE ------
```

选择Use license

---------------------------至此激活成功---------------------------

转自：[Sublime3 激活教程](https://zhuanlan.zhihu.com/p/107554937)
