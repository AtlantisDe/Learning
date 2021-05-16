<?php
/**
* php正则验证密码规则
* 只允许 数字、字母、下划线
* 最短6位、最长16位
* 搜集整理：www.jbxue.com
*/
function ispassword($str) {
if (preg_match('/^[_0-9a-z]{6,16}$/i',$str)){
return true;
}else {
return false;
}
}
$password = 'abcde@';
if(ispassword($password)) {
 echo '符合';
}else {
 echo '不符合';
}
//output  不符合

echo '<br>';
$password = 'abcdeasdas_1324';
if(ispassword($password)) {
 echo '符合';
}else {
 echo '不符合';
}
//output  符合



echo '<br>';
$password = '111111111';
if(ispassword($password)) {
 echo '符合';
}else {
 echo '不符合';
}

echo '<br>';
$password = 'Aa_demo1122demo';
if(ispassword($password)) {
 echo '符合';
}else {
 echo '不符合';
}

echo '<br>';
$password = 'ABC111111111111';
if(ispassword($password)) {
 echo '符合';
}else {
 echo '不符合';
}

?>