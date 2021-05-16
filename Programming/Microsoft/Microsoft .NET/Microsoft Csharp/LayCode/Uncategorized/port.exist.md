# c# check if port exists

- [Programmatically check if a COM port exists in C#](https://stackoverflow.com/questions/29442516/programmatically-check-if-a-com-port-exists-in-c-sharp?rq=1)

```c#
string[] ports = SerialPort.GetPortNames();
SerialPort port = new SerialPort(ports[0]);  // create using first existing serial port, for example
```
