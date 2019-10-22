# ContentType

- [ASP.NET 中 ContentType 类型 - 风飘零 - 博客园](https://www.cnblogs.com/lf6112/archive/2010/05/04/1727358.html)
- [【ASP.NET Core】根据 Content-Type 头部来筛选 Action - weixin_34343689 的博客 - CSDN 博客](https://blog.csdn.net/weixin_34343689/article/details/86399234)

```c#
// 在ASP.NET中使用Response.ContentType="类型名";来确定输出格式
'ez' => 'application/andrew-inset',
'hqx' => 'application/mac-binhex40',
'cpt' => 'application/mac-compactpro',
'doc' => 'application/msword',
'bin' => 'application/octet-stream',
'dms' => 'application/octet-stream',
'lha' => 'application/octet-stream',
'lzh' => 'application/octet-stream',
'exe' => 'application/octet-stream',
'class' => 'application/octet-stream',
'so' => 'application/octet-stream',
'dll' => 'application/octet-stream',
'oda' => 'application/oda',
'pdf' => 'application/pdf',
'ai' => 'application/postscript',
'eps' => 'application/postscript',
'ps' => 'application/postscript',
'smi' => 'application/smil',
'smil' => 'application/smil',
'mif' => 'application/vnd.mif',
'xls' => 'application/vnd.ms-excel',
'ppt' => 'application/vnd.ms-powerpoint',
'wbxml' => 'application/vnd.wap.wbxml',
'wmlc' => 'application/vnd.wap.wmlc',
'wmlsc' => 'application/vnd.wap.wmlscriptc',
'bcpio' => 'application/x-bcpio',
'vcd' => 'application/x-cdlink',
'pgn' => 'application/x-chess-pgn',
'cpio' => 'application/x-cpio',
'csh' => 'application/x-csh',
'dcr' => 'application/x-director',
'dir' => 'application/x-director',
'dxr' => 'application/x-director',
'dvi' => 'application/x-dvi',
'spl' => 'application/x-futuresplash',
'gtar' => 'application/x-gtar',
'hdf' => 'application/x-hdf',
'js' => 'application/x-javascript',
'skp' => 'application/x-koan',
'skd' => 'application/x-koan',
'skt' => 'application/x-koan',
'skm' => 'application/x-koan',
'latex' => 'application/x-latex',
'nc' => 'application/x-netcdf',
'cdf' => 'application/x-netcdf',
'sh' => 'application/x-sh',
'shar' => 'application/x-shar',
'swf' => 'application/x-shockwave-flash',
'sit' => 'application/x-stuffit',
'sv4cpio' => 'application/x-sv4cpio',
'sv4crc' => 'application/x-sv4crc',
'tar' => 'application/x-tar',
'tcl' => 'application/x-tcl',
'tex' => 'application/x-tex',
'texinfo' => 'application/x-texinfo',
'texi' => 'application/x-texinfo',
't' => 'application/x-troff',
'tr' => 'application/x-troff',
'roff' => 'application/x-troff',
'man' => 'application/x-troff-man',
'me' => 'application/x-troff-me',
'ms' => 'application/x-troff-ms',
'ustar' => 'application/x-ustar',
'src' => 'application/x-wais-source',
'xhtml' => 'application/xhtml+xml',
'xht' => 'application/xhtml+xml',
'zip' => 'application/zip',
'au' => 'audio/basic',
'snd' => 'audio/basic',
'mid' => 'audio/midi',
'midi' => 'audio/midi',
'kar' => 'audio/midi',
'mpga' => 'audio/mpeg',
'mp2' => 'audio/mpeg',
'mp3' => 'audio/mpeg',
'aif' => 'audio/x-aiff',
'aiff' => 'audio/x-aiff',
'aifc' => 'audio/x-aiff',
'm3u' => 'audio/x-mpegurl',
'ram' => 'audio/x-pn-realaudio',
'rm' => 'audio/x-pn-realaudio',
'rpm' => 'audio/x-pn-realaudio-plugin',
'ra' => 'audio/x-realaudio',
'wav' => 'audio/x-wav',
'pdb' => 'chemical/x-pdb',
'xyz' => 'chemical/x-xyz',
'bmp' => 'image/bmp',
'gif' => 'image/gif',
'ief' => 'image/ief',
'jpeg' => 'image/jpeg',
'jpg' => 'image/jpeg',
'jpe' => 'image/jpeg',
'png' => 'image/png',
'tiff' => 'image/tiff',
'tif' => 'image/tiff',
'djvu' => 'image/vnd.djvu',
'djv' => 'image/vnd.djvu',
'wbmp' => 'image/vnd.wap.wbmp',
'ras' => 'image/x-cmu-raster',
'pnm' => 'image/x-portable-anymap',
'pbm' => 'image/x-portable-bitmap',
'pgm' => 'image/x-portable-graymap',
'ppm' => 'image/x-portable-pixmap',
'rgb' => 'image/x-rgb',
'xbm' => 'image/x-xbitmap',
'xpm' => 'image/x-xpixmap',
'xwd' => 'image/x-xwindowdump',
'igs' => 'model/iges',
'iges' => 'model/iges',
'msh' => 'model/mesh',
'mesh' => 'model/mesh',
'silo' => 'model/mesh',
'wrl' => 'model/vrml',
'vrml' => 'model/vrml',
'css' => 'text/css',
'html' => 'text/html',
'htm' => 'text/html',
'asc' => 'text/plain',
'txt' => 'text/plain',
'rtx' => 'text/richtext',
'rtf' => 'text/rtf',
'sgml' => 'text/sgml',
'sgm' => 'text/sgml',
'tsv' => 'text/tab-separated-values',
'wml' => 'text/vnd.wap.wml',
'wmls' => 'text/vnd.wap.wmlscript',
'etx' => 'text/x-setext',
'xsl' => 'text/xml',
'xml' => 'text/xml',
'mpeg' => 'video/mpeg',
'mpg' => 'video/mpeg',
'mpe' => 'video/mpeg',
'qt' => 'video/quicktime',
'mov' => 'video/quicktime',
'mxu' => 'video/vnd.mpegurl',
'avi' => 'video/x-msvideo',
'movie' => 'video/x-sgi-movie',
'ice' => 'x-conference/x-cooltalk'
```

## ASP.NET 中 ContentType 类型

- [ASP.NET 中 ContentType 类型 - wuling129 - 博客园](https://www.cnblogs.com/wuling129/p/8302014.html)

### 代码合集

```c#

<% response.ContentType ="application/json;charset=utf-8" %>


// 代码如:
<% response.ContentType ="text/html" %>
<!--＃i nclude virtual="/ContentType.html" -->
// 显示的为网页,而
<% response.ContentType ="text/plain" %>
<!--＃i nclude virtual="/sscript/ContentType.html" -->
// 则会显示html原代码.

// 以下为一些常用的 ContentType
// GIF images
<% response.ContentType ="image/gif" %>
<!--＃i nclude virtual="/myimage.gif" -->
JPEG images
<% response.ContentType ="image/jpeg" %>
<!--＃i nclude virtual="/myimage.jpeg" -->
TIFF images
<% response.ContentType ="image/tiff" %>
<!--＃i nclude virtual="/myimage.tiff" -->
MICROSOFT WORD document
<% response.ContentType ="application/msword" %>
<!--＃i nclude virtual="/myfile.doc" -->
RTF document
<% response.ContentType ="application/rtf" %>
<!--＃i nclude virtual="/myfile.rtf" -->
MICROSOFT EXCEL document
<% response.ContentType ="application/x-excel" %>
<!--＃i nclude virtual="/myfile.xls" -->
MICROSOFT POWERPOINT document
<% response.ContentType ="application/ms-powerpoint" %>
<!--＃i nclude virtual="/myfile.pff" -->
PDF document
<% response.ContentType ="application/pdf" %>
<!--＃i nclude virtual="/myfile.pdf" -->
ZIP document
<% response.ContentType ="application/zip" %>
<!--＃i nclude virtual="/myfile.zip" -->

// RAR document

Response.ContentType = "application/x-msdownload ; Charset=utf-8";
Response.AddHeader("Content-Disposition", "attachment; filename=...");
```

### 设置编码 UTF8 JSON

```c#
<% Response.ContentType = "application/json;charset=utf-8";%>
```
