#Deleting Sites and app pools in IIS 7 with PowerShell
$appCmd = "C:\windows\system32\inetsrv\appcmd.exe"

#lists all the sites
& $appcmd list site 
#deletes a specific site
& $appcmd delete site "Name of site"
#deletes a specific application pool
& $appcmd delete apppool "Name of app pool"
#delete any app pools that use a certain username (in the identity column of the GUI)
$account = "TheDomain\TheAccount"
$AppPools = & $appcmd list apppool /processModel.userName:$account
foreach ($pool in $AppPools) {
    $pool = $pool.split(" ")[1] #get the name only
    & $appcmd delete apppool $pool
}
#delete all app pools that use a certain username except for a given app pool name
$account = "TheDomain\TheAccount"
$AppPools = & $appcmd list apppool /processModel.userName:$account
foreach ($pool in $AppPools) {
    $pool = $pool.split(" ")[1] #get the name only
    if ($pool -ne "MyAppPool") {
        & $appcmd delete apppool $pool
    }
}