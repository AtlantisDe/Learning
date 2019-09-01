# SSH

## 1. 检查本地是否有 SSH Key 存在

```shell
ls -al ~/.ssh
# 如果终端输出的是：No such file or directory
# 那么就说明本地没有SSH key 如果已存在SSH key那么就会显示 id_rsa 和 id_rsa.pub文件的存在以及它的创建日期。
```

## 2. 生成新的 SSH key

- [如何生成 SSH key 及查看 SSH key](http://www.cnblogs.com/zheng577564429/p/8317524.html)
- [查看本机 git ssh key 公匙](https://blog.csdn.net/zhu119064177/article/details/80466550)
- [用 Git Gui 生成 SSH Key - bobby_fu 的博客 - CSDN 博客](https://blog.csdn.net/bobby_fu/article/details/78794626)

```c#
PS C:\WINDOWS\system32> ssh-keygen -?
unknown option -- ?
usage: ssh-keygen [-q] [-b bits] [-t dsa | ecdsa | ed25519 | rsa]
                  [-N new_passphrase] [-C comment] [-f output_keyfile]
       ssh-keygen -p [-P old_passphrase] [-N new_passphrase] [-f keyfile]
       ssh-keygen -i [-m key_format] [-f input_keyfile]
       ssh-keygen -e [-m key_format] [-f input_keyfile]
       ssh-keygen -y [-f input_keyfile]
       ssh-keygen -c [-P passphrase] [-C comment] [-f keyfile]
       ssh-keygen -l [-v] [-E fingerprint_hash] [-f input_keyfile]
       ssh-keygen -B [-f input_keyfile]
       ssh-keygen -F hostname [-f known_hosts_file] [-l]
       ssh-keygen -H [-f known_hosts_file]
       ssh-keygen -R hostname [-f known_hosts_file]
       ssh-keygen -r hostname [-f input_keyfile] [-g]
       ssh-keygen -G output_file [-v] [-b bits] [-M memory] [-S start_point]
       ssh-keygen -T output_file -f input_file [-v] [-a rounds] [-J num_lines]
                  [-j start_line] [-K checkpt] [-W generator]
       ssh-keygen -s ca_key -I certificate_identity [-h] [-U]
                  [-D pkcs11_provider] [-n principals] [-O option]
                  [-V validity_interval] [-z serial_number] file ...
       ssh-keygen -L [-f input_keyfile]
       ssh-keygen -A
       ssh-keygen -k -f krl_file [-u] [-s ca_public] [-z version_number]
                  file ...
       ssh-keygen -Q -f krl_file file ...
```

## 3. 生成步骤

### 1. 命令

```shell
ssh-keygen -t rsa -C "your_email@example.com"
ssh-keygen -t rsa -C "admin@example.com"
ssh-keygen -t rsa -C "developer@example.com"

# 第一个回车：Enter file in which to save the key </c/Users/JIYI/.ssh/id_rsa>
# 此处的回车代表将密钥默认存储在C盘/Users/用户名/.ssh的文件夹下

# 第二个回车与第三个回车：

Enter passphrase<empty for no passphrase>:
Enter same passphrase again:
# 这个是为了设置提交项目的密码，为了避免其他人用你的电脑修改你的项目时提交的，通常直接回车，就代表不需要密码，我也建议这样做，可以避免多次输入密码，省时省力。

```

### 2. 多个 KEY 与 Config 配置

#### 1. 添加 ssh key

- PS 命令执行

```c#
// 1. 建立文件夹
// dev code 弃用 obsolete
// mkdir $Env:USERPROFILE\.ssh\GitHub;
// mkdir $Env:USERPROFILE\.ssh\GitLab;
// mkdir $Env:USERPROFILE\.ssh\GitDeveloper;

$shh_folder=$Env:USERPROFILE+"\.ssh\";

// run code 弃用 obsolete
// mkdir $Env:USERPROFILE\.ssh\GitHub;mkdir $Env:USERPROFILE\.ssh\GitLab;mkdir $Env:USERPROFILE\.ssh\GitDeveloper;$shh_folder=$Env:USERPROFILE+"\.ssh\";

// 2. 显示文件夹路径 [可略过]
$shh_folder

// 3. 打开文件夹:便于复制文件夹路径,用于下面不同配置文件保存地址

start $shh_folder
// 注意事项
// 1.秘钥最少8位安全起见
// 2.复制路径后面跟着\对应的文件名即可如


// GitHub
ssh-keygen -t rsa -C "your_email@example.com"
// GitLab
ssh-keygen -t rsa -C "admin@example.com"
// GitDeveloper
ssh-keygen -t rsa -C "developer@example.com"
// 1. 输入自定义路径与文件名
C:\Users\Sky\.ssh\GitHub
C:\Users\Sky\.ssh\GitLab
C:\Users\Sky\.ssh\GitDeveloper

// 2. 输入密码


// 4. 删除卸载
// 一键删除所有
rm -rf $shh_folder\
```

#### 2. 创建 config 文件并配置

```shell
# github
Host github.com
    HostName github.com
    IdentityFile ~/.ssh/id_rsa
    User git

# gitlab
Host gitlab.example.com
    HostName gitlab.example.com
    IdentityFile ~/.ssh/gitlab
    User git
```

#### 3. 测试配置结果

```shell
ssh -T git@github.com
ssh -T git@git.oschina.net
ssh -T git@gitlab.example.com
```
