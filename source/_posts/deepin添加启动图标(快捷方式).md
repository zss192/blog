---
tags: []
categories:
  - Linux
date: 2020-02-21 16:45:00
cover: /img/post/6.jpg
---

---
<div id="content_views" class="markdown_views prism-tomorrow-night-eighties">
<path stroke-linecap="round" d="M5,0 0,2.5 5,5z" id="raphael-marker-block" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
                    </svg>
                                            <p>在linux(deepin)中，由深度商店下载的应用会自动在启动器创建快捷方式，但是从浏览器上下载的应用就只能找到安装后的目录，点击再打开，很不方便，在这里就分享下我找到的在启动器上创建启动图标的方式．<br>
默认情况下系统所有的快捷方式放在/usr/share/applications，打开该目录会看到大量的.desktop文件，每个文件便是一个快捷方式。</p>
<p>以Postman为例：<br>
首先以管理员方式打开 /usr/share/applications目录<br>
新建 Postman.desktop<br>
输入一下内容就可以</p>

```bash
[Desktop Entry]
Type=Application
Comment=postman
Name=Postman
Icon=postman
Exec=/opt/Postman/Postman
Terminal=false
Categories=Application;
```

### 参数说明:<br>
**Name: 快捷方式名；<br>
Comment: 注释；<br>
Exec: 启动脚本，程序执行文件的完整路径；<br>
Icon：图标的文件名及路径。<br>
Terminal：是否以终端启动。<br>
…………<br>
以上参数就可以使用，更多参数待补充</p>**

### deepin社区有大佬写了个应用
[DesktopFileCreator deb安装包](https://bbs.deepin.org/forum.php?mod=attachment&aid=NTQwMDZ8YzgxZjcwYjB8MTU4MjI2NjgyM3wyMTg1MTV8MTU1NDQ0)

<img src="https://img-blog.csdnimg.cn/20200221144105120.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70" width="50%" height="30%">
<p>使用方法参照上面的参数。</p>

                       
