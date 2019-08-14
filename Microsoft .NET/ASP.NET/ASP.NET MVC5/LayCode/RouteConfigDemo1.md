# RouteConfig Demo

## Demo Code

```c#
public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");



            routes.MapRoute(
                name: "App",
                url: "App/{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapPageRoute(
                routeName: "ApiOld",
                routeUrl: "Module/Consol/api.aspx",
                physicalFile: "~/Controllers/App/Console/Api/Api/api.aspx"
            );



            routes.MapRoute(
               name: "Default",
               url: "{controller}/{action}/{id}",
               defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
           );

        }
```
