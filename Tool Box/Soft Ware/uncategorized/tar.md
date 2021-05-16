# tar

- [linux 下压缩解压缩命令 - 下夕阳 - 博客园](https://www.cnblogs.com/yuandonghua/p/10254288.html)

## 常用

```c#

压缩
tar –cvf jpg.tar *.jpg //将目录里所有jpg文件打包成tar.jpg

tar –czf jpg.tar.gz *.jpg   //将目录里所有jpg文件打包成jpg.tar后，并且将其用gzip压缩，生成一  个gzip压缩过的包，命名为jpg.tar.gz

tar –cjf jpg.tar.bz2 *.jpg //将目录里所有jpg文件打包成jpg.tar后，并且将其用bzip2压缩，生成一个bzip2压缩过的包，命名为jpg.tar.bz2

tar –cZf jpg.tar.Z *.jpg   //将目录里所有jpg文件打包成jpg.tar后，并且将其用compress压缩，生成一个umcompress压缩过的包，命名为jpg.tar.Z

rar a jpg.rar *.jpg //rar格式的压缩，需要先下载rar for linux

zip jpg.zip *.jpg //zip格式的压缩，需要先下载zip for linux

解压
tar –xvf file.tar //解压 tar包

tar -xzvf file.tar.gz //解压tar.gz

tar -xjvf file.tar.bz2   //解压 tar.bz2

tar –xZvf file.tar.Z   //解压tar.Z

unrar e file.rar //解压rar

unzip file.zip //解压zip

总结
  (1)、*.tar 用 tar –xvf 解压
  (2)、*.gz 用 gzip -d或者gunzip 解压
  (3)、*.tar.gz和*.tgz 用 tar –xzf 解压
  (4)、*.bz2 用 bzip2 -d或者用bunzip2 解压
  (5)、*.tar.bz2用tar –xjf 解压
  (6)、*.Z 用 uncompress 解压
  (7)、*.tar.Z 用tar –xZf 解压
  (8)、*.rar 用 unrar e解压
  (9)、*.zip 用 unzip 解压


// 使用tar解压指定文件 假设我们想要解开/root/etc.tar.gz压缩文件文件中的etc/shadow文件，命令如下：
// 查看所需解压的文件存不存在
tar -ztvf /root/etc.tar.gz | grep 'shadow' ;
// 然后：
tar -zxvf /root/etc.tar.gz etc/shadow

// 使用tar解压到指定文件夹
tar -zxvf /root/etc.tar.gz -C /etc/shadow

```
