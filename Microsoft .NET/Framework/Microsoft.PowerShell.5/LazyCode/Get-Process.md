# Get-Process

## 常用

### 1. 示例

```c#
using (PowerShell ps = PowerShell.Create().AddCommand("Get-Process"))
{
    IAsyncResult async = ps.BeginInvoke();
    foreach (PSObject result in ps.EndInvoke(async))
    {
        Console.WriteLine("{0,-20}{1}",
        result.Members["ProcessName"].Value,
        result.Members["Id"].Value);
    }
}
```

### 2. 示例

```c#
// Use the PowerShell.Create and PowerShell.AddCommand
// methods to create a command pipeline that includes
// Get-Process cmdlet. Do not include spaces immediately
// before or after the cmdlet name as that will cause
// the command to fail.
PowerShell ps = PowerShell.Create().AddCommand("Get-Process");

// Create an IAsyncResult object and call the
// BeginInvoke method to start running the
// command pipeline asynchronously.
IAsyncResult async = ps.BeginInvoke();

// Using the PowerShell.Invoke method, run the command
// pipeline using the default runspace.
foreach (PSObject result in ps.EndInvoke(async))
{
    Console.WriteLine("{0,-20}{1}",
            result.Members["ProcessName"].Value,
            result.Members["Id"].Value);
} // End foreach.
System.Console.WriteLine("Hit any key to exit.");
System.Console.ReadKey();
```
