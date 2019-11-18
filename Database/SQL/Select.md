# Select

```sql
SELECT t_urls.*
FROM   t_urls
WHERE  t_urls.url LIKE '%/news/%'  AND  t_urls.linktype != 1 ORDER BY T_urls.addtime DESC
```
