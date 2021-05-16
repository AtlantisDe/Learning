# hxc.ChromiumWebBrowser

- [hxc.ChromiumWebBrowser 3.3440.1](https://www.nuget.org/packages/hxc.ChromiumWebBrowser#)

## Documentation

```C#
System.IO.Path.GetTempPath();

string assemblyDir = Path.GetDirectoryName(
    new Uri(System.Reflection.Assembly.GetExecutingAssembly().CodeBase).LocalPath
);

CfxRuntime.LibCefDirPath = assemblyDir;
CfxRuntime.LibCfxDirPath = CfxRuntime.LibCefDirPath;

ChromiumWebBrowser.OnBeforeCfxInitialize += (e) =>
{
    e.Settings.CachePath = Path.Combine(assemblyDir, "cache");
    e.Settings.ResourcesDirPath = Path.Combine(assemblyDir, "Resources");
    e.Settings.LocalesDirPath = Path.Combine(e.Settings.ResourcesDirPath, "locales");
};
ChromiumWebBrowser.OnBeforeCommandLineProcessing += (e) =>
{
    // add command line switch
};

ChromiumWebBrowser.Initialize();

// initialize window
Application.Run(new MainForm());

CfxRuntime.Shutdown();
```
