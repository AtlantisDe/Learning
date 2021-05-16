# get-wmiobject

- [running powershell command (get-wmiobject)](https://social.msdn.microsoft.com/Forums/vstudio/en-US/adb4ea43-3072-4ad7-902d-9029d6f0aa87/running-powershell-command-getwmiobject?forum=csharpgeneral)

```c#
Runspace runspace = RunspaceFactory.CreateRunspace();
runspace.Open();

PowerShell ps = PowerShell.Create();
ps.Runspace = runspace;
ps.AddCommand("get-wmiobject").AddArgument("win32_computersystem");


foreach(PSObject result in ps.Invoke())
{
    richTextBox1.AppendText("Domain : " + result.Members["Domain"].Value.ToString() + "\n");
    richTextBox1.AppendText("Manufacturer : " + result.Members["Manufacturer"].Value.ToString() + "\n");
    richTextBox1.AppendText("Model : " + result.Members["Model"].Value.ToString() + "\n");
    richTextBox1.AppendText("Name : " + result.Members["Name"].Value.ToString() + "\n");
    richTextBox1.AppendText("PrimaryOwnerName : " + result.Members["PrimaryOwnerName"].Value.ToString() + "\n");
    richTextBox1.AppendText("TotalPhysicalMemory : " + result.Members["TotalPhysicalMemory"].Value.ToString() + "\n");
}

runspace.Close();
```
