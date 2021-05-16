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



$sk = [System.Web.Security.Membership]::GeneratePassword(8, 1)
$sk = [Microsoft.VisualBasic.Interaction]::InputBox("Config:[sk]", "common.sk", $sk)
$sk

$Visitor_bind_port = "6389"
$Visitor_bind_port

$nlocal_ip = [Microsoft.VisualBasic.Interaction]::InputBox("Config:[local_ip]", "common.local_ip", "192.168.1.158")
$nlocal_ip


# 服务端:
$SeverClient = "C:\Tools\frp\frps.exe --bind_port $bind_port --bind_udp_port $bind_udp_port"
$SeverClient

# 内网端

$ClientClient = "C:\Tools\frp\frpc.exe xtcp --server_addr ""${server_addr}:$bind_port"" --proxy_name ""P2P_MSTSC"" --sk ""$sk"" --local_ip ""$nlocal_ip"" --local_port 3389"
$ClientClient

# 使用端
$VisitorClient = "C:\Tools\frp\frpc.exe xtcp --server_addr ""${server_addr}:$bind_port"" --proxy_name ""P2P_MSTSC_Visitor"" --role ""visitor"" --server_name ""P2P_MSTSC"" --sk ""password"" --bind_addr ""127.0.0.1"" --bind_port $Visitor_bind_port"
$VisitorClient


pause
