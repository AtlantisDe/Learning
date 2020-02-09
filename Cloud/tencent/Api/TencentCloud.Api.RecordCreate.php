<?php
$way = "GET";//POST或GET二选一，注意是大写，不能写小写
$uri = "cns.api.qcloud.com";
$path = "/v2/index.php?";

// 密钥信息
$SecretKey = "aaa";
$param["SecretId"] = "bbb";

// 接口参数，
$param["Action"] = "RecordCreate";
$param["domain"] = "baidu.com";
$param["subDomain"] = "@";
$param["recordType"] = "A";
$param["recordLine"] = "默认";
$param["value"] = "127.0.0.1";
$param["ttl"] = "1800";

// 公共参数，不需要修改
$param["Nonce"] = rand();//生成随机数
$param["Timestamp"] = time();//当前时间戳
$param["Version"] = "2017-03-12";//api版本号


// 参数排序
ksort($param);
// 字符串拼接
$signStr = "";
foreach ( $param as $key => $value ) {
    $signStr = $signStr . $key . "=" . $value . "&";
}
$signStr0 = "curl \"" . "https://" . $uri . $path . $signStr;
$signStr1 = "curl -d \"" . $signStr;
$signStr = $way . $uri . $path . substr($signStr, 0, -1);
// 生成签名
$signature = base64_encode(hash_hmac("sha1", $signStr, $SecretKey, true));
$finalsignature = urlencode($signature);  

if($way == "GET")
echo $signStr0 . "Signature=" . $finalsignature . "\"";
else if($way == "POST")
echo $signStr1 . "Signature=" . $finalsignature . "\" \"https://" . $uri . $path . "\"";
?>