# Parallel Http

```c#
            Parallel.For(0, 1000000, new ParallelOptions() { MaxDegreeOfParallelism =5000}, (i, loopState) =>
            {
                using (HttpClient client = new HttpClient())
                {
                    try
                    {
                        Task<HttpResponseMessage> response = client.GetAsync("http://127.0.0.1:11209/");
                        response.Wait();

                    }
                    catch (HttpRequestException e)
                    {
                        Console.WriteLine("\nException Caught!");
                        Console.WriteLine("Message :{0} ", e.Message);
                    }
                }
            });
```
