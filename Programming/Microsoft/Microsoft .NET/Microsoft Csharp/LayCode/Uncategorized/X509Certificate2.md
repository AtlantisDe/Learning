# X509Certificate2

- [X509Certificate2Collection Class (System.Security.Cryptography.X509Certificates)](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509certificate2collection?redirectedfrom=MSDN&view=net-5.0)
- [Programmatically import cert into IIS?](https://stackoverflow.com/questions/4498291/programmatically-import-cert-into-iis)
- [Using makecert for Development SSL](https://stackoverflow.com/questions/496658/using-makecert-for-development-ssl)
- [StoreName Enum (System.Security.Cryptography.X509Certificates)](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.storename?view=net-5.0)
- [Working with SSL in Web API](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/working-with-ssl-in-web-api)
- [How can I install a certificate into the local machine store programmatically using c#?](https://stackoverflow.com/questions/566570/how-can-i-install-a-certificate-into-the-local-machine-store-programmatically-us)
- [X509Certificate2Collection.Find(X509FindType, Object, Boolean) Method (System.Security.Cryptography.X509Certificates)](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509certificate2collection.find?view=net-5.0)
- [X509Certificate2.IssuerName Property (System.Security.Cryptography.X509Certificates)](https://docs.microsoft.com/en-us/dotnet/api/system.security.cryptography.x509certificates.x509certificate2.issuername?view=net-5.0)
- [Create self-signed certificate using Bouncy Castle in C#](https://ask.roboflow.ai/question/7248642)
- [How do I get the Organization name from an X509Certificate2?](https://stackoverflow.com/questions/51428083/how-do-i-get-the-organization-name-from-an-x509certificate2)
- [How to get common name (CN) from SSL certificate using openssl command - nixCraft](https://www.cyberciti.biz/faq/openssl-get-common-name-cn-from-ssl-certificate-on-linux-unix/)

```c#
System.Security.Cryptography.X509Certificates
```

## 1. 常用

```c#


var certificate2 = new X509Certificate2(System.IO.File.ReadAllBytes(pfxPath), "John9999");

X509Certificate2 pc1 = new X509Certificate2(System.IO.File.ReadAllBytes($@"D:\Tmp\SSL\115146.pfx"), "");
X509Certificate2 pc2 = new X509Certificate2(System.IO.File.ReadAllBytes($@"D:\Tmp\SSL\171eb527753a9a-temp.pfx"), "secp384r1");

// 添加证书
store.Add(item);

// 删除证书
store.Remove(item);

public static AsymmetricAlgorithm ReadFromPfxFile()
{
    X509Certificate2 pc = new X509Certificate2(cafile, mer_private_password);
    return pc.PrivateKey;
}


X509Store store = new X509Store(StoreName.My, StoreLocation.LocalMachine);
store.Open(OpenFlags.OpenExistingOnly | OpenFlags.ReadWrite);

// Here, directory is my install dir, and (directory)\bin\certificate.pfx is where the cert file is.
// 1234 is the password to the certfile (exported from IIS)
X509Certificate2 certificate = new X509Certificate2(@"D:\Test\CertificateBackup\Web.IIS\Certes\001.pfx", "123");

store.Add(certificate);
store.Close();


using System;
using System.Security.Cryptography;
using System.Security.Permissions;
using System.IO;
using System.Security.Cryptography.X509Certificates;

class CertInfo
{
    //Reads a file.
    internal static byte[] ReadFile (string fileName)
    {
        FileStream f = new FileStream(fileName, FileMode.Open, FileAccess.Read);
        int size = (int)f.Length;
        byte[] data = new byte[size];
        size = f.Read(data, 0, size);
        f.Close();
        return data;
    }
    //Main method begins here.
    static void Main(string[] args)
    {
        //Test for correct number of arguments.
        if (args.Length < 1)
        {
            Console.WriteLine("Usage: CertInfo <filename>");
            return;
        }
        try
        {
            X509Certificate2 x509 = new X509Certificate2();
            //Create X509Certificate2 object from .cer file.
            byte[] rawData = ReadFile(args[0]);
            x509.Import(rawData);

            //Print to console information contained in the certificate.
            Console.WriteLine("{0}Subject: {1}{0}", Environment.NewLine, x509.Subject);
            Console.WriteLine("{0}Issuer: {1}{0}", Environment.NewLine, x509.Issuer);
            Console.WriteLine("{0}Version: {1}{0}", Environment.NewLine, x509.Version);
            Console.WriteLine("{0}Valid Date: {1}{0}", Environment.NewLine, x509.NotBefore);
            Console.WriteLine("{0}Expiry Date: {1}{0}", Environment.NewLine, x509.NotAfter);
            Console.WriteLine("{0}Thumbprint: {1}{0}", Environment.NewLine, x509.Thumbprint);
            Console.WriteLine("{0}Serial Number: {1}{0}", Environment.NewLine, x509.SerialNumber);
            Console.WriteLine("{0}Friendly Name: {1}{0}", Environment.NewLine, x509.PublicKey.Oid.FriendlyName);
            Console.WriteLine("{0}Public Key Format: {1}{0}", Environment.NewLine, x509.PublicKey.EncodedKeyValue.Format(true));
            Console.WriteLine("{0}Raw Data Length: {1}{0}", Environment.NewLine, x509.RawData.Length);
            Console.WriteLine("{0}Certificate to string: {1}{0}", Environment.NewLine, x509.ToString(true));
            Console.WriteLine("{0}Certificate to XML String: {1}{0}", Environment.NewLine, x509.PublicKey.Key.ToXmlString(false));

            //Add the certificate to a X509Store.
            X509Store store = new X509Store();
            store.Open(OpenFlags.MaxAllowed);
            store.Add(x509);
            store.Close();
        }
        catch (DirectoryNotFoundException)
        {
               Console.WriteLine("Error: The directory specified could not be found.");
        }
        catch (IOException)
        {
            Console.WriteLine("Error: A file in the directory could not be accessed.");
        }
        catch (NullReferenceException)
        {
            Console.WriteLine("File must be a .cer file. Program does not have access to that type of file.");
        }
    }
}


using System;
using System.Security.Cryptography;
using System.Security.Permissions;
using System.IO;
using System.Security.Cryptography.X509Certificates;

class CertSelect
{
    static void Main()
    {
        X509Store store = new X509Store("MY",StoreLocation.CurrentUser);
        store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);

        X509Certificate2Collection collection = (X509Certificate2Collection)store.Certificates;
        X509Certificate2Collection fcollection = (X509Certificate2Collection)collection.Find(X509FindType.FindByTimeValid,DateTime.Now,false);
        X509Certificate2Collection scollection = X509Certificate2UI.SelectFromCollection(fcollection, "Test Certificate Select","Select a certificate from the following list to get information on that certificate",X509SelectionFlag.MultiSelection);
        Console.WriteLine("Number of certificates: {0}{1}",scollection.Count,Environment.NewLine);

        foreach (X509Certificate2 x509 in scollection)
        {
            try
            {
                byte[] rawdata = x509.RawData;
                Console.WriteLine("Content Type: {0}{1}",X509Certificate2.GetCertContentType(rawdata),Environment.NewLine);
                Console.WriteLine("Friendly Name: {0}{1}",x509.FriendlyName,Environment.NewLine);
                Console.WriteLine("Certificate Verified?: {0}{1}",x509.Verify(),Environment.NewLine);
                Console.WriteLine("Simple Name: {0}{1}",x509.GetNameInfo(X509NameType.SimpleName,true),Environment.NewLine);
                Console.WriteLine("Signature Algorithm: {0}{1}",x509.SignatureAlgorithm.FriendlyName,Environment.NewLine);
                Console.WriteLine("Public Key: {0}{1}",x509.PublicKey.Key.ToXmlString(false),Environment.NewLine);
                Console.WriteLine("Certificate Archived?: {0}{1}",x509.Archived,Environment.NewLine);
                Console.WriteLine("Length of Raw Data: {0}{1}",x509.RawData.Length,Environment.NewLine);
                X509Certificate2UI.DisplayCertificate(x509);
                x509.Reset();
            }
            catch (CryptographicException)
            {
                Console.WriteLine("Information could not be written out for this certificate.");
            }
        }
        store.Close();
    }
}



using System;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.IO;

public class X509store2
{
    public static void Main(string[] args)
    {
        //Opens the personal certificates store.
        X509Store store = new X509Store(StoreName.My);
        store.Open(OpenFlags.ReadWrite);
        X509Certificate2 certificate = new X509Certificate2();

        //Create certificates from certificate files.
        //You must put in a valid path to three certificates in the following constructors.
        X509Certificate2 certificate1 = new X509Certificate2("c:\\mycerts\\*****.cer");
        X509Certificate2 certificate2 = new X509Certificate2("c:\\mycerts\\*****.cer");
        X509Certificate2 certificate5 = new X509Certificate2("c:\\mycerts\\*****.cer");

        //Create a collection and add two of the certificates.
        X509Certificate2Collection collection = new X509Certificate2Collection();
        collection.Add(certificate2);
        collection.Add(certificate5);

        //Add certificates to the store.
        store.Add(certificate1);
        store.AddRange(collection);

        X509Certificate2Collection storecollection = (X509Certificate2Collection)store.Certificates;
        Console.WriteLine("Store name: {0}", store.Name);
        Console.WriteLine("Store location: {0}", store.Location);
        foreach (X509Certificate2 x509 in storecollection)
        {
            Console.WriteLine("certificate name: {0}", x509.Subject);
        }

        //Remove a certificate.
        store.Remove(certificate1);
        X509Certificate2Collection storecollection2 = (X509Certificate2Collection)store.Certificates;
        Console.WriteLine("{1}Store name: {0}", store.Name, Environment.NewLine);
        foreach (X509Certificate2 x509 in storecollection2)
        {
            Console.WriteLine("certificate name: {0}", x509.Subject);
        }

        //Remove a range of certificates.
        store.RemoveRange(collection);
        X509Certificate2Collection storecollection3 = (X509Certificate2Collection)store.Certificates;
        Console.WriteLine("{1}Store name: {0}", store.Name, Environment.NewLine);
        if (storecollection3.Count == 0)
        {
            Console.WriteLine("Store contains no certificates.");
        }
        else
        {
            foreach (X509Certificate2 x509 in storecollection3)
            {
                Console.WriteLine("certificate name: {0}", x509.Subject);
            }
        }

        //Close the store.
        store.Close();
    }
}


X509Certificate2 certificate = new X509Certificate2(pfxPath, password, X509KeyStorageFlags.PersistKeySet | X509KeyStorageFlags.MachineKeySet);
using (X509Store store = new X509Store(StoreName.My, StoreLocation.LocalMachine))
{
     store.Open(OpenFlags.ReadWrite);
     store.Add(certificate);
     store.Close();
}



var pfxPath = $@"D:\Tmp\mkcert\001.pfx";
var password = "ThanksSoMuch";
X509Certificate2 certificate = new X509Certificate2(pfxPath, password, X509KeyStorageFlags.PersistKeySet | X509KeyStorageFlags.MachineKeySet);
using (X509Store store = new X509Store(StoreName.My, StoreLocation.LocalMachine))
{
    store.Open(OpenFlags.ReadWrite);
    store.Add(certificate);
    store.Close();
}

```

## 2. get-ssl-certificate-in-net

- [Getting Title at 5:19](http://go.microsoft.com/fwlink/?linkid=14202)
- [get ssl certificate in .net](https://stackoverflow.com/questions/15270764/get-ssl-certificate-in-net)
- [通过 C＃获取 WebSite 证书 - Thinbug](https://www.thinbug.com/q/29803506)
- [eference](https://apireference.aspose.com/pdf/cpp/class/system.security.cryptography.x509_certificates.x509_certificate2)
- [How to get issuer name in RFC-1779 from X509Certificate2?](https://stackoverflow.com/questions/51975265/how-to-get-issuer-name-in-rfc-1779-from-x509certificate2)

```c#
using System.Security;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;

//Do webrequest to get info on secure site
HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://mail.google.com");
HttpWebResponse response = (HttpWebResponse)request.GetResponse();
response.Close();

//retrieve the ssl cert and assign it to an X509Certificate object
X509Certificate cert = request.ServicePoint.Certificate;

//convert the X509Certificate to an X509Certificate2 object by passing it into the constructor
X509Certificate2 cert2 = new X509Certificate2(cert);

string cn = cert2.GetIssuerName();
string cedate = cert2.GetExpirationDateString();
string cpub = cert2.GetPublicKeyString();

//display the cert dialog box
X509Certificate2UI.DisplayCertificate(cert2);
```

## 3. 测试的代码

```c#
               using (X509Store store = new X509Store(StoreName.My, StoreLocation.LocalMachine))
                {
                    store.Open(OpenFlags.ReadWrite);

                    X509Certificate2Collection storecollection3 = (X509Certificate2Collection)store.Certificates;

                    var item = storecollection3[3];
                    var NotBefore = item.NotBefore;
                    var NotAfter = item.NotAfter;
                    var FriendlyName = item.FriendlyName;
                    var Name = item.SubjectName.Name;
                    var IssuerName = item.IssuerName;
                    var Issuer = item.Issuer;

                    var DnsName = item.GetNameInfo(X509NameType.DnsName, true);
                    var UrlName = item.GetNameInfo(X509NameType.UrlName, true);

                    var SimpleName = item.GetNameInfo(X509NameType.SimpleName, true);
                    var cn = item.Subject.GetStringMid("CN=", ",");



                    var x509 = item;

                    //Print to console information contained in the certificate.
                    Console.WriteLine("{0}Subject: {1}{0}", Environment.NewLine, x509.Subject);
                    Console.WriteLine("{0}Issuer: {1}{0}", Environment.NewLine, x509.Issuer);
                    Console.WriteLine("{0}Version: {1}{0}", Environment.NewLine, x509.Version);
                    Console.WriteLine("{0}Valid Date: {1}{0}", Environment.NewLine, x509.NotBefore);
                    Console.WriteLine("{0}Expiry Date: {1}{0}", Environment.NewLine, x509.NotAfter);
                    Console.WriteLine("{0}Thumbprint: {1}{0}", Environment.NewLine, x509.Thumbprint);
                    Console.WriteLine("{0}Serial Number: {1}{0}", Environment.NewLine, x509.SerialNumber);
                    Console.WriteLine("{0}Friendly Name: {1}{0}", Environment.NewLine, x509.PublicKey.Oid.FriendlyName);
                    Console.WriteLine("{0}Public Key Format: {1}{0}", Environment.NewLine, x509.PublicKey.EncodedKeyValue.Format(true));
                    Console.WriteLine("{0}Raw Data Length: {1}{0}", Environment.NewLine, x509.RawData.Length);
                    Console.WriteLine("{0}Certificate to string: {1}{0}", Environment.NewLine, x509.ToString(true));
                    Console.WriteLine("{0}Certificate to XML String: {1}{0}", Environment.NewLine, x509.PublicKey.Key.ToXmlString(false));





                    store.Close();
                }


```
