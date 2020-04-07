---
tags: []
categories:
  - Linux
date: 2020-02-21 14:45:00
cover: https://w.wallhaven.cc/full/wy/wallhaven-wyk93p.jpg
---

---

## 问题
**在deepin中我们需要运行java -jar jar文件才能运行jar文件，但每次都这样确实比较麻烦，我们可以通过创建java启动器解决这个问题。**
## 解决方案
**在目录/usr/share/applications创建一个java.desktop文件，文件内容如下（需要root权限才能写入）**

```bash
[Desktop Entry]
Name=java
Comment=jar run.
Exec=/usr/bin/java -jar %f
Terminal=false
Type=Application
Icon=openjdk-8
Categories=Development;
MimeType=application/java-archive,application/x-java-archive,application/x-jar
```
**这样就会出现Java图标了
找到jar文件，右键打开方式选择java，这样以后就可以双击打开jar文件了。**

