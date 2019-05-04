# C# TcpClient

- [使用TcpClient的例程 - legion - 博客园](https://www.cnblogs.com/legion/p/9100347.html)

## 代码

```c#
 using (TcpClient tcpClient = new TcpClient())
            {
                try
                {
                    tcpClient.Connect("43.227.183.70", 2866);
                    tcpClient.Close();
                }
                catch (Exception Ex)
                {
                    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, Ex.Message));

                }
            }


```