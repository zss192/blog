---
title: deepin使用crontab自动更换壁纸
tags:
  - Linux
categories:
  - Linux
date: 2020-04-13 17:33:00
---
# 起因

deepin下有自动更换壁纸功能，但是最多间隔1小时且最多自动更换范围为15张图片。
# 解决方法
用python脚本更换壁纸，再利用crontab定时执行python脚本完成自动更换壁纸功能。crontab也可定时执行其他sh脚本、python脚本。我也是第一次接触crontab，后将其用于github博客每天自动更新，或者每天自动把本地笔记推到github都是不错的选择。
# python脚本

```python
#!/usr/bin/python3
import os
import random
import subprocess

"""
利用linux下的crontab工具实现半小时切换一次，
*/30 * * * * python /xxx/changebackground.py
"""

# 更换壁纸指令，此为deepin更换指令，不代表所有linux发行版更换指令
cmd = "gsettings set com.deepin.wrap.gnome.desktop.background picture-uri "
# 图片目录，用户可自主更换
path = "/home/zss/Pictures/"

# 利用os.listdir()方法获取图片目录下的所有文件名的列表
pic_list = os.listdir(path)
# 确切的文件位置，以及确切的更换指令
while(True):
	real_path = path + str(random.choice(pic_list))
	if(real_path[-3:]=="jpg" or real_path[-3:]=="png"):
		break

real_cmd = cmd + "\"" + real_path +"\""
# 执行
pid = subprocess.check_output(["pgrep", "dde-session"]).decode("utf-8").strip()#获取到dde-session的PID具体请看上面的那个问题与回答
cmd = "grep -z DBUS_SESSION_BUS_ADDRESS /proc/" + pid + "/environ|cut -d= -f2-"
os.environ["DBUS_SESSION_BUS_ADDRESS"] = subprocess.check_output(
    ['/bin/bash', '-c', cmd]).decode("utf-8").strip().replace("\0", "")
    
os.system(real_cmd)
```
>脚本为一篇博客发现，但原脚本本地执行有效，一放到corntab就不行，原因下面讲述。
# crontab

```powershell
crontab -e 		//进入corntab文件
crontab -l 		//查看corntan文件
```
f1 f2 f3 f4 f5 program

 - 其中 f1 是表示分钟，f2 表示小时，f3 表示一个月份中的第几日，f4 表示月份，f5 表示一个星期中的第几天。program 表示要执行的程序。
 - 当 f1 为 * 时表示每分钟都要执行 program，f2 为 * 时表示每小时都要执行程序，其馀类推
 - 当 f1 为 a-b 时表示从第 a 分钟到第 b 分钟这段时间内要执行，f2 为 a-b 时表示从第 a 到第 b 小时都要执行，其馀类推
 - 当 f1 为 */n 时表示每 n 分钟个时间间隔执行一次，f2 为 */n 表示每 n 小时个时间间隔执行一次，其馀类推
 - 当 f1 为 a, b, c,... 时表示第 a, b, c,... 分钟要执行，f2 为 a, b, c,... 时表示第 a, b, c...个小时要执行，其馀类推

# 无效解决方法

 1. 所有文件必须是绝对路径
 2. 例如python命令也要用绝对路径，如/usr/bin/python
 3. 对于sh文件无效可尝试先进入文件夹再执行./test.sh
 4. 对于deepin更换壁纸一定要注意加上以下代码，具体原因见[用Python爬虫+Crontab实现自动更换电脑壁纸](https://blog.csdn.net/u011648373/article/details/84837650)

```python
pid = subprocess.check_output(["pgrep", "dde-session"]).decode("utf-8").strip()#获取到dde-session的PID具体请看上面的那个问题与回答
cmd = "grep -z DBUS_SESSION_BUS_ADDRESS /proc/" + pid + "/environ|cut -d= -f2-"
os.environ["DBUS_SESSION_BUS_ADDRESS"] = subprocess.check_output(
    ['/bin/bash', '-c', cmd]).decode("utf-8").strip().replace("\0", "")
```
# 个人文件配置示例
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200414111959680.png)