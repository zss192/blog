---
tags:
  - Linux
categories:
  - Linux
date: 2020-02-24 18:45:00
cover: /img/post/9.jpg
---

---
>问题：deepin用终端安装mysql，却安装的一直是MariaDB，找到了一个下载安装包安装的方法，并添加了些安装时遇到的问题，在此记录下。
<div class="htmledit_views" id="content_views">
                                            <h3><a name="t0"></a><a name="t0"></a>第一步、&nbsp;</h3>

<p>首先去官网下载mysql的安装包<a href="https://dev.mysql.com/downloads/mysql/" rel="nofollow">https://dev.mysql.com/downloads/mysql/</a></p>

<p>linux generic 的64位的tar -xJvf mysql-8.0.18-linux-glibc2.12-x86_64.tar.xz&nbsp;</p>

<p><img alt="" class="has" height="186" src="https://img-blog.csdnimg.cn/20191031195545619.png" width="889"></p>

<h3><a name="t1"></a><a name="t1"></a>第二步、解包</h3>

<p>找到下载好的64位mysql安装包</p

```sql
sudo tar -xJvf mysql-8.0.18-linux-glibc2.12-x86_64.tar.xz
```
<p>移动到指定位置：一定要这个位置，原因是在mysql配置文件中写死了，这样的好处是可以直接用默认文件启动mysql服务&nbsp;</p>

```sql
sudo mv mysql-8.0.18-linux-glibc2.12-x86_64/ /usr/local/mysql
```

<h3><a name="t2"></a><a name="t2"></a>第三步、创建mysql用户</h3>

```sql
sudo useradd -r -s /bin/false mysql
```

<h3><a name="t3"></a><a name="t3"></a>第四步、生成root密码并打印密码（在/usr/local/mysql 目录下执行）</h3>

<p><span style="color:#f33b45;">首先 cd 进入解压缩的文件夹内</span></p>

```sql
cd /usr/local/mysql
```

<p>然后执行初始化mysql的密码========&gt;注意这里会获得root密码</p>

```sql
sudo ./bin/mysqld --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data --initialize
```

<p>&nbsp;<img alt="" class="has" height="162" src="https://img-blog.csdnimg.cn/20191101020326603.png" width="816"></p>

<p>启动mysql服务</p>

```sql
sudo ./support-files/mysql.server start
```

<p>登录mysql服务器修改root密码</p>

```sql
sudo ./bin/mysql -u root -p
```

>此处可能会提示**ERROR 2002** (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (13)
，执行下sudo ln -s /tmp/mysql.sock /var/lib/mysql/mysql.sock就可以了（注意权限问题，如果没/var/lib/mysql/的权限也会报错）

<p>将上面获得的密码通过右键粘贴进去登录到mysql</p>

<p>修改root密码</p>

```sql
alter user 'root'@'localhost' identified by '123456';
```

<blockquote>
<p>&nbsp;下面的两条命令是让navicat等客户端连接mysql的建议执行一下</p>

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456'  PASSWORD EXPIRE NEVER;
```

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
```

</blockquote>

<p>&nbsp;后序操作，配置环境变了 和 开机自启服务</p>

<h3>第五步、配置环境变量，让mysql可以在任何位置下都可以直接执行</h3>

```sql
sudo vim /etc/profile
```

<h3><a name="t5"></a><a name="t5"></a>&nbsp;将下面的代码添加到文件末尾</h3>

```bash
#MYSQL_HOME
export MYSQL_HOME=/usr/local/mysql
export PATH=$PATH:$MYSQL_HOME/bin
```

<p>一定要记得刷新配置然后环境变量生效</p>

```sql
source /etc/profile
```

<p>&nbsp;</p>

<hr><h3><a name="t6"></a><a name="t6"></a>第六步、开机自启服务</h3>

<p>将mysql的默认脚本复制到/etc/init.d&nbsp; 取名叫mysqld就可以全局通过service mysqld start手动启动</p>

```sql
sudo cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
```

<p>执行service mysqld start相当于手动开启mysql，将他添加到开机自启服务中</p>

<p>下面是让开机时自动执行这条命令</p>

```sql
sudo vim /etc/rc.local
```

<p>添加内容</p>

```bash
#!/bin/bash
# rc.local config file created by use
 
service mysqld start
 
exit 0
```

<p>给予执行权限</p>

```sql
sudo chmod +x /etc/rc.local
```

<p>然后重启即可！deepin官网有解释：<a href="https://wiki.deepin.org/wiki/%E8%87%AA%E5%90%AF%E5%8A%A8%E7%A8%8B%E5%BA%8F" rel="nofollow">deepin自启动程序</a></p>

<p>&nbsp;</p>

<h3><a name="t7"></a><a name="t7"></a>&nbsp;常见错误解决方式：</h3>

<p>如果是初始化遇到了问题，你可以删除对应数据（/usr/local/mysql/data）在初始化的时候指定的，</p>

<p>如果没有指定可以删除mysql整个文件夹，然后重新安装</p>

<p>先删除对应文件夹</p>

<p>（mysql要先关闭）</p>

```sql
/usr/local/mysql/bin/mysqld stop
```

<p>删除数据，然后重新初始化root用户和密码&nbsp;</p>

```sql
sudo rm -rf /usr/local/mysql/data
```

<p>紧接着，从博客上面的第二步重复执行命令即可，不要跳过命令！要一条一条执行，创建过mysql用户的哪天命令第二次可以不用执行了，因为前面已经创建过了，会提示用户已存在。</p>
</blockquote>

<p>另外赠送navicat12的包，压缩包目录里有我写好的txt文件。直接解压缩就能使用 免激活。官网的最新版在deepin上运行会报错，建立连接&nbsp;</p>

<p>链接: <a href="https://pan.baidu.com/s/18NecXedG3SuRCZqJCO0B1g" rel="nofollow">https://pan.baidu.com/s/18NecXedG3SuRCZqJCO0B1g</a> 提取码: w8x5</p>


