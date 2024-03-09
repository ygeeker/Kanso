---
title: 数学笔记3：关于微分方程，你需要知道的一切
date: 2024-03-08T13:20:00.000Z
summary: 本文面向为微分方程头痛的大学本科生，或者有兴趣想自学的任何人士。
---


本文面向为微分方程头痛的大学本科生，或者有兴趣想自学的任何人士。

微分方程是一种数学方程，用于描述某个函数的导数与该函数和其他变量之间的关系。

## 微分方程的分类

要掌握微分方程的计算，首先要学会**对微分方程分类**，才能选择正确的方法计算。

高等数学中不涉及偏微分方程以及高阶常微分方程，故不在本文讨论范围内。常微分方程大致可分为四类：
- **形式**：可写为 $$ N(y)dy=M(x)dx $$ 的形式，其中 $$ N(y) $$ 和 *M*(*x*) 是 *y* 和 *x* 的函数。
- **特征**：方程两边可以被重新排列，使得所有含 *y* 的项在一边，所有含 *x* 的项在另一边。
- 形式：$$ y^{\prime}+ P(x)y=0 $$
- **形式**：$$ y^{\prime\prime}+py^{\prime}+qy=0 $$。
- **特征**：方程线性且没有常数项（即“非齐次”项）。方程中的 $$ y $$ 及其导数的系数仅是 *x* 的函数。
- **形式**：$$ y^{\prime\prime}+py^{\prime}+qy=Q(x) $$
- **特征**：除了线性特征外，还包含一个不等于零的非齐次项 *Q*(*x*)
- **形式**：*d**y*/*d**x*+*P*(*x*)*y*=*Q*(*x*)*y**n*，其中 *n* 不等于 0 或 1。
- **特征**：这是一个非线性方程。它的特点是包含 y^n 的项，其中 *n* 是实数。

## 求解方法

将所有y的项移到方程的一边，所有$$ x $$的项移到另一边，接着对两边积分即可。

直接记住通解公式即可：

$$
y = Ce^{-\int P(x)\mathrm{d}x}
$$

直接记住通解公式即可：

$$
y = Ce^{-\int P(x)\mathrm{d}x} + e^{-\int P(x)\mathrm{d}x}\int Q(x)e^{\int P(x) \mathrm{d}x}\mathrm{d}x
$$

记忆技巧：齐次形式的通解 + 特解。而$$ e^{-\int P(x) \mathrm{d}x} $$是积分因子。

对于这种方程，有两种求解方法。

我们以这个方程为例来讲解：

$$
y^{\prime\prime} - 4y^{\prime}  + 13y = 0
$$

其中一种是特征方程法。该方法的步骤如下：

1. 写出特征方程：$$ r^2 - 4r + 13 = 0 $$
2. 解特征方程：按照二元一次方程的思路来计算即可

1. 写出通解：

  1. 若特征方程有两个根，则通解 $$ y = C_1e^{r_1x} + C_2e^{r_2x} $$
  2. 若特征方程的根是重根（$$ r_1 = r_2 $$），则通解为$$ e^{rx}(C_1+C_2x) $$
  3. 若特征方程的根是共轭复数，则通解为$$ e^{ax}(C_1cos(bx) + C_2sin(bx)) $$

你可能会疑惑，什么是**共轭复数**？其实就是指特征方程的判别式$$ \Delta < 0 $$ 的情况。一般情况下我们会声称这个方程没有解，因为根号下不能为负数。

此时若把根号下取绝对值，再在开根号的结果后加上复数$$ i $$，我们仍然可以得到两个根。例如，对于特征方程：

$$
r^2 + 4r + 13 = 0
$$

利用公式法计算出其根为：

$$
\frac{-4 + \sqrt{16 - 62}}{2}
$$

此时根号下为-36，我们可以得出共轭复数为：

$$
r_1 = \frac{-4+6i}{2} = -2 + 3i\\\\ r_2 = \frac{-4-6i}{2} = -2 - 3i
$$

其中$$ a=-2, b=3 $$。

所以该方程的通解为：

$$
y = e^{-2x}(C_1sin(3x)+C_2cos(3x))
$$

对于这种方程，首先要将$$ Q(x) $$假设为0来计算通解$$ y_h $$

接着，我们要找到特解$$ y_p $$。

根据 $$ Q(x) $$ 的形式来设一个待定特解。例如，考虑这个方程：

$$
y^{\prime\prime} - 3y^{\prime}  + 2 = e^x
$$

设待定解为$$ y = Axe^x $$，将其带入原方程：

$$
(Axe^x)^{\prime\prime} - 3(Axe^x)^{\prime}  + 2 = e^x
$$

整理得：

$$
(2Ae^x + Axe^x) + 3(Ae^x + Axe^x) +2 = e^x
$$

解得：

$$
A = -1
$$

接着将待定解代入原方程，非齐次微分方程的解即为齐次微分方程通解+非齐次微分方程特解：

$$
y = y_{h} + y_{p}
$$

故原方程的通解为：

$$
y = C_1e^x + C_2e^{2x} - e^x
$$

对于待定特解的确定，常见的有这两种：
- $$ cos(wt) $$ 或者 $$ sin(wt) $$：$$ acos(wt) + bsin(wt) $$
- $$ e^{at} $$：$$ Be^{at} $$

已知函数 f(x) 是微分方程 $$ y^{\prime\prime} - 2y^{\prime} + 5y = 4e^x $$的解，且$$ f(0) = -2 $$, $$ f^{\prime}(0) = -2 $$。求$$ f(x) $$

## 总结

微分方程求解的难点在于通解公式的记忆，总体不难。

