# 数算期末复习

## 概述

---

## 算法分析

---

## 基本数据结构

---

## 排序与搜索

### 查找

本节示例均返回目标是否在表中，可扩展返回目标下标等功能

#### 顺序查找

一般版本：

```python
def sequentialSearch(alist, item):
    pos = 0
    found = False

    while pos < len(alist) and not found:
        if alist[pos] == item:
            found = True
        else:
            pos = pos + 1

    return found
```

算法复杂度 O(n)，详表如下

| Cases       | Best Case | Worst Case | Average Case |
| ----------- | --------- | ---------- | ------------ |
| present     | 1         | n          | n/2          |
| not present | n         | n          | n            |

针对有序表，优化搜索终止机制：

```python
def sequentialSearch(alist, item):
    pos = 0
    found = False
    stop = False
    while pos < len(alist) and not found and not stop:
        if alist[pos] == item:
            found = True
        else:
            if alist[pos] > item:
                stop = True
            else:
                pos = pos + 1

    return found
```

算法复杂度仍为 O(n)，详表如下

| Cases       | Best Case | Worst Case | Average Case |
| ----------- | --------- | ---------- | ------------ |
| present     | 1         | n          | n/2          |
| not present | 1         | n          | n/2          |

#### 二分查找

二分查找采用了**分而治之**的策略

普通实现：

```python
def binarySearch(alist, item):
    first = 0
    last = len(alist) - 1
    found = False
    
    while first <= last and not found:
        midpoint = (first + last) // 2
        if alist[midpoint] == item:
            found = True
        else:
            if item < alist[midpoint]:
                last = midpoint - 1
            else:
                first = midpoint + 1
    
    return found
```

递归实现：

```python
def binarySearch(alist, item):
    if len(alist) == 0:
        return False
    else:
        midpoint = len(alist) // 2
        if alist[midpoint] == item:
            return True
        else:
            if item < alist[midpoint]:
                return binarySearch(alist[:midpoint], item)
            else:
                return binarySearch(alist[midpoint+1:], item)
```

> 注意在递归实现中使用了列表切片  ``binarySearch(alist[:midpont], item)``，切片操作复杂度为 $O(k)$

二分查找每次对比都将下一步的比对范围缩小一半，当比对次数足够多之后，比对范围将仅剩1个数据项。算法复杂度为 $O(\log n)$：

$$
\frac{n}{2^i} = 1 \Rightarrow i = \log_2{n}
$$

### 散列

最简单的散列函数：求余数 ``h(item) = item % 散列表大小``

散列函数通常都会包含求余以确保返回槽号在散列表大小范围之内

#### 散列表的储存

为数据项计算出槽号后存入相应槽中

#### 负载因子

散列表中槽被数据项占据的比例

#### 散列表的查找

计算目标数据的槽号，查看槽号是否为我们要找的数据

**查找算法时间复杂度：$O(1)$**

> 代价是存入时的时间复杂度 $\uparrow$，即散列函数的时间复杂度，以及散列表整体的空间复杂度

#### 完美散列函数

指可以将每一个数据项映射到不同的槽中

##### 扩大散列表容量

空间浪费：保存100个手机号（11位数字）却需要百亿槽

#### 好的散列函数

三个特性：冲突最少（近似完美）、计算难度低（额外开销小）、充分分散数据项（节约空间）

#### 完美散列函数更多用途

数据指纹

> 由任意长度数据生成有唯一性的长度固定的指纹在数学上是无法做到的，但设计巧妙的“准完美”散列函数可以在实用范围内做到
>
> 真随机的重要

##### 指纹函数

- 压缩性：任意长度数据得到固定长度指纹
- 易计算性：

#### Python的散列函数库 hashlib

```python
import hashlib
hashlib.md5(b"hello world!").hexdigest()
```

``md5``, ``sha1``, ``sha224``, ``sha256``, ``sha384``, ``sha512``

#### 冲突解决方案

##### 开放定址-线性探测

开放定址：为冲突的数据项再找一个开放的空槽；线性探测：从冲突的槽开始往后扫描直到找到一个空槽（到散列表尾部还未找到则从首部继续扫描）

查找：在散列位置没有找到目标则向后做顺序查找直到找到目标或碰到空槽（查找失败）

