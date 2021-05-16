# BaGet

- [loic-sharma/BaGet](https://github.com/loic-sharma/BaGet)

## Getting Started

```c#
Install .NET Core SDK
Download and extract BaGet's latest release
Start the service with dotnet BaGet.dll
Browse http://localhost:5000/ in your browser



dotnet BaGet.dll -urls "http://localhost:5000"
dotnet run BaGet.dll -urls "http://192.168.204.129:2000/"


/etc/systemd/system/


kestrel-BaGet.service

sudo systemctl daemon-reload

sudo systemctl enable kestrel-BaGet.service

sudo systemctl kestrel-BaGet.service

sudo systemctl start kestrel-BaGet.service
sudo systemctl stop kestrel-BaGet.service

sudo systemctl restart kestrel-BaGet.service

sudo systemctl status kestrel-BaGet.service

sudo journalctl -fu kestrel-BaGet.service

server {
    listen        2000;
    server_name   192.168.204.129;
    location / {
        proxy_pass         http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade $http_upgrade;
        proxy_set_header   Connection keep-alive;
        proxy_set_header   Host $host;
        proxy_cache_bypass $http_upgrade;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto $scheme;
    }
}
```

## kestrel-BaGet.service

```c#
[Unit]
Description=Example .NET Web API App running on Ubuntu

[Service]
WorkingDirectory=/www/wwwroot/BaGet.com
ExecStart=/usr/bin/dotnet /www/wwwroot/BaGet.com/BaGet.dll
Restart=always
# Restart service after 10 seconds if the dotnet service crashes:
RestartSec=10
KillSignal=SIGINT
SyslogIdentifier=dotnet-example
User=www-data
Environment=ASPNETCORE_ENVIRONMENT=Production
Environment=DOTNET_PRINT_TELEMETRY_MESSAGE=false

[Install]
WantedBy=multi-user.target
```
