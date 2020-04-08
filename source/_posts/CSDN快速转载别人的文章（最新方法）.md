---
tags: []
categories:
  - 日常办公
date: 2020-02-04 14:45:00
cover: /img/post/10.jpg
---

---
>### 问题：
>在csdn没有一键转载功能，自己重新编写又比较麻烦。经我搜索后发现之前别人写的方法对于目前的csdn需要做些小小的改动
### 解决方法

**1**.这里以我的一篇文章为例，我们进入文章页面，然后按F12或者鼠标右键选择检查(谷歌浏览器下，其他浏览器可能是审查元素之类的)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200204211242488.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

**2**.选中下面的任意一行然后按Ctrl+F快速搜索在最下面的输入框填入==content_views==（之前别人说的方法都是选中article_content，目前来说这样会把最下面的点赞收藏也复制上）
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200204211726571.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

**3**.我们看到可以快速搜索到这个元素，选中这个元素鼠标右键选择copy下的copyHTML（其他浏览器可能是复制下的复制HTML之类的）
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020020421242856.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

**4**.这样我们就已经复制好了要转载的文章的HTML，然后我们新建一篇文章，打开markdown编辑器粘贴我们复制的内容
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200204212920729.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
我们可以看到复制的HTML元素粘贴后就是我们想要的内容

##### Tips:有时我们这样复制的文章右侧会出现部分空白的情况
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200204213314872.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
只需==把左面的 \<svg>\</svg>标签删除==，然后把紧接着的元素距左边的==空格删除==即可
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200204213711773.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)

然后我们就会看到想要转载的内容就在右面显示了。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200204214309124.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
>偷懒虽好，不要忘了发表时选择转载哦。
