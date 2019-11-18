# get-service

```c#
using (PowerShell PowerShellInstance = PowerShell.Create())
{
    // this script has a sleep in it to simulate a long running script
    PowerShellInstance.AddScript("start-sleep -s 7; get-service");

    // begin invoke execution on the pipeline
    IAsyncResult result = PowerShellInstance.BeginInvoke();

    // do something else until execution has completed.
    // this could be sleep/wait, or perhaps some other work
    while (result.IsCompleted == false)
    {
        Console.WriteLine("Waiting for pipeline to finish...");
        Thread.Sleep(1000);

        // might want to place a timeout here...
    }

    Console.WriteLine("Finished!");
}
```
