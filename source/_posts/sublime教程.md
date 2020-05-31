---
tags:
  - 107网站工作室
categories:
  - 107网站工作室
cover: /img/post/5.jpg
date: 2020-04-08 17:45:00
---

---

# 下载sublime

进官网：https://www.sublimetextcn.com/3/下载相应版本

大家应该都是用的Windows，选择64位即可

![image-20200408170952010](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200408170952010.png)

# 安装Package Control

要想在sublime text 3中安装插件，我们首先需要安装一下包管理器（packages control），在编辑器中使用快捷键 **Ctrl+`** 打开控制台，并输入如下代码，然后回车：

```kotlin
import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

完成上述安装之后，查看菜单栏Preferences下出现**Package Control**选项则表明安装成功，如下图所示：

![image-20200408171234853](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200408171234853.png)

接下来，我们就可以使用Package Control来完成我们的插件安装了，具体操作如下：

使用快捷键 **Ctrl+Shift+P** 打开Package Control，如下图所示

在打开的窗口中输入install 并选择**Install Package**选项，然后回车

# 安装插件

## ChineseLocalization

可实现汉化，安装完成后重新打开即汉化成功

## LiveReload

强烈推荐这个，可以实现sublime里保存后浏览器立即刷新，不用编辑器保存再去浏览器刷新了

sublime里下载插件

![image-20200408171900385](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200408171900385.png)

浏览器下载插件，这里我用的是谷歌浏览器

![image-20200408172046415](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200408172046415.png)

下载好后右上角出现一个圆圈标志，我们要改下设置

右键图标选择管理拓展程序，下滑找到允许访问文件地址，选上这项

![image-2020](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-2020.png)

至此就配置好了，接下来让我们看看怎么使用吧



浏览器里打开我们的网页，点击livereload图标，它中间会出现个小点即可

![image-20200408173449272](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200408173449272.png)

sublime里按快捷键Ctrl+shift+p输入livereload回车

![image-20200408172811637](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200408172811637.png)

选择simple reload回车，然后我们在sublime改变网页内容Ctrl+s保存后，浏览器就会立即刷新

# sublime使用技巧

## 快捷键

- ctrl+shift+/：选中一部分后即可注释

- Ctrl+D： 选词 （反复按快捷键，即可继续向下同时选中下一个相同的文本进行同时编辑）

- Ctrl+Shift+P： 打开命令面板

- Ctrl+Shift+[： 折叠代码
- Ctrl+Shift+]： 展开代码
- 更多自行搜索

## 其他

- 菜单栏中选择项目->添加文件夹到项目就可以在左侧更方便的更改文件

![image-20200408174231585](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@latest/images/image-20200408174231585.png)

- sublime里可以运行Python、java、php代码，需手动配置，感兴趣的自行搜索。

# 写在最后

由于我已经安装了sublime，上面步骤有的是网上搜的并没实际操作，如遇到问题，下方留言即可。