缺点：聚集趋势，同一个槽冲突的数据项较多的话数据项会在槽附近聚集，影响其他数据插入；逐个探测改为跳跃探测（e.g. +3）避免聚集

##### 再散列

``newhashvalue = rehash(oldhashvalue)``

- 线性探测：``rehash(pos) = (pos + 1) % sizeoftable``
- 跳跃式探测：``rehash(pos) = (pos + skip) % sizeoftable``
- 二次(quadratic, not re)探测：逐步增加skip的值

> 跳跃式须注意skip取值不能被散列表大小整除，否则会造成很多空槽永远无法被探测到
>
> 将散列表大小设为素数避免上述问题

##### 数据项链

每个冲突槽储存多个数据项（列表/链表）

### ADT Map

- **键-值关联**的无序集合
- 关键码唯一
- ADT Map 的操作：
  - ``Map()``：创建空映射，返回空映射对象
  - ``put(key, val)``：将 key-val 关联加入映射，如 key 已存在，将 val 替换旧值
  - ``get(key)``：返回 key 关联的值，不存在则返回 ``None``
  - ``del``：``del map(key)`` 以删除 key-val 关联
  - ``len()``：返回 key-val 关联数目
  - ``in``：``key in map`` 返回 key 是否在映射中

用散列表实现 ADT Map：

```python
class HashTable:
    def __init__(self, size=11):
        self.size = size
        self.slots = [None] * self.size
        self.data = [None] * self.size
    
    def hashfunction(self, key):
        return key % self.size

    def rehash(self, oldhash):
        return (oldhash + 1) % self.size
    
    def put(self, key, data):
        hashvalue = self.hashfunction(key)
        if self.slots[hashvalue] == None:
            self.slots[hashvalue] = key
            self.data[hashvalue] = data
        else:
            if self.slots[hashvalue] == key:
                self.data[hashvalue] = data #overwrite
            else:
                nextslot = self.rehash(hashvalue)
                while self.slots[nextslot] != None and self.slots[nextslot] != key:
                    nextslot = self.rehash(nextslot)
                if self.slots[nextslot] == None:
                    self.slots[nextslot] = key
                    self.data[nextslot] = data
                else:
                    self.data[nextslot] = data #overwrite
    
    def get(self, key):
        startslot = self.hashfunction(key)
        data = None
        stop = False
        found = False
        pos = startslot
        while self.slots[pos] != None and not found and not stop:
            if self.slots[pos] == key:
                found = True
                data = self.data[pos]
            else:
                pos = self.rehash(pos)
                if pos == startslot:
                    stop = True
        return data

    def __getitem__(self, key):
        return self.get(key)
    
    def __setitem__(self, key, data):
        self.put(key, data)
```

散列在最好情况可以提供 $O(1)$ 常数级时间复杂度的查找性能，但由于冲突的存在，查找比较次数可能更多

评估散列冲突的最重要信息：**负载因子 $\lambda$**，一般来说：

- $\lambda$ 较小，散列冲突几率就小，数据项通常会保存在其所属的散列槽中
- $\lambda$ 较大，散列表填充较满，冲突会越来越多，冲突解决也更复杂，需要更多比较来找到空槽；如果采用数据链则每条链上数据更多

### 排序

#### 冒泡排序

对无序表进行多躺比较交换，每趟包括多次两两相邻的比较，并将逆序的数据项交换位置，最终将本趟的最大项就位

```python
def bubbleSort(alist):
    for passnum in range(len(alist) - 1, 0, -1):
        for i in range(passnum):
            if alist[i] > alist[i + 1]:
                temp = alist[i]
                alist[i] = alist[i + 1]
                alist[i + 1] = temp
```

算法过程总共需要 n-1 趟，随着趟数增加，比对次数从 n-1 减少至 1 次，并包括可能发生的数据项交换

比对次数是 1 ~ n-1 的累加：$\frac{n(n-1)}{2}$，时间复杂度为 $O(n^2)$

交换次数时间复杂度也为 $O(n^2)$

| Cases    | Best Case | Worst Case         | Average Case                      |
| -------- | --------- | ------------------ | --------------------------------- |
| 交换次数 | 0         | $\frac{n(n-1)}{2}$ | $\frac{\text{Worst Case}}{2}$: $\frac{n(n-1)}{4}$ |

时间效率较差、无需任何额外储存空间开销

改进结束检测的冒泡排序：

