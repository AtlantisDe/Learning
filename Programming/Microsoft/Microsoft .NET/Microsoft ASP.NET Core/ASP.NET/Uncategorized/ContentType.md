# ContentType

- [ContentType Class (System.Net.Mime)](https://docs.microsoft.com/en-us/dotnet/api/system.net.mime.contenttype?view=netframework-4.8)
- [HttpResponse.ContentType Property (System.Web)](https://docs.microsoft.com/en-us/dotnet/api/system.web.httpresponse.contenttype?view=netframework-4.8)
- [ASP.NET 中 ContentType 类型 - 风飘零 - 博客园](https://www.cnblogs.com/lf6112/archive/2010/05/04/1727358.html)
- [【ASP.NET Core】根据 Content-Type 头部来筛选 Action - weixin_34343689 的博客 - CSDN 博客](https://blog.csdn.net/weixin_34343689/article/details/86399234)
- [Get MIME type from filename extension](https://stackoverflow.com/questions/1029740/get-mime-type-from-filename-extension)
- [Getting Title at 21:08](https://stackoverflow.com/questions/4576483/how-to-get-the-content-type-of-a-file-at-runtime/23373189)

```c#

Public enum MimeTypes
{
  [Description("application/postscript")]
  ai,
  [Description("audio/x-aiff")]
  aif,
  [Description("audio/x-aiff")]
  aifc,
  [Description("audio/x-aiff")]
  aiff,
  [Description("text/plain")]
  asc,
  [Description("application/atom+xml")]
  atom,
  [Description("audio/basic")]
  au,
  [Description("video/x-msvideo")]
  avi,
  [Description("application/x-bcpio")]
  bcpio,
  [Description("application/octet-stream")]
  bin,
  [Description("image/bmp")]
  bmp,
  [Description("application/x-netcdf")]
  cdf,
  [Description("image/cgm")]
  cgm,
  [Description("application/octet-stream")]
  class,
  [Description("application/x-cpio")]
  cpio,
  [Description("application/mac-compactpro")]
  cpt,
  [Description("application/x-csh")]
  csh,
  [Description("text/css")]
  css,
  [Description("application/x-director")]
  dcr,
  [Description("video/x-dv")]
  dif,
  [Description("application/x-director")]
  dir,
  [Description("image/vnd.djvu")]
  djv,
  [Description("image/vnd.djvu")]
  djvu,
  [Description("application/octet-stream")]
  dll,
  [Description("application/octet-stream")]
  dmg,
  [Description("application/octet-stream")]
  dms,
  [Description("application/msword")]
  doc,
  [Description("application/xml-dtd")]
  dtd,
  [Description("video/x-dv")]
  dv,
  [Description("application/x-dvi")]
  dvi,
  [Description("application/x-director")]
  dxr,
  [Description("application/postscript")]
  eps,
  [Description("text/x-setext")]
  etx,
  [Description("application/octet-stream")]
  exe,
  [Description("application/andrew-inset")]
  ez,
  [Description("image/gif")]
  gif,
  [Description("application/srgs")]
  gram,
  [Description("application/srgs+xml")]
  grxml,
  [Description("application/x-gtar")]
  gtar,
  [Description("application/x-hdf")]
  hdf,
  [Description("application/mac-binhex40")]
  hqx,
  [Description("text/html")]
  htm,
  [Description("text/html")]
  html,
  [Description("x-conference/x-cooltalk")]
  ice,
  [Description("image/x-icon")]
  ico,
  [Description("text/calendar")]
  ics,
  [Description("image/ief")]
  ief,
  [Description("text/calendar")]
  ifb,
  [Description("model/iges")]
  iges,
  [Description("model/iges")]
  igs,
  [Description("application/x-java-jnlp-file")]
  jnlp,
  [Description("image/jp2")]
  jp2,
  [Description("image/jpeg")]
  jpe,
  [Description("image/jpeg")]
  jpeg,
  [Description("image/jpeg")]
  jpg,
  [Description("application/x-javascript")]
  js,
  [Description("audio/midi")]
  kar,
  [Description("application/x-latex")]
  latex,
  [Description("application/octet-stream")]
  lha,
  [Description("application/octet-stream")]
  lzh,
  [Description("audio/x-mpegurl")]
  m3u,
  [Description("audio/mp4a-latm")]
  m4a,
  [Description("audio/mp4a-latm")]
  m4b,
  [Description("audio/mp4a-latm")]
  m4p,
  [Description("video/vnd.mpegurl")]
  m4u,
  [Description("video/x-m4v")]
  m4v,
  [Description("image/x-macpaint")]
  mac,
  [Description("application/x-troff-man")]
  man,
  [Description("application/mathml+xml")]
  mathml,
  [Description("application/x-troff-me")]
  me,
  [Description("model/mesh")]
  mesh,
  [Description("audio/midi")]
  mid,
  [Description("audio/midi")]
  midi,
  [Description("application/vnd.mif")]
  mif,
  [Description("video/quicktime")]
  mov,
  [Description("video/x-sgi-movie")]
  movie,
  [Description("audio/mpeg")]
  mp2,
  [Description("audio/mpeg")]
  mp3,
  [Description("video/mp4")]
  mp4,
  [Description("video/mpeg")]
  mpe,
  [Description("video/mpeg")]
  mpeg,
  [Description("video/mpeg")]
  mpg,
  [Description("audio/mpeg")]
  mpga,
  [Description("application/x-troff-ms")]
  ms,
  [Description("model/mesh")]
  msh,
  [Description("video/vnd.mpegurl")]
  mxu,
  [Description("application/x-netcdf")]
  nc,
  [Description("application/oda")]
  oda,
  [Description("application/ogg")]
  ogg,
  [Description("image/x-portable-bitmap")]
  pbm,
  [Description("image/pict")]
  pct,
  [Description("chemical/x-pdb")]
  pdb,
  [Description("application/pdf")]
  pdf,
  [Description("image/x-portable-graymap")]
  pgm,
  [Description("application/x-chess-pgn")]
  pgn,
  [Description("image/pict")]
  pic,
  [Description("image/pict")]
  pict,
  [Description("image/png")]
  png,
  [Description("image/x-portable-anymap")]
  pnm,
  [Description("image/x-macpaint")]
  pnt,
  [Description("image/x-macpaint")]
  pntg,
  [Description("image/x-portable-pixmap")]
  ppm,
  [Description("application/vnd.ms-powerpoint")]
  ppt,
  [Description("application/postscript")]
  ps,
  [Description("video/quicktime")]
  qt,
  [Description("image/x-quicktime")]
  qti,
  [Description("image/x-quicktime")]
  qtif,
  [Description("audio/x-pn-realaudio")]
  ra,
  [Description("audio/x-pn-realaudio")]
  ram,
  [Description("image/x-cmu-raster")]
  ras,
  [Description("application/rdf+xml")]
  rdf,
  [Description("image/x-rgb")]
  rgb,
  [Description("application/vnd.rn-realmedia")]
  rm,
  [Description("application/x-troff")]
  roff,
  [Description("text/rtf")]
  rtf,
  [Description("text/richtext")]
  rtx,
  [Description("text/sgml")]
  sgm,
  [Description("text/sgml")]
  sgml,
  [Description("application/x-sh")]
  sh,
  [Description("application/x-shar")]
  shar,
  [Description("model/mesh")]
  silo,
  [Description("application/x-stuffit")]
  sit,
  [Description("application/x-koan")]
  skd,
  [Description("application/x-koan")]
  skm,
  [Description("application/x-koan")]
  skp,
  [Description("application/x-koan")]
  skt,
  [Description("application/smil")]
  smi,
  [Description("application/smil")]
  smil,
  [Description("audio/basic")]
  snd,
  [Description("application/octet-stream")]
  so,
  [Description("application/x-futuresplash")]
  spl,
  [Description("application/x-wais-source")]
  src,
  [Description("application/x-sv4cpio")]
  sv4cpio,
  [Description("application/x-sv4crc")]
  sv4crc,
  [Description("image/svg+xml")]
  svg,
  [Description("application/x-shockwave-flash")]
  swf,
  [Description("application/x-troff")]
  t,
  [Description("application/x-tar")]
  tar,
  [Description("application/x-tcl")]
  tcl,
  [Description("application/x-tex")]
  tex,
  [Description("application/x-texinfo")]
  texi,
  [Description("application/x-texinfo")]
  texinfo,
  [Description("image/tiff")]
  tif,
  [Description("image/tiff")]
  tiff,
  [Description("application/x-troff")]
  tr,
  [Description("text/tab-separated-values")]
  tsv,
  [Description("text/plain")]
  txt,
  [Description("application/x-ustar")]
  ustar,
  [Description("application/x-cdlink")]
  vcd,
  [Description("model/vrml")]
  vrml,
  [Description("application/voicexml+xml")]
  vxml,
  [Description("audio/x-wav")]
  wav,
  [Description("image/vnd.wap.wbmp")]
  wbmp,
  [Description("application/vnd.wap.wbxml")]
  wbmxl,
  [Description("text/vnd.wap.wml")]
  wml,
  [Description("application/vnd.wap.wmlc")]
  wmlc,
  [Description("text/vnd.wap.wmlscript")]
  wmls,
  [Description("application/vnd.wap.wmlscriptc")]
  wmlsc,
  [Description("model/vrml")]
  wrl,
  [Description("image/x-xbitmap")]
  xbm,
  [Description("application/xhtml+xml")]
  xht,
  [Description("application/xhtml+xml")]
  xhtml,
  [Description("application/vnd.ms-excel")]
  xls,
  [Description("application/xml")]
  xml,
  [Description("image/x-xpixmap")]
  xpm,
  [Description("application/xml")]
  xsl,
  [Description("application/xslt+xml")]
  xslt,
  [Description("application/vnd.mozilla.xul+xml")]
  xul,
  [Description("image/x-xwindowdump")]
  xwd,
  [Description("chemical/x-xyz")]
  xyz,
  [Description("application/zip")]
  zip
}


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

### ApiController 中配置

```c#
this.Request.Content.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("text/plain");
```
