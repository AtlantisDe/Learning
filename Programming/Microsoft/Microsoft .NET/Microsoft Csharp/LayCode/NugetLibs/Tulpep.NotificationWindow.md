# Notification-Popup-Window (Tulpep.NotificationWindow)

## 安装

- [Tulpep.NotificationWindow 1.1.37](https://www.nuget.org/packages/Tulpep.NotificationWindow/)

```c#
Install-Package Tulpep.NotificationWindow -Version 1.1.37

```

## 常用

```c#
var popupNotifier = new Tulpep.NotificationWindow.PopupNotifier();
popupNotifier.TitleText = "Title of popup";
popupNotifier.ContentText  = "Content text";
popupNotifier.IsRightToLeft = false;
popupNotifier.Popup();
```
