# Kesoft.Windows.NetFirewallHelper

- [freemanke/Kesoft.Windows.NetFirewallHelper](https://github.com/freemanke/Kesoft.Windows.NetFirewallHelper)

## 常用 DEMO 代码

```c#
const string name = "tests";
const int port = 4556;
foreach (var p in new[] { Kesoft.Windows.NetFirewallHelper.NetFirewall.Protocol.TCP, Kesoft.Windows.NetFirewallHelper.NetFirewall.Protocol.UDP })
{
    var authorized = Kesoft.Windows.NetFirewallHelper.NetFirewall.PortIsAuthorized(port, p);
    if (authorized) Kesoft.Windows.NetFirewallHelper.NetFirewall.RemovePort(port, p);

    Kesoft.Windows.NetFirewallHelper.NetFirewall.AddPort(name, port, p);
    authorized = Kesoft.Windows.NetFirewallHelper.NetFirewall.PortIsAuthorized(port, p);

    Kesoft.Windows.NetFirewallHelper.NetFirewall.RemovePort(port, p);
    authorized = Kesoft.Windows.NetFirewallHelper.NetFirewall.PortIsAuthorized(port, p);

}
```

## 官方 DEMO 代码

```c#
[TestFixture]
    public class NetFirewallTest
    {
        [Test]
        public void AddRemovePort()
        {
            const string name = "tests";
            const int port = 4556;
            foreach (var p in new[] {NetFirewall.Protocol.TCP, NetFirewall.Protocol.UDP})
            {
                var authorized = NetFirewall.PortIsAuthorized(port, p);
                if (authorized) NetFirewall.RemovePort(port, p);

                NetFirewall.AddPort(name, port, p);
                authorized = NetFirewall.PortIsAuthorized(port, p);
                Assert.IsTrue(authorized);
                NetFirewall.RemovePort(port, p);
                authorized = NetFirewall.PortIsAuthorized(port, p);
                Assert.IsFalse(authorized);
            }
        }

        [Test]
        public void AddRemoveApplication()
        {
            var authorized = NetFirewall.ApplicationIsAuthorized(Application.ExecutablePath);
            if (authorized) NetFirewall.RemoveApplication(Application.ExecutablePath);

            NetFirewall.AddApplication(Application.ExecutablePath);
            authorized = NetFirewall.ApplicationIsAuthorized(Application.ExecutablePath);
            Assert.IsTrue(authorized);
            NetFirewall.RemoveApplication(Application.ExecutablePath);
            authorized = NetFirewall.ApplicationIsAuthorized(Application.ExecutablePath);
            Assert.IsFalse(authorized);
        }
    }
```
