---
title: Git使用方法
tags:
  - 日常办公
categories:
  - 日常办公
date: 2020-10-16 21:45:00
---

# 常用代码

```git
git init    //初始化仓库,若是用的clone则不需要这步
git config --global user.name "账户名"
git config --global user.email "邮箱号"
git config --global --list	//查看全局配置(设置的邮箱等)
git remote add origin 远程库地址 	//关联到远程库

日常使用步骤
git add .	//把文件添加到版本库中
git commit -m "test"	//把文件提交到仓库。引号内为提交说明
git pull origin master	//把远程仓库的master分之拉到本地
git push origin master	//把本地文件推到远程仓库master分支
```

# 速查表
![img](https://img-blog.csdnimg.cn/img_convert/c3564e1d2318110e06be04b97fdf8fd0.png)

# 注意事项

1.不到万不得已不要使用强制提交(问就是曾和学长一起开发系统用过，然后把更新记录全部覆盖了，虽然代码没什么大改动，但是提交记录被全部覆盖不利于后期维护)

```
git push --force origin master　如果本地比远程仓库版本低，会提醒先git pull更新，但仍要坚持提交可用这个强制提交
```

2.github添加了ssh密钥使用ssh -T git@github.com测试报错？

事实证明重启即可