```python
def shortBubbleSort(alist):
    exchange = True
    passnum = len(alist) - 1
    while passnum > 0 and exchange:
        exchange = False
        for i in range(passnum):
            if alist[i] > alist[i+1]:
                exchange = True
                temp = alist[i]
                alist[i] = alist[i + 1]
                alist[i + 1] = temp
        passnum -= 1
```

#### 选择排序

冒泡排序的改进，保留了多躺比对思路，每趟使当前最大项就位；但对交换次数进行了削减，每趟仅进行一次交换：将本趟最大项和本趟最后项交换

```python
def selectionSort(alist):
    for fillslot in range(ken(alist)-1, 0, -1):
        maxPos = 0
        for location in range(1, fillslot + 1):
            if alist[location] > alist[maxPos]:
                maxPos = location
        temp = alist[fillslot]
        alist[fillslot] = alist[maxPos]
        alist[maxPos] = temp
```

时间复杂度比冒泡排序稍优：

- 对比次数不变，仍为 $O(n^2)$
- 交换次数减少为 $O(n)$

#### 插入排序

```python
def insertionSort(alist):
    for index in range(1, len(alist)):
        currValue = alist[index]
        pos = index
        while pos > 0 and alist[pos - 1] > currValue:
            alist[pos] = alist[pos - 1]
            pos -= 1
        alist[pos] = currValue
```

时间复杂度：

