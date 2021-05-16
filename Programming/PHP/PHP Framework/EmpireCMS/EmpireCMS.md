# EmpireCMS

- [帝国 CMS － 稳定可靠、安全省心](http://www.phome.net/)
- [帝国 CMS](http://bbs.phome.net/index/)

```c#

```

## 0. Installation

- [帝国网站管理系统(EmpireCMS)－编辑手册](http://www.phome.net/doc/manual/editor/)

```c#
演示数据库:EmpireCMS_Demo
```

### 1. TAGS | 专题 等 | 设置教程

- [帝国 CMS 管理 TAGS 设置教程 | 开拓族](http://www.phome.net/doc/manual/editor/)

```c#
// 编辑文章时候,提示在编辑文章--->选项设置里
// 默认标签 和 专题 可以预先配置

```

### 2. 模板

- [帝国 CMS 资源中心 - 模板中心](http://www.phome.net/zy/template/)

```c#

```

## 2. 开发

- [帝国网站管理系统(EmpireCMS)使用教程手册](http://www.phome.net/doc/manual/)
- [帝国网站管理系统(EmpireCMS)－美工手册](http://www.phome.net/doc/manual/template/)

```c#

```

### 0. 自动生成标签工具

```c#

```

### 1. 日期格式

```c#
// 日期字母小写：y

<?=date('y-m-d',$bqr[newstime])?>===>18-11-24

// 日期字母大写：Y

<?=date('Y-m-d',$bqr[newstime])?>===>2018-11-24


<table width="100%" border="0" cellspacing="1" cellpadding="3">
[e:loop={34,3,0,0}]
<tr> 
<td width="82%" height="23">·<a href="<?=$bqsr[titleurl]?>" target="_blank"><?=esub($bqr[title],36)?></a></td>
<td width="18%"><div align="right">[<?=date('m-d',$bqr[newstime])?>]</div></td>
</tr>
[/e:loop]
</table>
```

### 2. 调用栏目名称 | 链接

```c#
// 帝国cms在任意位置调用指定id的栏目名称和链接

// 1、调用栏目名称：

<?=$class_r[栏目ID]['classname']?>
<?=$class_r[1]['classname']?>

// 2、调用栏目链接：
<?=$class_r[栏目ID]['classpath']?>
<?=$class_r[1]['classpath']?>/

// 特别说明：因为调用的时候，后台会没有“/”


// 3、调用指定id的栏目别名：
<?=$class_r[栏目ID]['bname']?>

```

### 3. 灵动标签调用 TAG 的方法

```c#
// 【帝国CMS】灵动标签调用TAG的方法

[e:loop={0,10,3,1,'','newstime DESC'}]
<?php
$newbook1=$empire->query("select * from phome_ecms_news_data_1 where id =".$bqr[id]."");
$r1=$empire->fetch($newbook1);
$a="$r1[infotags]";
$str=str_replace('，', ',', $a);
$tag='';
$t= explode(",", $str);
for($i=0;$i<count($t);$i++)
{
if($t[$i])
{
  $tagslink="http://www.a.com/e/tags/?tagname=".urlencode($t[$i])."";
  $tag.="<a href='$tagslink' target='_blank'>".$t[$i]."</a> ";
}
}
echo $tag;
?>
[/e:loop]
```

### 4. 帝国 CMS 使用灵动标签调用 tags 名称和链接

- [帝国 CMS 使用灵动标签调用 tags 名称和链接 | 张语个人博客](http://www.zhangganghai.cn/diguocms/452.html)

```c#
[e:loop={"select * from [!db.pre!]enewstags order by num desc limit 10",0,24,0}]
<li><a href="<?=$public_r[newsurl]?>e/tags/?tagid=<?=$bqr['tagid']?>" target="_blank"><?=$bqr['tagname']?></a></li>
[/e:loop]
```
