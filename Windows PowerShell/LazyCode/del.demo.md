# del demo

```c#
$TargetDir="D:\Work\Demo\bin";
$name=$TargetDir+"\Oracle.ManagedDataAccess.dll";
DEL $name;

$TargetDir="D:\Work\Demo\bin";$name=$TargetDir+"\Oracle.ManagedDataAccess.dll";del $name;


if (System.IO.File.Exists(@"D:\1.txt") == false) { }
```
