# Microsoft.Web.Administration

- [How to Use Microsoft.Web.Administration](https://docs.microsoft.com/en-us/iis/manage/scripting/how-to-use-microsoftwebadministration)

## sites

```C#
 public static bool demodebug(string host)
        {

            // Get the site collection on this server.
            ServerManager serverManager = new ServerManager();
            var Sites = serverManager.Sites;

            string collectiondisplay = null;
            collectiondisplay = "There are " + Sites.Count.ToString() + " sites:\n\n";
            string sitedisplay = null;
            foreach (Site site in Sites)
            {
                sitedisplay = sitedisplay + site.Name + ": ID= " + site.Id + "\n";
                // Display each property of each bindings.
                string bindingdisplay = null;
                foreach (Microsoft.Web.Administration.Binding binding in site.Bindings)
                {
                    bindingdisplay = bindingdisplay + "  Binding:\n   BindingInformation: " +
                        binding.BindingInformation;
                    if (binding.Protocol == "https")
                    {
                        // There is a CertificateHash and
                        // CertificateStoreName for the https protocol only.
                        bindingdisplay = bindingdisplay + "\n   CertificateHash: " +
                            binding.CertificateHash + ": ";
                        // Display the hash.
                        foreach (System.Byte certhashbyte in binding.CertificateHash)
                        {
                            bindingdisplay = bindingdisplay + certhashbyte.ToString() + " ";
                        }
                        bindingdisplay = bindingdisplay + "\n   CertificateStoreName: " +
                            binding.CertificateStoreName;
                    }
                    bindingdisplay = bindingdisplay + "\n   EndPoint: " + binding.EndPoint;
                    bindingdisplay = bindingdisplay + "\n   Host: " + binding.Host;
                    bindingdisplay = bindingdisplay + "\n   IsIPPortHostBinding: " + binding.IsIPPortHostBinding;
                    bindingdisplay = bindingdisplay + "\n   Protocol: " + binding.Protocol;
                    bindingdisplay = bindingdisplay + "\n   ToString: " + binding.ToString();
                    bindingdisplay = bindingdisplay + "\n   UseDsMapper: " + binding.UseDsMapper + "\n\n";
                }
                sitedisplay = sitedisplay + bindingdisplay;
            }
            collectiondisplay = collectiondisplay + sitedisplay + "\n";


            return false;
        }

```

## site add

- [SiteCollection.Add Method (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.sitecollection.add?view=iis-dotnet)

## Binding.BindingInformation

- [Binding.BindingInformation Property (Microsoft.Web.Administration)](https://docs.microsoft.com/en-us/dotnet/api/microsoft.web.administration.binding.bindinginformation?view=iis-dotnet)

### Remarks

```code
The value of this property is a colon-delimited string that includes the IP address, port, and host name of the binding. You can leave the host name blank. You can set the IP address to "*" to indicate that the binding works for all variables.

For example, a binding that is set for all IP addresses on port 80 and has no specified host name returns "*:80:" from this property. A binding that is set for IP address 192.168.1.150 on port 8080 returns "192.168.1.150:8080:". A binding that is set for all IP addresses on port 80 for a host named "microsoft.com" returns "*:80:microsoft.com".

The BindingInformation property values are maintained in the ApplicationHost.config file.
```
