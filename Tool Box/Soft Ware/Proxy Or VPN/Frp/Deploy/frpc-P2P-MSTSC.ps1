[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding(65001)
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
 

Add-Type -AssemblyName System.Web

# return

$path_P2PMSTSC = "C:\Tools\frp\Mstsc\P2P"; 
 
if (!(Test-Path -Path $path_P2PMSTSC )) {
    New-Item -ItemType "directory" -Path "$path_P2PMSTSC" 
}
else {
 
}

$bind_port = [Microsoft.VisualBasic.Interaction]::InputBox("Config:[bind_port]", "common.bind_port", "7389")
$bind_udp_port = [Microsoft.VisualBasic.Interaction]::InputBox("Config:[bind_udp_port]", "common.bind_udp_port", "7001")

$bind_port
$bind_udp_port

$body = Invoke-WebRequest -Uri "http://pv.sohu.com/cityjson?ie=utf-8"
$str = $null
$server_addr = $null
if ($body.StatusCode -eq 200) {
    [string]$str = $body.ParsedHtml.body.innerHTML
    
    $str = $str.Replace(' ', '')
    $str = $str.Replace('"', '') 
    $StartIndex = $str.IndexOf(":")
    $EndIndex = $str.IndexOf(",")
    $length = $EndIndex - $StartIndex - 1
    $ip = $str.Substring($StartIndex + 1, $length)
    $server_addr = $ip
    
    
}
else {
    Write-Warning "Bad Request"
}

$server_addr = [Microsoft.VisualBasic.Interaction]::InputBox("Config:[server_addr]", "common.server_addr", $server_addr)
$server_addr
 
Set-Content -Path $path_P2PMSTSC"\frps-P2P-MSTSC-Sever.ini" -Value "[common]`r`nbind_port = $bind_port`r`nbind_udp_port = $bind_udp_port"
Set-Content -Path $path_P2PMSTSC"\frps-P2P-MSTSC-Sever.bat" -Value "@echo off`r`nC:\Tools\frp\frps.exe -c C:\Tools\frp\Mstsc\P2P\frps-P2P-MSTSC-Sever.ini"

$P2P_MSTSC_Visitor_bind_port = "6389"


$sk = [System.Web.Security.Membership]::GeneratePassword(8, 1)
$sk = [Microsoft.VisualBasic.Interaction]::InputBox("Config:[sk]", "common.sk", $sk)
$sk

Set-Content -Path $path_P2PMSTSC"\frpc-P2P-MSTSC-Visitor.ini" -Value "[common]`r`nserver_addr = $server_addr`r`nserver_port = $bind_port`r`n`r`n`r`n[P2P_MSTSC_Visitor]`r`ntype = xtcp`r`nrole = visitor`r`nserver_name = P2P_MSTSC`r`nsk = $sk`r`nbind_addr = 127.0.0.1`r`nbind_port = $P2P_MSTSC_Visitor_bind_port"
Set-Content -Path $path_P2PMSTSC"\frpc-P2P-MSTSC-Visitor.bat" -Value "@echo off`r`nC:\Tools\frp\frpc.exe -c C:\Tools\frp\Mstsc\P2P\frpc-P2P-MSTSC-Visitor.ini"

$nlocal_ip = [Microsoft.VisualBasic.Interaction]::InputBox("Config:[server_addr]", "common.server_addr", "192.168.1.158")
$nlocal_ip

Set-Content -Path $path_P2PMSTSC"\frpc-P2P-MSTSC-Client.ini" -Value "[common]`r`nserver_addr = $server_addr`r`nserver_port = $bind_port`r`n`r`n`r`n[P2P_MSTSC]`r`ntype = xtcp`r`nsk = $sk`r`nlocal_ip = $nlocal_ip`r`nlocal_port = 3389"
Set-Content -Path $path_P2PMSTSC"\frpc-P2P-MSTSC-Client.bat" -Value "@echo off`r`nC:\Tools\frp\frpc.exe -c C:\Tools\frp\Mstsc\P2P\frpc-P2P-MSTSC-Client.ini"

