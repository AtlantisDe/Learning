# ScanEnterFile

- [CSDN 博客](https://blog.csdn.net/kfarvid/article/details/7280515)

## C#的代码

```C#
/// <summary>
        /// 扫描文本文件，进行行数的统计，并返回每一行的开始指针数组(1.2KW数据速度比使用数组的快10秒)
        /// </summary>
        /// <param name="fileName">文件名</param>
        /// <param name="rowCount">行数</param>
        /// <param name="rowLeast">一行最小长度</param>
        /// <param name="incCount">递增索引数组数量</param>
        /// <param name="initCount">首次初始化行索引数量</param>
        /// <returns>索引列表</returns>
        public static IList<long> ScanEnterFile(string fileName, out int rowCount, int rowLeast,ThreadProgress progress)
        {
            rowCount = 0;
            if (string.IsNullOrEmpty(fileName))
                return null;
            if (!System.IO.File.Exists(fileName))
                return null;
            FileStream myFile = new FileStream(fileName, FileMode.Open, FileAccess.Read, FileShare.Read, 8);//把文件读入流
            IList<long> rList=new List<long>();
            int enterCount = 0;//回车数量
            int checkValue;
            int addStep;
            myFile.Position = rowLeast;
            checkValue = myFile.ReadByte();
            while (checkValue != -1)
            {
                //Application.DoEvents();
                addStep = -1;
                //由于文件ReadByte之后，其当前位置已经往后推移了移位。
                //因此，如果是回车的第一个字符，则要推移一位。
                //而如果是回车的第二个字符，则不用推移一位
                if (checkValue == 13)
                    addStep = 1;
                else if (checkValue == 10)
                    addStep = 0;
                if (addStep >= 0)
                {
                    enterCount++;
                    rList.Add(myFile.Position + addStep);
                    myFile.Seek(rowLeast + addStep, SeekOrigin.Current);
                    progress(enterCount);
                }
                else myFile.Seek(2, SeekOrigin.Current);
                checkValue = myFile.ReadByte();
            }
            rowCount = enterCount + 1;
            return rList;
        }
```
