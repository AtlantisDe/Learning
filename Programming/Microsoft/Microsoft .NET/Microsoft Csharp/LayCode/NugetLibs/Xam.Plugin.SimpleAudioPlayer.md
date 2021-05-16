# Xam.Plugin.SimpleAudioPlayer

- [adrianstevens/Xamarin-Plugins](https://github.com/adrianstevens/Xamarin-Plugins)
- [adrianstevens/Xamarin-Plugins](https://github.com/adrianstevens/Xamarin-Plugins/tree/master/SimpleAudioPlayer)

## 安装

- [Xam.Plugin.SimpleAudioPlayer 1.4.0](https://www.nuget.org/packages/Xam.Plugin.SimpleAudioPlayer)
- [adrianstevens/Xamarin-Forms](https://github.com/adrianstevens/Xamarin-Forms/tree/master/DrumPad2)

```c#
Install-Package Xam.Plugin.SimpleAudioPlayer -Version 1.4.0
```

## 常用

```c#
Plugin.SimpleAudioPlayer.ISimpleAudioPlayer player1;
player1 = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.CreateSimpleAudioPlayer();
player1.Load(@"D:\Tmp\Sound\您有新的消息请注意查收.mp3".FileToStream());


var player1 = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.CreateSimpleAudioPlayer();
player1.Load(@"D:\Tmp\Sound\您有新的消息请注意查收.mp3".FileToStream());
player1.Play();


ISimpleAudioPlayer player = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.Current;
player.Load(GetStreamFromFile("mysound.wav"));
player.Play();
Stream GetStreamFromFile(string filename)
{
    var assembly = typeof(App).GetTypeInfo().Assembly;
    var stream = assembly.GetManifestResourceStream("YourApp." + filename);
    return stream;
}


var player1 = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.CreateSimpleAudioPlayer();
var player2 = Plugin.SimpleAudioPlayer.CrossSimpleAudioPlayer.CreateSimpleAudioPlayer();
```
