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

一般版本，

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
|-------------|-----------|------------|--------------|
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
|-------------|-----------|------------|--------------|
| present     | 1         | n          | n/2          |
| not present | 1         | n          | n/2          |

---

## 树

---

## 图

---