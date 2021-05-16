# REST Client

- [Huachao/vscode-restclient](https://github.com/Huachao/vscode-restclient)

## 常用 Usage

```c#
https://example.com/comments/1

POST https://example.com/comments HTTP/1.1
content-type: application/json

{
    "name": "sample",
    "time": "Wed, 21 Oct 2015 18:27:50 GMT"
}

GET https://example.com/comments/1 HTTP/1.1

###

GET https://example.com/topics/1 HTTP/1.1

###

POST https://example.com/comments HTTP/1.1
content-type: application/json

{
    "name": "sample",
    "time": "Wed, 21 Oct 2015 18:27:50 GMT"
}


@hostname = api.example.com
@port = 8080
@host = {{hostname}}:{{port}}
@contentType = application/json
@createdAt = {{$datetime iso8601}}
@modifiedBy = {{$processEnv USERNAME}}

###

@name = hello

GET https://{{host}}/authors/{{name}} HTTP/1.1

###

PATCH https://{{host}}/authors/{{name}} HTTP/1.1
Content-Type: {{contentType}}

{
    "content": "foo bar",
    "created_at": {{createdAt}},
    "modified_by": {{modifiedBy}}
}
```
