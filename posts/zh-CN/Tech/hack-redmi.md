---
title: 红米6(cereus)救砖 + 刷第三方ROM教程
cover: https://i.loli.net/2021/11/28/I7SbfaXY4TF6Adl.png
date: 23/04/11
---

<hr />
> 本文最初由 Charles_Su0923 发表于酷安，有改动。
- 设备：红米 6
- TL;TD：10 月份把手头 Redmi6 从只会震动黑砖里救出来，到 11 月初尝试了两个周末的刷机，终于在 11 月 27 日成功的把 LineageOS 17 刷入。

重要！！：国内的大部分教程都没有提到，由于 MTK 特殊的硬件加密，故直接刷入 REC 会导致手机无法引导 REC，解决方案是下面这个文件。

## 总览

Step1：把手机降级回 MIUI 10.4.4（酷安上有太多太多教程，但是不要贪心，只能降到 MIUI 10.4.4）

Step2：用下面提到的 rec 刷入工具刷入（秋之盒这种不行，只能用这个工具！！！）

Step3：导入你要刷的包和这个 DDE（这一步非常重要！！！！）

Step4：格式化 data 并且刷入系统，不出意外地话就会开机

## 救砖

大概是从去年的 8 月份，在尝试刷机，但是不料，意外成砖，学业繁重，于是就把他搁置在那了，中间尝试过鸟一鸟他，比如用 Mi flash 救一下这种，还是没有办法，放了一直到大概今年的 10 月，突然的时候发现了 MTK 的救砖工具。

其过程大概就是，先装驱动，由于 MTK 奇妙的特性（搞过 MTK 的都知道，救砖需要在短短的几秒内，从一闪而过的端口里找到他，然后再快速的点安装驱动，详细教程酷安上有），所以光驱动就安装了大概 20 多分钟，因为放久了，没怎么充电，所以还冲了很久的电，用 MTK 工具救砖也是一样的恼火。

由于小米引入了一个 auth 校验工具，所以，我们还需要用一个绕过工具去绕过，这个过程，亦是痛苦且难整的，所有的工具都是在海外源，所以还需要等着龟速下载。正式开始刷入的时候，并非完全用的是 MTK 的工具，在尝试完 MTk 工具后，手机意外地进入了 FB，于是当机立断，马上用米 flash 刷到 MIUI。

## PART2 | Escape

回到 MIUI 的第一件事情，就是刷第三方 rec，这本是平常不过的操作，但由于 MTK 的特殊性，在刷入 REC 的时候必须禁用 DM 加密，在刷完包之后，也必须再禁用一次，在尝试的过程中，并没有注意到，还有 DM 加密这类东西，于是我直接就用秋之盒工具箱进行刷入操作，我把所有我能找到的 twrp 的 rec 全部试了一遍，国内外的教程也都看了个遍，红米 6 和 6A 的 rec 都刷了遍，电脑上前前后后下了大概 20 多个 recBut，秋之盒的刷入方式是 fastboot flash recovery.img 而针对于 MTK 机型（尤其是红米 6），我们都要加上 fastboot --disable-verity --disable-verification 这类指令，发现这个的时候，最开始的尝试已经过了一年的多时间。

## PART3 | Resurrection

在成功刷入 rec 之后，我迫不及待的刷入 LineageOS 17，在之前的尝试中，我成功的刷入过红米 6a 的 rec，But，如果用红米 6a 的 rec 刷 rom 是刷不进去的，此时离我们最初的起点已经过了一个月了。

结果发现可以进入开机动画，但是卡住不动了。于是重启，重来。

已经准备放弃了，后来不死心，在 Telegram 的(Redmi6 社群)[https://t.me/redmi6official]里，找到一个 rec 刷入工具和一个 DM 解除硬加密的工具，发现这就是想要的东西，于是我马上下载了并且成功了！

## Part4 | Adjust

这个部分很简单，调度 magisk+LSP 简直不能太简单。

## PART5 | End？

这是玩了 10 年刷机，老机油的坚持，虽然随着时代的前进，系统日渐完善，曾经比较火热的刷机平台停服刷机，也渐渐地淡出舞台。

但为什么，还是有人坚持还是有人愿意为手机适配刷机包，就像周杰伦无法从我们的记忆中抹去一样，我们念物，其实念的是物背后的情感。初恋为什么忘不了，就是因为她是努力后才得到的。

感谢机主的坚持和不懈，也感谢做出这个刷 rec 的作者 @MegaFon929!

		