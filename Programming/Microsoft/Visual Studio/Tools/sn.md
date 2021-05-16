# sn

- [Three ways to tell if a .NET Assembly (DLL) has Strong Name](https://blog.codingoutloud.com/2010/03/13/three-ways-to-tell-whether-an-assembly-dl-is-strong-named/)

## 百科

```C#
where sn
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\sn.exe
C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7.2 Tools\sn.exe

// SignTool.exe
where SignTool.exe
C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86\signtool.exe
```

### 文档说明

```C#
Microsoft(R) .NET Framework 强名称实用工具 版本 4.0.30319.0
版权所有(C) Microsoft Corporation。保留所有权利。

未能删除容器“VS_KEY_4A96F3DCF9AF7A9C”-- 未找到强名称密钥容器。

D:\Tmp>sn -?

Microsoft(R) .NET Framework 强名称实用工具 版本 4.0.30319.0
版权所有(C) Microsoft Corporation。保留所有权利。

用法: sn [-q|-quiet] <option> [<parameters>]
 选项:
  -a identityPublicKeyFile identityKeyPairFile signaturePublicKeyFile
    生成 AssemblySignatureKeyAttribute 数据以将标识密钥从文件迁移到签名密钥。
  -ac identityPublicKeyFile identityKeyPairContainer signaturePublicKeyFile
    生成 AssemblySignatureKeyAttribute 数据以将标识密钥从密钥容器迁移到签名密钥。
  -c [<csp> [<provtype>] ]
    设置/重置用于 MSCORSN 操作的 CSP 的名称。
  -d <container>
    删除名为 <container> 的密钥容器。
  -dg <assembly> <digest file> [-rehash]
    计算程序集的摘要，生成一个摘要文件，签名来自于
    -ds 或 -dsc 命令。
    如果已指定 -rehash，则将在计算摘要前重新对模块进行哈希处理
  -ds <digest file> <keyfile> [-ecma]
    使用完整密钥对通过 -dg 命令对摘要文件签名
    从给定的密钥文件。
    如果使用了 -ecma，则将密钥文件视为 ECMA 签名的真正密钥。
  -dsc <digest file> <container> [-ecma]
    对由 -dg 命令生成的摘要文件签名，所使用的密钥位于
    指定的密钥容器。
    如果使用了 -ecma，则将容器视为 ECMA 签名的真正密钥。
  -di <digest file> <assembly>
    从由 -ds 或 -dsc 签名的摘要文件插入该签名
    到程序集的命令。
  -dh <digest file> <hash file>
    从摘要文件中提取 base64 编码哈希值
  -du <signature file> <digest file>
    使用 base64 编码签名更新摘要文件中的签名
    在签名文件中。警告：使用该操作可能导致摘要
    包含其相关程序集无效签名的文件。
  -dd <digest file>
    将摘要文件转储到控制台
  -D <assembly1> <assembly2>
    验证 <assembly1> 和 <assembly2> 的差别是否仅在于签名。
  -e <assembly> <outfile>
    将 <assembly> 中的公钥提取到 <outfile> 中。
  -i <infile> <container>
    将密钥对从 <infile> 安装到名为 <container> 的密钥容器中。
  -k [<keysize>] <outfile>
    生成指定大小的新密钥对并将其写入 <outfile>。
  -m [y|n]
    启用(y)、禁用(n)或检查(不带参数)密钥容器是否
    是计算机特定的(而不是用户特定的)。
  -o <infile> [<outfile>]
    将 <infile> 中的公钥转换成包含十进制字节值的逗号分隔列表
    的文本文件 <outfile>。
    如果省略 <outfile>，则文本改为复制到剪贴板。
  -p <infile> <outfile> [<hashalg>]
    从 <infile> 中的密钥对提取公钥并导出到 <outfile>，
    嵌入指定的哈希算法(sha1|sha256|sha384|sha512)。
  -pc <container> <outfile> [<hashalg>]
    从 <container> 中的密钥对提取公钥并导出到 <outfile>，
    嵌入指定的哈希算法(sha1|sha256|sha384|sha512)。
  -Pb [y|n]
    启用(y)、禁用(n)或检查(无参数)允许受信任的应用程序
    跳过对其程序集的强名称签名验证的 CLR
    策略。
  -q
    安静模式。此选项必须位于命令行的开头，它将取消显示
    除错误消息外的任何其他输出。
  -R[a] <assembly> <infile> [-ecma]
    用 <infile> 中的密钥对重新签署已签名或部分签名的程序集。
    如果使用了 -Ra，则重新计算程序集中所有文件的哈希值。
    如果使用了 -ecma，则将输入文件视为 ECMA 签名的真正密钥。
  -Rc[a] <assembly> <container> [-ecma]
    用名为 <container> 的密钥容器中的密钥对
重新签署已签名或部分签名的程序集。
    如果使用了 -Rca，则重新计算程序集中所有文件的哈希值。
    如果使用了 -ecma，则将容器视为 ECMA 签名的真正密钥。
  -Rh <assembly>
    重新计算程序集中所有文件的哈希值。
  -t[p] <infile>
    显示 <infile> 中的公钥的标记(如果使用了 -tp，则还同时显示公钥
本身)。
  -T[p] <assembly>
    显示 <assembly> 的公钥的标记(如果使用了 -Tp，
则还同时显示公钥本身)。
  -TS <assembly> <infile>
    使用 <infile> 中的密钥对，对已签名或部分签名的
    程序集进行测试签名。
  -TSc <assembly> <container>
    使用密钥容器 <container> 中的密钥对，对已签名或部分签名的
    程序集进行测试签名。
  -v[f] <assembly> [{-ecmakey <keyfile> | -ecmacontainer <container>}]
    验证 <assembly> 的强名称签名的自我一致性，如果指定了 -vf，
    则即使在注册表中禁用了验证，也强制验证。
    如果指定了 -ecmakey，则将密钥文件视为真正的 ECMA 密钥。
    如果指定了 -ecmacontainer，则将容器视为真正的 ECMA 密钥。
  -Vk <regfile> <assembly> [<userlist>] [<testkey>]
    在 <regfile> 中生成注册表脚本以将 <assembly> 注册为
    验证跳过(使用一个可选的逗号分隔的用户名列表
    和一个 <testkey> 中的可选测试公钥，此注册操作将作用于
    该列表中的用户)。<assembly> 可以指定为 * 以指示所有程序集，也可以指定为
    *,<public key token> 以指示带有给定公钥标记的
    所有程序集。公钥标记应指定为一个十六进制数的字符串。
  -Vl
    列出此计算机上的强名称验证的当前设置。
  -Vr <assembly> [<userlist>] [<infile>]
    将 <assembly> 注册为验证跳过(使用一个可选的、
    逗号分隔的用户名列表和一个
 <infile> 中的可选测试公钥，此注册操作将作用于该列表中的用户)。
 <assembly>    可以指定为 * 以指示所有程序集，也可以指定为 *,<公钥标记>
    以指示带有给定公钥标记的所有程序集。公钥
    标记应指定为一个十六进制数的字符串。
  -Vu <assembly>
    为 <assembly> 注销验证跳过。遵循与 -Vr 相同的 <assembly>
    命名规则。
  -Vx
    移除所有验证跳过项。
  -?
  -h
    显示此帮助文本。
```
