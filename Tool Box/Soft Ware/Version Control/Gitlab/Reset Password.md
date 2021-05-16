# Reset Password

- [如何重置 gitlab 用户密码](https://champyin.com/2018/07/15/%E5%A6%82%E4%BD%95%E9%87%8D%E7%BD%AEgitlab%E7%94%A8%E6%88%B7%E5%AF%86%E7%A0%81/)

## 常用

```c#
gitlab-rails console production

// 方法一，使用id：

irb(main):001:0> user = User.where(id:[user's register index]).first
// 方法二，使用邮箱：

irb(main):001:0> user = User.where(email:[user's register email]).first
// 方法三，使用用户名：

irb(main):001:0> user = User.where(name:[user's register name]).first

// 我这次使用的是邮箱
irb(main):001:0> user=User.where(email:xxx@163.com).first

gitlab-rails console production

user = User.where(id:[user's register index]).first
user = User.where(id:1).first

user = User.where(name:[user's register name]).first
user = User.where(name:root).first


user.password = 'newpassword'
user.password_confirmation = 'newpassword'
user.save!

```
