# Ubuntu 上安装

## 步骤

### Install .NET Core

- [Install .NET Core SDK on Linux Ubuntu 18.04 - x64 | .NET](https://dotnet.microsoft.com/download/linux-package-manager/ubuntu18-04/sdk-current)

```shell

```

#### 1. Register Microsoft key and feed

```shell
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
```

#### 2. Install the .NET SDK

- Update the products available for installation, then install the .NET SDK.
- In your terminal, run the following commands:

```shell
sudo add-apt-repository universe
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.2
```
