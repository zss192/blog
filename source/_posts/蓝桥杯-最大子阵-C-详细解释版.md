---
title: 蓝桥杯-最大子阵(C++详细解释版)
tags:
  - 算法(C++)
categories:
  - 算法(C++)
  - ''
date: 2021-03-19 19:30:00
---
# 题目描述

给定一个n*m的矩阵A，求A中的一个非空子矩阵，使这个子矩阵中的元素和最大。

其中，A的子矩阵指在A中行和列均连续的一块。

样例说明
取最后一列，和为10。
数据规模和约定
对于100%的数据，1< =n, m< =500，A中每个元素的绝对值不超过5000。

输入

```
输入的第一行包含两个整数n, m，分别表示矩阵A的行数和列数。 
接下来n行，每行m个整数，表示矩阵A。 
```

输出

```
输出一行，包含一个整数，表示A中最大的子矩阵中的元素和。 
```

样例输入

```
3 3 
-1 -4 3
3 4 -1
-5 -2 8
```

样例输出

```
10
```

题目在这：[**题目 1445: [蓝桥杯][历届试题]最大子阵**](https://www.dotcpp.com/oj/problem1445.html)

# 题目分析

假设现在有个一维数组nums[4]={-1,2,3,-4}。

如果要求他的最大连续子序列的和，假设max_sum[i]表示以第i个元素结尾的连续子序列的最大和，可以推出max_sum[i]=max(max_sum[i-1]+nums[i],nums[i])

> 可以理解为比如max_sum[2]它的值为max(max_sum[1]+nums[2],nums[2])，因为必须包含nums[2]，所以如果max_sum[1]>0那肯定加上max_sum[1]最大，而如果max_sum[1]<0那加上他反而更小。所以取这两个的最大值

这是求一维数组的最大子序列和，而题目要求的是二维数组的最大子序列和。

如果能把题目中求二维变成求一维就好了，其实是可以的。

我们可以看下面这样一个数组，其中ai表示第i行

![image-20210318180509897](https://img-blog.csdnimg.cn/img_convert/c1e8bd87984f77d8ef38424afae4e532.png)

如果要求它的最大子阵，我们可以变成这样

![image-20210318180706949](https://img-blog.csdnimg.cn/img_convert/82605d992d320644f9befb595ac61cf7.png)

如图所示，可以用一维数组分别表示第一行、第一行加第二行、第一行加第二行加第三行....

这样求它们每个的最大子序列和，然后其中最大的数值就是题目所求

> 假设最大子矩阵是右下角那四个的和，那么等效为a2+a3的子序列最大和
>
> 假设最大子矩阵是9、2、-4、1、-1、8左下角那块，它们等效为a1+a2+a3的子序列最大和
>
> 由此我们可以看出无论最大子矩阵是在哪一块，图中红色方框中的10行一定有一行求得的最大子序列的值可以表示它们

这样的话，题目则由求二维数组最大子矩阵的和转变为求图中红色方框那10行哪一行的最大子序列的和最大。我们只要单独求出每一个的最大值，在找到它们的最大值的最大值即可。



# 代码

```cpp
#include<bits/stdc++.h>
using namespace std;

int main(){
	//定义变量，读入输入的值存入数组，没什么说的
 	int n,m;
    cin>>n>>m;
    int num[510][510];
    int dp[510];
    int temp[510];
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++){
            cin>>num[i][j];
        }
    }

    int result = num[0][0];    //先将结果其设为第一个数

	//核心代码
    for(int i=0;i<n;i++){
        memset(temp,0,sizeof(temp));	//数组清零
        for(int j=i;j<n;j++){	

			//上面两层循环可以确定从i行到j行即ai+..+aj
            for(int k=0;k<m;k++){
                temp[k] += num[j][k];	//第一次temp数组存的是a0(i=0,j=0),第二次是存的a0+a1(i=0,j=1)
            }							//因为第二次时temp[0]还存着num[0][0]呢即存着第一行的值，加上第二行即a0+a1

            memset(dp,0,sizeof(dp));

            //对当前temp一维数组求最大子序列和，第一次是求a0,第二次是求a0+a1
            dp[0] = temp[0];
            for(int u=1;u<m;u++){
                dp[u] = max(dp[u-1]+temp[u],temp[u]);	//一维数组求最大子序列和
				//如果这次求得的和大于目前最大值则更新
                if(dp[u]>result)
                    result = dp[u];
            }
        }
    }
    cout<<result<<endl;
	//  temp数组每次存的值如下
	// 	 -1 -4  3   a0
	// 	 2  0   2   a0+a1
	// 	-3  -2 10   a0+a1+a2
	//	 3  4  -1 	a1
	// 	-2  2   7 	a1+a2
	// 	-5 -2  8 	a2
	return 0;
}
```

# 参考

[蓝桥杯-最大子阵 动态规划](https://blog.csdn.net/Jaster_wisdom/article/details/79671736)

[最大子阵和](https://frostime.github.io/2019/06/02/%E6%9C%80%E5%A4%A7%E5%AD%90%E9%98%B5%E5%92%8C/)