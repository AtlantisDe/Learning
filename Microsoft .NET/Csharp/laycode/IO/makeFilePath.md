# makeFilePath

## 算法备注

### 0. 数量 18432 算法

```c#
int dir1 = hashcode & 1999;
int dir2 = md5.Substring(0, 2).GetHashCode() & 500;
int dir3 = md5.Substring(md5.Length - 2, 2).GetHashCode() & 500;
```

### 0. 数量 999,500 算法

```c#
int dir1 = hashcode & 1999;
int dir2 = md5.Substring(0, 10).GetHashCode() & 666;
```

### 1. 数量 2048 算法

```c#
int dir1 = hashcode & 666;
int dir2 = (hashcode & 888) >> 4; ;
int dir3 = hashcode & 1999;
```

### 2. 数量 原始 算法

```c#
int dir1 = hashcode & 0xf;  //0--15
int dir2 = (hashcode & 0xf0) >> 4;  //0-15
```

### 算法代码 Demo

```c#
        //使用Hash算法，根据文件名算出文件存放路径
        public static Path.Entity.pathItem makeFilePath(string Hashstr, string baseDirsavePath, bool autoCreateFolder = false, string extName = ".html")
        {
            var root = new Path.Entity.pathItem();

            try
            {
                //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
                var md5 = Hashstr.ToLower().Md5();
                int hashcode = md5.GetHashCode();


                int dir1 = hashcode & 666;
                int dir2 = (hashcode & 888) >> 4; ;
                int dir3 = hashcode & 1999;

                //构造新的保存目录
                var dir = baseDirsavePath + "\\" + dir1 + "\\" + dir2 + "\\" + dir3;

                if (autoCreateFolder == true)
                {
                    if (false == System.IO.Directory.Exists(dir))
                    {
                        System.IO.Directory.CreateDirectory(dir);
                    }
                }

                var name = md5 + extName;
                root.dir = dir;
                root.filepath = dir + "\\" + name;
            }
            catch (Exception)
            {
            }
            return root;
        }

```

### 算法代码 Demo makeFilePath_999500

```c#
public static Path.Entity.pathItem makeFilePath_999500(string Hashstr, string baseDirsavePath, bool autoCreateFolder = false, string extName = ".html")
{
    var root = new Path.Entity.pathItem();
    try
    {
        var md5 = Hashstr.ToLower().Md5();
        int hashcode = md5.GetHashCode();

        int dir1 = hashcode & 1999;
        int dir2 = md5.Substring(0, 10).GetHashCode() & 666;

        var dir = baseDirsavePath + "\\" + dir1 + "\\" + dir2;
        if (autoCreateFolder == true)
        {
            if (false == System.IO.Directory.Exists(dir))
            {
                System.IO.Directory.CreateDirectory(dir);
            }
        }
        var name = md5 + extName;
        root.dir = dir;
        root.filepath = dir + "\\" + name;
    }
    catch (Exception)
    {
    }
    return root;
}



```
