<?php

var_dump(GetUrlToDomain("www.news.com.cn"));
var_dump(GetUrlToDomain("1123.213213.news.com.cn"));
var_dump(GetUrlToDomain("baike.baidu.Google.com.cn"));
var_dump(GetUrlToDomain("www.news.com.cn"));
var_dump(GetUrlToDomain("www.news.com.cn"));



/**
 * 取得根域名
 * @param type $domain 域名
 * @return string 返回根域名
 */
function GetUrlToDomain($domain) {
    $re_domain = '';
    $domain_postfix_cn_array = array("com", "net", "org", "gov", "edu", "com.cn", "cn");
    $array_domain = explode(".", $domain);
    $array_num = count($array_domain) - 1;
    if ($array_domain[$array_num] == 'cn') {
        if (in_array($array_domain[$array_num - 1], $domain_postfix_cn_array)) {
            $re_domain = $array_domain[$array_num - 2] . "." . $array_domain[$array_num - 1] . "." . $array_domain[$array_num];
        } else {
            $re_domain = $array_domain[$array_num - 1] . "." . $array_domain[$array_num];
        }
    } else {
        $re_domain = $array_domain[$array_num - 1] . "." . $array_domain[$array_num];
    }
    return $re_domain;
}


/**
 * 取得根域名 "com", "net", "org", "gov", "edu", "cn"
 */
function GetUrlToDomainVersion2($domain) {
    $re_domain = ''; 
    $array_domain = explode(".", $domain);
    $array_num = count($array_domain) - 1;
    $re_domain = $array_domain[$array_num - 1] . "." . $array_domain[$array_num];
    
    return $re_domain;
}

?>