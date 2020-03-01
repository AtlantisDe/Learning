# PageEach

```c#
// Redis
var startIndex = (root.Pagination.PageIndex - 1) * root.Pagination.PageSize;
var endIndex = startIndex + root.Pagination.PageSize;

// SQL
var startIndex = (root.Pagination.PageIndex - 1) * root.Pagination.PageSize;
var endIndex = root.Pagination.PageSize;

PageExtenions.PageEach(1000, 20, CurrentExecutCount =>
{
    try
    {

    }
    catch (Exception ex)
    {
    }
});

CsharpLazycode.Module.Page.Utilities.PageEach

CsharpLazycode.Module.Page.Utilities.PageEach(urlsguiditems, 2, list =>
  {
      try
      {

      }
      catch (Exception ex)
      {
      }
  });



PageExtenions.PageEach(GoCount, 1000, CurrentExecutCount =>
{
  ListStrings = new List<string>();
  for (int i = 0; i < CurrentExecutCount; i++)
  { }
});

```
