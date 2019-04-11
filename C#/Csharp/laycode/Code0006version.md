# C#文件版本信息

## 相关代码

```c#
 void GetVersionInfo()
            {

                var path = System.Windows.Forms.Application.ExecutablePath;
                System.Diagnostics.FileVersionInfo info = System.Diagnostics.FileVersionInfo.GetVersionInfo(path);
                System.IO.FileInfo fileInfo = new System.IO.FileInfo(path);
                this.Text = string.Format("V{0} Release", info.FileVersion);
#if DEBUG

                this.Text = string.Format("V{0} Debug", info.FileVersion);
#endif


            }
```
