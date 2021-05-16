# SoundPlayer

- [SoundPlayer Class (System.Media)](https://docs.microsoft.com/en-us/dotnet/api/system.media.soundplayer?view=dotnet-plat-ext-3.1)

## 常用

```c#
System.Media.SoundPlayer SimpleSound;
SimpleSound = new System.Media.SoundPlayer(@"c:\Windows\Media\chimes.wav");


var simpleSound = new System.Media.SoundPlayer(@"c:\Windows\Media\chimes.wav");
simpleSound.Play();

SoundPlayer simpleSound = new SoundPlayer(@"c:\Windows\Media\chimes.wav");
simpleSound.Play();

using (var simpleSound = new System.Media.SoundPlayer(@"D:\Sounds\1.wav"))
{
    simpleSound.Play();
}
```

## 其它相关项目

```c#
Xam.Plugin.SimpleAudioPlayer
```

## 音频转换软件

```c#
Switch Sound File Converter
```
