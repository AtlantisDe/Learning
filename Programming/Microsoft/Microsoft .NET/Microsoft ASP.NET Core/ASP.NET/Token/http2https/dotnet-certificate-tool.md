# dotnet-certificate-tool

- [gsoft-inc/dotnet-certificate-tool](https://github.com/gsoft-inc/dotnet-certificate-tool)

## 常用

```c#
// Installation
dotnet tool install --global dotnet-certificate-tool


Usage
Available arguments:

--base64 (-b): base 64 encoded certificate value
--file (-f): path to a *.pfx certificate file
--cert (-c): path to a PEM formatted certificate file
--key (-k): path to a PEM formatted key file
--password (-p): password for the certificate
--store-name (-s): certificate store name (defaults to My). See possible values here
--store-location (-l): certificate store location (defaults to CurrentUser). See possible values here
// With a base 64 string
// Assuming you have the following variables setup:

// $base64: base 64 encoded certificate value
// $password: pfx certificate password
// $thumbprint: certificate's thumbprint

certificate-tool add --base64 $base64 --password $password

certificate-tool remove --thumbprint $thumbprint

// With a pfx file
// Assuming you have the following variables setup:

// $password: pfx certificate password
// $thumbprint: certificate's thumbprint
certificate-tool add --file ./cert.pfx --password $password

certificate-tool remove --thumbprint $thumbprint

// With PEM formatted files
// Assuming you have the following variables setup:

// $password: pfx certificate password
// $thumbprint: certificate's thumbprint
certificate-tool add --cert ./cert.crt --key ./cert.key --password $password

certificate-tool remove --thumbprint $thumbprint
```
