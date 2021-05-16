@echo off
chcp 65001
echo SSH key For Github
set /p your_email=请输入您的邮箱:
echo 即将创建文件名为:GitHub 的SSH key
echo 即将执行,输入密码即可(自定义密码,不是GitHub密码)
echo 继续请继续,否则直接关闭窗口退出!
pause
ssh-keygen -t rsa -C "%your_email%" -f "%userprofile%\.ssh\GitHub"
start %userprofile%\.ssh\
pause

echo 最后,添加config配置如下如有请追加.
echo # Github
echo Host github.com
echo     HostName github.com
echo     IdentityFile ~/.ssh/GitHub
echo     User git
pause