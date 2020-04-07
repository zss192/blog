---
tags: []
categories:
  - CTF-WEB
date: 2020-02-11 14:45:00
cover: /img/post/8.jpg
---

---
## 以Hacking Lab的验证码题为例
#### 题目
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200211193802536.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
### 对Pkav HTTP Fuzzer配置
##### 1.标记爆破的位置，图形验证码，选择字典
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200211194239895.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
##### 2.设置验证码范围
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200211194441900.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
##### 3.添加验证码地址，进行相关设置
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200211194640878.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
**tips:下方可进行识别测试**
##### 4.本题需要设置验证码识别模式为单线程
**点击下方重放选项选择单线程**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200211194940535.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
##### 4.发包器页面启动爆破
**根据长度判断是否成功（点击长度即可自动排序）**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200211195237437.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)


