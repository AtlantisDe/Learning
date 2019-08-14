<?php
/*
 * 读写redis配置
 * 读写数组下标相同，为主从关系
 */
$write_array=array(
    0=>array('ip'=>'172.16.10.23','port'=>6379,'time_out'=>0.3,'pwd'=>'123456','db'=>1),
    1=>array('ip'=>'172.16.10.23','port'=>6379,'time_out'=>0.3,'pwd'=>'123456','db'=>1)
);

$read_array=array(
    0=>array(
        array('ip'=>'172.16.10.23','port'=>6379,'time_out'=>0.3,'pwd'=>'654321','db'=>1),
        array('ip'=>'172.16.10.23','port'=>6379,'time_out'=>0.3,'pwd'=>'123456','db'=>1)
    ),
    1=>array(
        array('ip'=>'172.16.10.23','port'=>6379,'time_out'=>0.3,'pwd'=>'5678765','db'=>1),
        array('ip'=>'172.16.10.23','port'=>6379,'time_out'=>0.3,'pwd'=>'345678','db'=>1)
    )
);

?>