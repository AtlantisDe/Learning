# free

## 关于资源调用与释放

- [C# 调用 C++的 DLL 后释放内存？-CSDN 论坛](https://bbs.csdn.net/topics/370107479)
- [关于 c#动态调用非托管 DLL 的内存释放问题-CSDN 论坛](https://bbs.csdn.net/topics/390674645)

```c#
1、C语言：malloc 、free
2、C++：new、delete
3、COM：CoTaskMenAlloc、CoTaskMenFree

// 第三种方式是互操作默认的释放非托管内存的方法！也就是说，采用前两种方式分配的非托管内存，托管代码不能正确释放，必须由非托管方自己明确释放：
// C++:
wchar_t* GetStringNew()
{
int iBufferSize = 128;
wchar_t* pBuffer = new wchar_t[iBufferSize ];
if(NULL != pBuffer)
{
wcscpy_s(pBuffer, iBufferSize/sizeof(wchar_t), L"String from New");
}
return pBuffer;
}

void FreeNewMemory(void* pBuffer)
{
printf("\n%d", pBuffer);
if(NULL != pBuffer)
{
delete pBuffer;
pBuffer = NULL;
}
}

// C#:
[DllImport("NativeLib.dll",
            CallingConvention = CallingConvention.Cdecl,
            CharSet = CharSet.Unicode )]
   static extern string GetStringNew();
 [DllImport("NativeLib.dll",
            CallingConvention = CallingConvention.Cdecl,
            CharSet = CharSet.Unicode            )]
  static extern void FreeNewMemory(IntPtr pbuffer);

IntPtr strPtr=GetStringNew();
string str=Marshal.PtrToStringUni(strPtr);
FreeNewMemory(strPtr);   //显示调用非托管释放内存函数释放内存，否则内存会泄露
```
