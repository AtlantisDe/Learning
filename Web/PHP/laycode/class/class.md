# class

```php
<?php

class DomainController
{

    public function index()
    {
        print_r("nihao");
    }
    function property_domain($host, $beizhu)
    {
        $data['host'] = $host;
        $data['beizhu'] = $beizhu;
        return $data;
    }

    public function domain()
    {
        $data = null;
        $data[] = $this->property_domain("www.baidu.com", "百度");
        $data[] = $this->property_domain("www.google.cn", "谷歌");
        return $data;
    }
    public function domainJson()
    {
        echo json_encode($this->domain());
    }
}
$c = 'nothing';
if (isset($_GET['c']) && $name = $_GET['c']) {
    $c = $_GET['c'];
} else { }

$DomainController = new DomainController();

switch ($c) {
    case "domain":
        $DomainController->domain();
        break;
    case "domainJson":
        $DomainController->domainJson();
        break;
    case "nothing":
        $DomainController->index();
        break;
}

```
