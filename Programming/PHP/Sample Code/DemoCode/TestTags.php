<?php

class getValues {
    function __construct($inputArray){
         $this->inputArray = $inputArray;
    }
    
     public function inputValue($inputArray) {
         $this->inputArray = $inputArray;
     }
     public function getValue($number) {
         $this->number = $number;
         for($i = 0; $i < $this->number; $i ++) {
           $count = count ( $this->inputArray ) - 1 - $i;
           $index = rand ( 0, $count);
           $getArray [$i] = $this->inputArray [$index];
           $temp = $this->inputArray [$count];
           $this->inputArray [$count] = $this->inputArray [$index];
           $this->inputArray [$index] = $temp;
         }
        
         return $getArray;
     }
 }
// $array1 = array("MIP","PC","Html");
// $array2 = array("3","6","9","26");

$array1 = explode(",","MIP,PC,Html");
$array2 = explode(",","26,3,6,9");
$result = array_merge($array1, $array2);


/*使用方法实例 后面写取多少个随机数出来*/

$getValue=new getValues($result);
$arr = $getValue->getValue(5);

$ok = implode(",",$arr);
print_r($ok);


?>
