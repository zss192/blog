---
tags: []
categories:
  - CTF-杂项
date: 2020-02-27 14:45:00
cover: /img/post/8.jpg
---

---

# 前言
有时CTF杂项给一张png图片,linux下打不开（白屏），Windows下可查看图片，就可能是宽高被修改
# 解析IHDR
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200227210108183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
# 例题
选自2020安恒月赛
下载压缩包解压出一张PNG图片，linux下打不开，如图所示
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200227210335803.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)
猜测是对其高或宽进行了更改，需要进行CRC爆破以获得原来的宽和高，修改回去就行了。
# 脚本

```python
import zlib
import struct

filename = 'test.png'
with open(filename, 'rb') as f:
    all_b = f.read()
    crc32key = int(all_b[29:33].hex(),16)
    data = bytearray(all_b[12:29])
    n = 4095            #理论上0xffffffff,但考虑到屏幕实际/cpu，0x0fff就差不多了
    for w in range(n):          #高和宽一起爆破
        width = bytearray(struct.pack('>i', w))     #q为8字节，i为4字节，h为2字节
        for h in range(n):
            height = bytearray(struct.pack('>i', h))
            for x in range(4):
                data[x+4] = width[x]
                data[x+8] = height[x]
            crc32result = zlib.crc32(data)
            if crc32result == crc32key:
                print("宽为：",end="")
                print(width)
                print("高为：",end="")
                print(height)
                exit(0)
```
根据结果发现高被改了
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200227210714199.png)
修改回去即可
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020022721073323.png)
图片正常显示，得到flag
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200227210815855.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pzczE5Mg==,size_16,color_FFFFFF,t_70)





