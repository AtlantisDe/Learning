# vgdisplay

- [vgdisplay and lvdisplay No volume groups found](https://superuser.com/questions/421896/vgdisplay-and-lvdisplay-no-volume-groups-found)

```c#
// 经常，新用户会被逻辑卷迷惑，即使它们已经正确设置，逻辑卷也不会显示。如果您是这种情况，您是否尝试了以下方法？

pvscan
// 这将扫描物理卷。它应该显示/dev/sdb5您之前是否已将其设置为LVM物理卷。

vgscan
// 查找现有的卷组。如果之前已正确设置，则应显示您的卷组。

vgchange -a y
// 激活所有可用的卷组（将其“活动”状态更改为“是”）。现在，您的逻辑卷应显示为/dev/mapper/和/dev/VGNAME/LVNAME。
```
