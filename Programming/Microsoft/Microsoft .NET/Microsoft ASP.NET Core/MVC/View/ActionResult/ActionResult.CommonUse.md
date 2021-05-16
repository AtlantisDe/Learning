# ActionResult.CommonUse

- [MVC 中几种常用 ActionResult - 小小邪 - 博客园](https://www.cnblogs.com/xielong/p/5940535.html)

```c#
using StudyMVC4.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

namespace StudyMVC4.Controllers
{
  public class HomeController : Controller
  {
    public ActionResult Index() {
      return View();
    }

    /// <summary>
    /// ContentResult用法（返回文本）
    /// http://localhost:30735/home/ContentResultDemo
    /// </summary>
    /// <returns>返回文本</returns>
    public ActionResult ContentResultDemo(){
      string str = "ContentResultDemo!";
      return Content(str);
    }

    /// <summary>
    /// EmptyResult的用法（返回空对象）
    /// http://localhost:30735/home/EmptyResultDemo
    /// </summary>
    /// <returns>返回一个空对象</returns>
    public ActionResult EmptyResultDemo (){
      return new EmptyResult();
    }

    /// <summary>
    /// FileContentResult的用法（返回图片）
    /// http://localhost:30735/home/FileContentResultDemo
    /// </summary>
    /// <returns>显示一个文件内容</returns>
    public ActionResult FileContentResultDemo() {
      FileStream fs = new FileStream(Server.MapPath(@"/Images/001.jpg"), FileMode.Open, FileAccess.Read);
      byte[] buffer = new byte[Convert.ToInt32(fs.Length)];
      fs.Read(buffer, 0, Convert.ToInt32(fs.Length));
      string contentType = "image/jpeg";
      return File(buffer, contentType);
    }
    /// <summary>
    /// FilePathResult的用法（返回图片）
    /// http://localhost:30735/home/FilePathResultDemo/002
    /// </summary>
    /// <param name="id">图片id</param>
    /// <returns>直接将返回一个文件对象</returns>
    public FilePathResult FilePathResultDemo(string id)
    {
      string path = Server.MapPath(@"/Images/"+id +".jpg");
      //定义内容类型（图片）
      string contentType = "image/jpeg";
      //FilePathResult直接返回file对象
      return File(path, contentType);
    }

    /// <summary>
    /// FileStreamResult的用法（返回图片）
    /// http://localhost:30735/home/FileStreamResultDemo
    /// </summary>
    /// <returns>返回文件流（图片）</returns>
    public ActionResult FileStreamResultDemo()
    {
      FileStream fs = new FileStream(Server.MapPath(@"/Images/001.jpg"), FileMode.Open, FileAccess.Read);
      string contentType = "image/jpeg";
      return File(fs, contentType);
    }

    /// <summary>
    /// HttpUnauthorizedResult 的用法（抛出401错误）
    /// http://localhost:30735/home/HttpUnauthorizedResult
    /// </summary>
    /// <returns></returns>
    public ActionResult HttpUnauthorizedResultDemo()
    {
      return new HttpUnauthorizedResult();
    }

    /// <summary>
    /// HttpStatusCodeResult的方法（返回错误状态信息）
    /// http://localhost:30735/home/HttpStatusCodeResult
    /// </summary>
    /// <returns></returns>
    public ActionResult HttpStatusCodeResultDemo() {
      return new HttpStatusCodeResult(500, "System Error");
    }

    /// <summary>
    /// HttpNotFoundResult的使用方法
    /// http://localhost:30735/home/HttpNotFoundResultDemo
    /// </summary>
    /// <returns></returns>
    public ActionResult HttpNotFoundResultDemo() {
      return new HttpNotFoundResult("not found action");
    }

   /// <summary>
   /// JavaScriptResult 的用法(返回脚本文件)
    /// http://localhost:30735/home/JavaScriptResultDemo
   /// </summary>
   /// <returns>返回脚本内容</returns>
    public ActionResult JavaScriptResultDemo()
    {
      return JavaScript(@"<script>alert('Test JavaScriptResultDemo!')</script>");
    }

    /// <summary>
    /// JsonResult的用法(返回一个json对象)
    /// http://localhost:30735/home/JsonResultDemo
    /// </summary>
    /// <returns>返回一个json对象</returns>
    public ActionResult JsonResultDemo()
    {
      var tempObj = new { Controller = "HomeController", Action = "JsonResultDemo" };
      return Json(tempObj);
    }

    /// <summary>
    /// RedirectResult的用法(跳转url地址)
    /// http://localhost:30735/home/RedirectResultDemo
    /// </summary>
    /// <returns></returns>
    public ActionResult RedirectResultDemo()
    {
      return Redirect(@"http://wwww.baidu.com");
    }

    /// <summary>
    /// RedirectToRouteResult的用法（跳转的action名称）
    /// http://localhost:30735/home/RedirectToRouteResultDemo
    /// </summary>
    /// <returns></returns>
    public ActionResult RedirectToRouteResultDemo()
    {
      return RedirectToAction(@"FileStreamResultDemo");
    }

    /// <summary>
    /// PartialViewResult的用法（返回部分视图）
    /// http://localhost:30735/home/PartialViewResultDemo
    /// </summary>
    /// <returns></returns>
    public PartialViewResult PartialViewResultDemo()
    {
      return PartialView();
    }

   /// <summary>
   /// ViewResult的用法（返回视图）
    /// http://localhost:30735/home/ViewResultDemo
   /// </summary>
   /// <returns></returns>
    public ActionResult ViewResultDemo()
    {
      //如果没有传入View名称, 默认寻找与Action名称相同的View页面.
      return View();
    }
  }
}
```
