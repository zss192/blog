---
tags: []
categories:
  - Linux
date: 2020-03-13 18:45:00
cover: /img/post/12.jpg
---

---

我用的是electron-ssr，其他工具类似
首先查看下代理端口，如图
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200313165830364.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
终端输入：

```bash
export http_proxy="http://127.0.0.1:12333"
export https_proxy="http://127.0.0.1:12333"
```
通过curl www.google.com命令可以测试终端走没走代理

**这种方法只是一次性的你退出终端再次打开就不走代理了**
