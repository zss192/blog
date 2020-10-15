---
title: hexo迁移至新电脑
tags:
  - 日常办公
categories:
  - 日常办公
date: 2020-10-12 19:18:00
---
# 写在前面

由于想在实验室电脑上也可以用hexo更新博客，特此记录下相关操作

相关配置：

- 系统：deepin15.11
- 已配置好git



# 安装 node、npm

```
安装 nodejs和npm 
sudo apt install node

检测是否安装好
node -v
npm -v
```

# 拷贝文件

将原来的博客文件拷贝过来即可，例如我的文件件如下所示

![image-20201012190547411](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/image-20201012190547411.png)

# 安装hexo和相关模块

```
sudo npm install -g hexo
sudo npm install
```

接下来就可正常使用了

```
hexo clean  //清除缓存
hexo g  //生成静态文件
hexo d    //推到远程仓库
```

# 可能遇到的问题

我在用hexo d的时候一直提示权限不足。

![image-20201012191145211](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/image-20201012191145211.png)

但我github已经添加了SSH密钥，一番检查后发现我的远程仓库不仅有github还有coding，虽然添加了github的SSH密钥，但没添加coding的，导致一直提示权限不足。查看远程仓库在根目录下的_config.yml

![image-20201012191431834](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/image-20201012191431834.png)