---
title: 'ERROR 1273 (HY000): Unknown collation: ''utf8mb4_0900_ai_ci'''
date: 2020-04-15 21:21:41
tags:
  - 日常办公
categories:
  - 日常办公
---
# 起因
本地数据库迁移到服务器出错，特此记录下。

```bash
ERROR 1273 (HY000): Unknown collation: 'utf8mb4_0900_ai_ci'
```

# 配置
本地：mysql  8.0.19 
服务器：mysql 5.7.29
# 解决方法
因为是**高版本导入到低版本**，引起1273错误

打开sql文件，将文件中的所有
utf8mb4_0900_ai_ci替换为utf8_general_ci

utf8mb4替换为utf8
保存后重新在服务器运行sql文件即可。