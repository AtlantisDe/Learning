# copy

## 常用代码

- [C#复制、粘贴文本信息到剪贴板 - loose_went - 博客园](https://www.cnblogs.com/michaelxu/archive/2008/11/04/1326184.html)

```c#
   this.Btn_loginToken_copy.Click += (sender, e) =>
            {
                try
                {
                    var btn = (Button)sender;
                    btn.Text = "正在复制";
                    CsharpLazycode.Module.Laycode.sys.WaitDelay(300, true);


                    var newpass = this.T_password.Text;
                    if (newpass.IsNullOrEmpty() == false)
                    {
                        Clipboard.SetDataObject(newpass);
                        btn.Text = "已复制";
                        CsharpLazycode.Module.Laycode.sys.WaitDelay(1200, true);
                    }
                    btn.Text = "复制密码";
                    CsharpLazycode.Module.Laycode.sys.WaitDelay(600, true);


                }
                catch (Exception ex)
                {
                    var message = string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
                    MessageBox.Show(message, "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            };

```
