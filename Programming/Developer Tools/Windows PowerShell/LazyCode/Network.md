# Network

## 常用

```c#
Get-WmiObject -ComputerName 'SeverName' -Class Win32_NetworkAdapter | Where-Object { $_.Speed -ne $null -and $_.MACAddress -ne $null } | Format-Table -Property SystemName,Name,NetConnectionID,Speed

Get-WmiObject -ComputerName 'Atlantis' -Class Win32_NetworkAdapter | Where-Object { $_.Speed -ne $null -and $_.MACAddress -ne $null } | Format-Table -Property SystemName,Name,NetConnectionID,Speed

Get-WmiObject -ComputerName 'Atlantis' -Class Win32_NetworkAdapter | Where-Object { $_.Speed -ne $null -and $_.MACAddress -ne $null } | Format-Table -Property NetConnectionID,@{Label='Speed(GB)'; Expression = {$_.Speed/1GB}}

(get-counter -list "Network Interface").paths

get-counter "\Process(chrome*)\IO Read Bytes/sec"

get-counter "\Network Interface(*)\Bytes Total/sec"

get-counter "\Network Interface(*)\Bytes Sent/sec"

get-counter "\Process(chrome*)\IO Read Bytes/sec" -Continuous | foreach {[math]::round((($_.countersamples.cookedvalue | measure -sum).sum / 1KB), 2)}

\Network Interface(*)\Bytes Total/sec
\Network Interface(*)\Packets/sec
\Network Interface(*)\Packets Received/sec
\Network Interface(*)\Packets Sent/sec
\Network Interface(*)\Current Bandwidth
\Network Interface(*)\Bytes Received/sec
\Network Interface(*)\Packets Received Unicast/sec
\Network Interface(*)\Packets Received Non-Unicast/sec
\Network Interface(*)\Packets Received Discarded
\Network Interface(*)\Packets Received Errors
\Network Interface(*)\Packets Received Unknown
\Network Interface(*)\Bytes Sent/sec
\Network Interface(*)\Packets Sent Unicast/sec
\Network Interface(*)\Packets Sent Non-Unicast/sec
\Network Interface(*)\Packets Outbound Discarded
\Network Interface(*)\Packets Outbound Errors
\Network Interface(*)\Output Queue Length
\Network Interface(*)\Offloaded Connections
\Network Interface(*)\TCP Active RSC Connections
\Network Interface(*)\TCP RSC Coalesced Packets/sec
\Network Interface(*)\TCP RSC Exceptions/sec
\Network Interface(*)\TCP RSC Average Packet Size
```
