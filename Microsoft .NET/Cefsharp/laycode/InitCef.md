# InitCef

```c#
        public static bool InitCef()
        {
            Cef.EnableHighDPISupport();
            CefSharpSettings.LegacyJavascriptBindingEnabled = true;
            CefSharpSettings.ShutdownOnExit = true;

            var CachePath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "CefSharp\\Cachedemo3");

            var settings = new CefSharp.WinForms.CefSettings();
            settings.CachePath = CachePath;
            settings.CefCommandLineArgs.Add("enable-media-stream", "1");
            settings.CefCommandLineArgs.Add("no-proxy-server", "1");

            settings.CefCommandLineArgs.Add("-touch-devices", "enabled");
            settings.CefCommandLineArgs.Add("-touch-events", "enabled");
            settings.CefCommandLineArgs.Add("-enable-pinch", "enabled");
            settings.CefCommandLineArgs.Add("-touchview", "enabled");
            settings.CefCommandLineArgs.Add("-touch-view", "enabled");
            settings.CefCommandLineArgs.Add("-material-hybrid", "enabled");
            settings.CefCommandLineArgs.Add("touch-devices", "enabled");
            settings.CefCommandLineArgs.Add("touch-events", "enabled");
            settings.CefCommandLineArgs.Add("enable-pinch", "enabled");
            settings.CefCommandLineArgs.Add("touchview", "enabled");
            settings.CefCommandLineArgs.Add("touch-view", "enabled");
            settings.CefCommandLineArgs.Add("material-hybrid", "enabled");

            //settings.IgnoreCertificateErrors = true;
            //settings.WindowlessRenderingEnabled = true;
            //settings.SetOffScreenRenderingBestPerformanceArgs();


            settings.UserAgent = Module.taoorder.unit.Const.UserAgent.Google_PC_7003538110;
            settings.Locale = "zh-CN";
            settings.AcceptLanguageList = "zh-CN";

            var osVersion = Environment.OSVersion;
            //Disable GPU for Windows 7
            if (osVersion.Version.Major == 6 && osVersion.Version.Minor == 1)
            {
                // Disable GPU in WPF and Offscreen examples until #1634 has been resolved6
                settings.CefCommandLineArgs.Add("disable-gpu", "1");
            }

            //var cefCustomScheme = new CefCustomScheme();
            //cefCustomScheme.IsSecure = true;
            //cefCustomScheme.SchemeName = "custom";
            //cefCustomScheme.SchemeHandlerFactory = new CefSharp.SchemeHandler.FolderSchemeHandlerFactory(rootFolder: @"\Resources",
            //                                                        schemeName: "custom",
            //                                                        hostName: "cefsharp",
            //                                                        defaultPage: "home.html");


            //settings.RegisterScheme(cefCustomScheme);

            settings.RegisterScheme(new CefSharp.CefCustomScheme
            {
                SchemeName = "custom",
                IsSecure = true,

                SchemeHandlerFactory = new Spx.Handler.CustSchemeFactory()
            });


            Cef.Initialize(settings, performDependencyCheck: true, browserProcessHandler: null);

            Console.WriteLine(string.Format("缓存目录:{0}", CachePath));

            return true;



        }
```

## 常用

### 进程残留

```c#
Thread kThread = new Thread(delegate ()
            {
                go();

                bool go()
                {
                    foreach (Process p in Process.GetProcesses())
                    {
                        if (p.ProcessName == "CefSharp.BrowserSubprocess")
                        {
                            var pp = CsharpLazycode.Module.Process.Classes.DiagnosticsProcess.GetParentProcess(p.Id);

                            if (pp != null) { Console.WriteLine(p.ProcessName + pp.ProcessName); }
                            else
                            {
                                try
                                {
                                    p.Kill(); Console.WriteLine(p.ProcessName + " 无父进程,可以结束它.");
                                }
                                catch (Exception Ex)
                                {
                                    Console.WriteLine(string.Format("异常[{0}]:{1}", System.Reflection.MethodBase.GetCurrentMethod().Name, Ex.Message));
                                }
                            }

                        }

                    }

                    return true;
                }

            });
            kThread.IsBackground = true;
            kThread.Start();
```
