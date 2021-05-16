'Script Power By chenxdb 
Set objWMIService = GetObject("winmgmts:\\Localhost\root\MicrosoftIISv2") 
Set colItems = objWMIService.ExecQuery("SELECT * FROM IIsWebInfo", "WQL", 48) 
version ="" 
For Each objItem In colItems 
version = "您电脑上安装的IIS的版本号是:" & objItem.MajorIIsVersionNumber & "." & objItem.MinorIIsVersionNumber 
Next 

msgbox version