---
title: STL知识点
tags:
  - 算法(C++)
categories:
  - 算法(C++)
date: 2021-03-21 11:47:00
---
# STL知识点

STL，即标准模板库或者泛型库，其包含有大量的模板类和模板函数，是 C++ 提供的一个基础模板的集合，用于完成诸如输入/输出、数学计算等功能。可以理解成动态数组

优点：举个例子，定义一个数组int a[n]，这种方法必须事先确定好长度，而如果无法事先确定长度一般都会把n设的比较大，就会造成空间的浪费。用指针则会比较麻烦，而STL可以很好地解决这个问题，而且所有容器和算法都是总结了几十年来算法和数据结构的研究成果。

## 1.vector容器

### 🧨简单用法

```cpp
	 // 创建一个向量存储 int
   vector<int> vec; 
   int i;
 
   // 显示 vec 的原始大小
   cout << "vector size = " << vec.size() << endl;  //0
 
   // 推入 5 个值到向量中
   for(i = 0; i < 5; i++){
      vec.push_back(i);
   }
 
   // 显示 vec 扩展后的大小
   cout << "extended vector size = " << vec.size() << endl;   //5
 
   // 访问向量中的 5 个值
   for(i = 0; i < 5; i++){
      cout << "value of vec [" << i << "] = " << vec[i] << endl; //0 1 2 3 4
   }
	 

```

### 🏄🏼‍♂️进阶用法

```cpp
vector<int> vec;   //[]

// 插入元素(在末尾)
vec.push_back(1);  //[1]
vec.push_back(2);  //[1,2]

// 删除元素(也是删末尾的那个)
vec.pop_back();    //[1]

// 清空vector
vec.clear();       //[]

// 使用迭代器 iterator 访问值
//注意begin指向第一个元素，而end指向的是最后一个元素的下一个位置
vector<int>::iterator v = vec.begin();
while( v != vec.end()) {    //如果等于end说明前面有效元素都访问了
		cout << "value of v = " << *v << endl;  //0 1 2 3 4
		v++;
}

//排序
sort(vec.begin(),vec.end());

// 构造函数初始化
int n=10;
vector<int> vec(n,1);  //相当于push_back了10个1
vector<int> vec(n);    //不传初始值，默认为0即10个0

// 定义二维数组
vector<vector<int> > vec2;
```

## 2.set集合（不存在重复元素）

```cpp
#include <set>

// 创建集合
set<string> country;   //{}

// 插入元素
country.insert("China");      //{"China"}
country.insert("America");    //{"China",America"}
//如果插入已经存在的元素不会产生任何效果
country.insert("China");      //{"China","America"}  

// 删除元素
country.erase("America");     //{"China"}
//如果删除的元素不存在也不会产生任何效果
country.erase("Japan");       //{"China"}

// 确定某元素是否存在
country.count("China");       //若存在返回1否则返回0

// 使用迭代器 iterator 访问值(类似于vector)
// 注意set集合会自动排序，如若先前插入了2543则会输出2345
for (set<string>::iterator it=country.begin();it!=country.end();it++)
{
      cout << *it << endl;    
}

// 清空set
set.clear();

// 也可以用来存结构体，但结构体没法判断顺序需要手动设置
struct people
{
    string name;
    int age;
    people(string _name,int _age)
    {
        name=_name;
        age=_age;
    }
    //按照年龄排序
    bool operator<(const people &rhs) const
    {
        return age < rhs.age;    //这里直接返回了，如果年龄可能相同那么要判断下如果年龄相同那就用姓名比较
    }
};
set<people> s;
s.insert(people("bob",10));s.insert(people("alice",20));s.insert(people("linda",15));
  
for (set<people>::iterator it=s.begin();it!=s.end();it++)
{
       cout << it->name <<"  "<<it->age <<endl;    
}
```

## 3.map字典映射(一对一映射)

```cpp
#include <map>

// 创建一个map
map<string,int> dict;

// 插入元素
dict["Tom"]=3;                       //dict[key]=value,这种遍历时不会排序
//这样遍历时可以通过it->first(Tom)和it->second(3)取值
dict.insert(make_pair("Tom",3));   //而且遍历时会按key(这里是string)排序  

// 取元素
dict["Tom"];

// 判断关键字是否存在
dict.count("Tom");

// 获取个数
dict.size();
```

## 例题讲解

🚩1.n块积木，编号1到n，初始时，第i块放在第i个位置。现在，进行a b操作，每次操作把b位置积木全放到a位置上。输出操作完之后每个位置上的木块。
输入:n,m。n代表有n个积木，m代表有m个操作（1≤n≤10000，1≤m≤10000）

接下来m行是m个操作。如果ab相等则本次不移动木块。

输出每个位置从下到上的积木编号，如果该位置没有积木，输出一行空行。

样例输入：

4 4

3 1

4 3

2 4

2 2

样例输出：（为了更直观此处用*表示换行，代码里是按题意）

/*
2 4 3 1*
*
*

思路：如果用数组会爆内存(n和m范围都很大而且还要移动)，所以用动态数组，而且用动态数组刚好每一个vec[i]代表一个位置如下图所示

每个位置放的积木数也可以不确定，通过vec[1][0]、vec[1][1]可以得到对应的数值

对于每一个ab操作，对vec[b]遍历将里面的积木都push到vec[a]中再清空vec[b]即可

![在这里插入图片描述](https://img-blog.csdnimg.cn/20210321120147976.png)


🦄代码如下

```cpp
#include<bits/stdc++.h>
using namespace std;

int main(){
    int n,m;    //n个积木，m个操作
    cin>>n>>m;

    vector<int> vec[10010];   //vec[i]相当于一个vector里面可以放若干整数,对应n个位置
    for (int i = 1; i <= n; i++)
    {
        vec[i].push_back(i);  //c[i]位置放编号为i的积木
    }

    // 进行a b操作
    for (int i = 1; i <= m; i++)
    {
        int a,b;
        cin>>a>>b;
        if(a==b)    //若相等不进行任何操作
            continue;
        else
        {
            for (int j = 0; j < vec[b].size(); j++)   //对于c[b]位置的积木遍历
            {
                vec[a].push_back(vec[b][j]);    //将c[b]位置的积木全部push到c[a]位置
            }
            vector<int>().swap(vec[b]);       //清空c[b]且释放内存
        }
    }

    // 输出结果
    for (int i = 1; i <= n; i++)
    {
        for (int j = 0; j < vec[i].size(); j++)
        {
            if(j!=vec[i].size()-1)
                cout<<vec[i][j]<<" ";
            else   
                cout<<vec[i][j];
        }
        cout<<endl;
    }
	return 0;
}
```