- 最差情况：每趟都与子列表中所有项比对，总比对次数与冒泡排序相同，$O(n^2$
- 最好情况：列表已经排好序，每趟仅需一次对比，$O(n)$

由于移动操作仅包含一次赋值，是交换操作的1/3，所以插入排序比上两个排序稍好一点

改进：对已排好部分用二分查找插入位置？链表实现？

#### 谢尔排序

**列表越接近有序，插入排序的比对次数就越少**
以此入手，谢尔排序以插入排序为基础，对无序表进行间隔划分子列表，每个子列表都执行插入排序。随着子列表数量减少，无序表整体越来越接近有序，从而减少整体排序的比对次数

子列表间隔一般从 $\frac{n}{2}$ 开始，每趟倍增：$\frac{n}{4}$,$\frac{n}{8}$, ...，直到 1，最后一趟是标准插入排序，但由于前面几趟已经将列表处理到接近有序，最后一趟仅需几次移动即可完成

```python
def gapInsertionSort(alist, start, gap):
    for i in range(start + gap, len(alist), gap):
        currVal = alist[i]
        pos = i
        while pos >= gap and alist[pos - gap] > currVal:
            alist[pos] = alist[pos - gap]
            pos -= gap
        alist[pos] = currVal

def shellSort(alist):
    sublistCount = len(alist) // 2
    while sublistCount > 0:
        for startpos in range(sublistCount):
            gapInsertionSort(alist, startpos, sublistCount)
        sublistCount //= 2
```

谢尔排序时间复杂度分析较复杂，大致介于 $O(n)$ 和 $O(n^2)$ 之间，如果将间隔保持在 $2^k - 1$ (1, 3, 5, 7, 15, 31, ...)，谢尔排序时间复杂度约为 $O(n^\frac{3}{2})$

#### 归并排序

```python
def mergeSort(alist):
    if len(alist) > 1:
        mid = len(alist) // 2
        lefthalf = alist[:mid]
        righthalf = alist[mid:]
        mergeSort(lefthalf)
        mergeSort(righthalf)
        i = j = k = 0
        while i < len(lefthalf) and j < len(righthalf):
            if lefthalf[i] < righthalf[j]:
                alist[k] = lefthalf[i]
                i += 1
            else:
                alist[k] = righthalf[j]
                j += 1
            k += 1
        while i < len(lefthalf):
            alist[k] = lefthalf[i]
            i += 1
            k += 1
        while j < len(righthalf):
            alist[k] = righthalf[j]
            j += 1
            k += 1
```

将归并排序分为两个过程来分析：分裂和归并

- 分裂过程借鉴二分查找中的分析结果，分裂的层数为 $O(\log n)$
- 归并过程相对于每一层的分裂，其所有数据项都会被比较和放置一次，所以是线性复杂度 $O(n)$
- 总和考虑，每层分裂 ($O(\log n$) 都进行了一次 $O(n)$ 的归并，所以总的时间复杂度是 $O(n\log n)$

注意两个切片操作会对时间复杂性有一定影响

归并排序使用了额外一倍的储存空间用于归并，对于特大数据集进行排序时要考虑到这个问题

#### 快速排序

```python
def quickSort(alist):
    quickSortHelper(alist, 0, len(alist)-1)

def quickSortHelper(alist, first, last):
    if first < last:
        splitpoint = partition(alist, first, last)
        quickSortHelper(alist, first, splitpoint-1)
        quickSortHelper(alist, splitpoint+1, last)

def partition(alist, first, last):
    pivotvalue = alist[first]
    leftmark = first+1
    rightmark = last
    done = False
    while not done:
        while leftmark <= rightmark and alist[leftmark] <= pivotvalue:
            leftmark += 1
        while rightmark >= leftmark and alist[rightmark] >= pivotvalue:
            rightmark -= 1
        if rightmark < leftmark:
            done = True
        else:
            temp = alist[leftmark]
            alist[leftmark] = alist[rightmark]
            alist[rightmark] = alist[temp]
    temp = alist[first]
    alist[first] = alist[rightmark]
    alist[rightmark] = temp

    return rightmark
```

快速排序也分两部分：分裂和移动

- 如果分裂总能将数据表分为两等分，那么就是 $O(\log n)$ 的复杂度
- 移动需要将每项都与中值进行比对，$O(n)$
- 综合：$O(n\log n)$
- 并且不需要额外储存空间

但在不好的情况：中值分裂点过于偏离中部，左右两部分数量不平衡。比如极端情况：有一部分始终没有数据，时间复杂度退化到 $O(n^2)$，比如有序表

#### 分配排序

针对排序码可以分解成若干（d）部分的问题的排序算法，通过对各个部分分别排序最终实现对整个排序码的排序；不需要进行比较

##### 桶式排序

分配排序的简化版本（d=1），也可以看成分配排序的其中一步

事先知道序列中的记录key值都在某个小区间段 [0,m) 内，创建 m 个桶，将具有相同key值的记录都分配到一个桶中，然后依次按照编号从桶中取出记录，组成一个有序表

时间复杂度 $O(n+m)$（n为数组长度，m为区间大小）
适用于m相对n很小的情况

空间代价：m个计数器，长度为n的临时数组 $O(n+m)$

排序稳定：在排序码相等的情况下保持输入的序

##### 基数排序

桶排只适合m很小的情况，否则空间开销太大

基数排序将排序码进一步拆分成多个（d）部分（子排序码）进行比较

###### 高位优先法 Most Significant Digit first

先处理高位子排序码并放入桶中，再在每个桶里处理次高位子排序码分成更小桶，依次重复直到对最小子排序码操作完，最后将所有桶中数据依次连接在依次形成有序表

###### 低位优先法 Least SD first

从最低位子排序码开始排序，对于排好的序列再用次低位子排序码排序，依次重复直到对最高位子排序码排好序后，整个序列为有序的

反复调用桶排，较简单，计算机常用

时间复杂度：桶排的d倍 $O(d*(n+m))$
空间复杂度：等于桶排 $O(n+m)$
当 d,m << n 时可以认为是 $O(n)$，但应用场景有限

#### 内排序和外排序

内排序：排序期间所有数据全部存放在内存的排序

- 效率以比较次数衡量
- 上述排序算法都可以进行内排序

外排序：全部对象太多不能同时存放在内存中，必须根据排序过程的要求不断在内、外存之间移动

- 分块排序，块分的足够小便可将块放入内存中完成单个块的排序
- 块与块之间不能保证有序，通过多路归并的办法对有序的块进行合并
- 外存的特点：顺序读写，所以效率与读写次数相关

---

## 树

非线性数据结构

三个部分：根、枝、叶

### 术语和定义

#### 节点 Node

每个节点有**键值**，并可视应用而保存不同的额外**数据项**

#### 边 Edge

每条边恰好连接两个节点，表示节点之间具有关联

边具有出入方向：

- 每个节点（除根节点）恰有一条来自另一节点的入边
- 每个节点可以有0/1/n条连到其他节点的出边
  > 如果限制每个节点只能有一条出边，则树结构特殊化为线性表

#### 根

树中唯一一个没有入边的节点

#### 路径 Path

由边依次连接在一起的节点的有序列表

#### 子节点 Children

#### 父节点 Parent

#### 兄弟节点 Sibling

#### 子树 Subtree

#### 叶节点

没有子节点的节点

#### 层级 Level

从根节点开始到达一个节点的路径其中包含的边数量称为这个节点的层级

#### 高度 Height

树中所有节点的最大层级

### 二叉树 Binary Tree

**每个节点有且仅有两个子节点**

> 下文默认树为二叉树

#### 嵌套列表法二叉树实现

- 列表有**三个元素**：1. 根节点的值；2. 左子树（列表）；3. 右子树（列表）
- 递归结构，子树与父树结构相同
- 容易扩展成多叉树，仅需增加列表元素

```python
def BinaryTree(r, left=[], right=[])
    return [r, left, right]

def insertLeft(root, newBranch):
    root[1] = BinaryTree(newBranch, left=getLeftChild(root))
    return root

def insertRight(root, newBranch):
    root[2] = BinaryTree(newBranch, right=getRightChild(root))
    return root

def getRootVal(root):
    return root[0]

def setRootVal(root, newVal):
    root[0] = newVal

def getLeftChild(root):
    return root[1]

def getRightChild(root):
    return root[2]
```

#### 节点链接法二叉树实现

类似链表的结构

```python
class BinaryTree:
    def __init__(self, rootObj):
        self.key = rootObj
        self.leftChild = None
        self.rightChild = None

    def insertLeft(self, newNode):
        self.leftChild = BinaryTree(newNode, left = self.leftChild)

    def insertRight(self, newNode):
        self.rightChild = BinaryTree(newNode, right = self.rightChild)

    def getLeftChild(self):
        return self.leftChild

    def getRightChild(self):
        return self.rightChild

    def getRootVal(self):
        return self.key
```

### 二叉树遍历

三种遍历操作：

- 前序遍历 (preorder)：先访问根节点，再递归地前序访问左子树，最后前序访问右子树
- 中序遍历  (inorder)：先递归地中序访问左子树，再访问根节点，最后中序访问右子树
- 后序遍历(postorder)：先递归地后序访问左子树，再后序访问右子树，最后访问根节点

递归树实现：

```python
def preorder(tree):
    if tree:
        print(tree.getRootVal())
        preorder(tree.getLeftChild())
        preorder(tree.getRightChild())

def inorder(tree):
    if tree != None:
        inorder(tree.getLeftChild())
        print(tree.getRootVal())
        inorder(tree.getRightChild())

def postorder(tree):
    if tree != None:
        postorder(tree.getLeftChild())
        postorder(tree.getRightChild())
        print(tree.getRootVal())
```

链接树实现：

```python
def preorder(self):
    print(self.key)
    if self.leftChild:
        self.leftChild.preorder()
    if self.rightChild:
        self.rightChild.preorder()
```

### 树的应用

#### 解析树

##### 语法树

##### 表达式树

- 叶节点保存操作数，内部节点保存操作符
- 越底层的表达式，优先级越高
- 每个子树都表示一个子表达式
  - 将子树替换为子表达式值的节点即可以实现求值

求值：后序遍历
生成全括号中缀表达式：中序遍历

#### 哈夫曼树

### 二叉堆

堆：堆中任何一个节点的父节点的key一定小于等于其自身的key
> 任意一条路径均是有序的
> 
> 符合堆性质的二叉树，根节点最小

最小key排在队首的称为**最小堆 min heap**，最大key排在队首的称为**最大堆 max heap**

``ADT BinaryHeap``:

- ``BinaryHeap()``：创建一个空的二叉堆对象
- ``insert(k)``：将新key加入到堆中
- ``findMin()``：返回堆中最小项，最小项仍保留在堆中
- ``delMin()``：返回堆中最小项，同时从堆中删除
- ``isEmpty()``：返回堆是否为空
- ``size()``：返回堆中key个数
- ``buildHeap(list)``：从一个key列表新建堆

#### 完全二叉树

二叉树的**平衡**：树根左右子树拥有相同数量的节点

**完全二叉树**结构近似平衡，指每个内部节点都有两个子节点，最多可有一个节点例外

由于完全二叉树的特殊性，可以用非嵌套列表实现：

- 如果节点在列表中的下标为 p，那么其左子节点下标为 2p，右子节点下标为 2p+1
- 如果节点在列表下标为 n，那么其父节点下标为 n//2



---

## 图

---
