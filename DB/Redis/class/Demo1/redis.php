<?php
 /*
   redis 操作类，适用于单台或多台、多组redis服务器操作

   使用方法：
   1、$rs=new mz_redis();$rs->load_config_file('redis_config1.php');$www=$rs->connect(1,true,0)==单台读连接，连接read_array第一个元素对应的redis服务器中的随机一台;$rs->get($www[0],'abc'),获取$www连接对象里的'abc'key的值。
   2、$rs=new mz_redis();$rs->load_config_file('redis_config2.php');$www=$rs->connect(1,true,1)==单台读连接，连接read_array第二个元素对应的redis服务器中的随机一台
   3、$rs=new mz_redis();$rs->load_config_file('redis_config3.php');$www=$rs->connect(1,false,0)==多台读连接，连接read_array每一个元素对应的redis服务器中的随机一台;数组形式的连接对象$www，需要循环去操作，与第一种方式有所区别
   4、$rs=new mz_redis();$rs->load_config_file('redis_config4.php');$www=$rs->connect(2,false,0)==多台写连接，连接write_array每一个元素对应的redis服务器
   5、$rs=new mz_redis();$rs->load_config_file('redis_config5.php');$www=$rs->connect(2,true,0)==单台写连接，连接write_array第一个元素对应的redis服务器
   注意：$www是数组，redis有很多操作方法，本类并未完全包括，简单的都可以自己扩展，这个类主要“单台或多台、多组redis服务器连接操作”
   有问题联系 QQ 8704953 。
 */

class pub_redis{

    private $read_link=array();   // 一维数组读资源
    private $write_link=array();  // 一维数组写资源

    private $read_array=array();  // 二维数组
    private $write_array=array(); // 二维数组

    /*
     * 构造函数
    */
    public function __construct(){

        if (!extension_loaded('redis')) {
            exit('服务器不支持redis扩展');
        }

    }

    /*
     * 初始化 redis 读写配置数组，都是二维数组
     * 不能业务类型的redis应用，配置到不同的文件中
     * 切换不同业务类型redis的连接，只需要执行本方法导入不同的redis配置文件，然后connect()
    */
    public function load_config_file($redis_config_file='redis_config1.php'){

        require_once($redis_config_file);
        $this->read_array=$read_array;
        $this->write_array=$write_array;
        $read_array=$write_array=null;

    }

    /*
     * 连接函数，redis链接入口
     * $single==true,单台操作 ； false就是多台操作
     * type==1:read ； type==2:write
     * $index，单台操作，指定操作某一台，数组的索引
     * 返回redis链接资源，一维数组形式，下标为从0开始的数字
    */
    public function connect($type=1,$single=true,$index=0){ 

        if($type==1){
            if($single){
                $idx=array_rand($this->read_array[$index]);
                $data=array(array($this->read_array[$index][$idx]));
            }
            else{
                $data=array();
                foreach($this->read_array as $key=>$val){
                    $idx=array_rand($val);
                    $data[]=array($this->read_array[$key][$idx]);
                }
            }
            $this->mz_connect($data,$this->read_link,$single,$index);
            $rs=$this->read_link;
        }
        else if($type==2){
            $this->mz_connect($this->write_array,$this->write_link,$single,$index);
            $rs=$this->write_link;
        }
        else{
            exit('参数错误');
        }

        sort($rs);
        return $rs;

    }

    /*
     * 连接资源数组化
    */
    public function mz_connect($array,&$link,$single,$index){ 
        if($single){
            if(!isset($link[$array[$index]['ip']]) || $link[$array[$index]['ip']]===false){
                $link[$array[$index]['ip']]=$this->do_connect($array[$index]['ip'],$array[$index]['pwd'],$array[$index]['port'],$array[$index]['time_out'],$array[$index]['db']);
            }
        }
        else{
            $num=count($array);
            for($i=0;$i<$num;++$i){
                $index=array_rand($array);
                if(!isset($link[$array[$index]['ip']]) || $link[$array[$index]['ip']]===false){
                    $link[$array[$index]['ip']]=$this->do_connect($array[$index]['ip'],$array[$index]['pwd'],$array[$index]['port'],$array[$index]['time_out'],$array[$index]['db']);
                }
                unset($array[$index]);
            }
        }
    }

    /*
     * 连接函数，执行连接
     * 连接redis与选择数据库，并确认是否可以正常连接，连接不上就返回false
    */
    public function do_connect($ip,$pwd='',$port=6379,$time_out=0.3,$db=1){

        $redis = new Redis();
        try {
            $redis->connect($ip,$port,$time_out); 
            if($pwd!=''){
                $redis->auth($pwd);
            }
            $redis->select($db);

        } catch (Exception $e) {
            $redis=false;
        }
        return $redis;
    }

    /*
     * 判断key是否存在
     * $obj redis连接对象
    */
    public function key_exists($obj,$key){
        return $obj->exists($key);
    }

    /*
     * 判断key剩余有效时间，单位秒
     * $obj redis连接对象
    */
    public function get_ttl($obj,$key){
        return $obj->ttl($key);
    }

    /*
     * 获取字符串对象
     * $obj redis连接对象
    */
    public function get($obj,$key){
        return json_decode($obj->get($key));
    }

    /*
     * 设置字符串，带生存时间
     * $obj redis连接对象
    */
    public function set($obj,$key,$time,$value){
        $str=json_encode($value);
        return $obj->setex($key,$time,$str);
    }

    /*
     * 设置锁
     * $obj redis连接对象
     * $str， 字符串
    */
    public function set_lock($obj,$key,$value){
        return $obj->setnx($key,$value);
    }

    /*
     * 删除key
     * $obj redis连接对象
    */
    public function delete_key($obj,$key){
        return $obj->delete($key);
    }

    /*
     * 链表增加多个元素
     * $obj redis连接对象
    */
    public function list_add_element($obj,$key,$array,$direction='left'){
        if(!is_array($array)){
            $array=array($array);
        }
        foreach($array as $val){
            ($direction == 'left') ? $obj->lPush($key, json_encode($val)) : $obj->rPush($key, json_encode($val));
        }
    }

    /*
     * 链表弹出多个元素
     * $obj redis连接对象
     * 返回数组
    */
    public function list_pop_element($obj,$key,$num=1,$direction='right') {
        for($i=0;$i<$num;$i++){
           $value = ($direction == 'right') ? $obj->rPop($key) : $obj->lPop($key);
           $data[]=json_decode($value);
        }
        return $data;
    }

    /*
     * 哈希表新增或修改元素
     * $obj redis连接对象
     * $array 关联数组
    */
    public function hash_set($obj,$key,$array){
        if(!$is_array($array)){
            exit('设置哈希表参数异常');
        }
        $obj->hmset($key,$array);
    }

    /*
     * 哈希表读取元素
     * $obj redis连接对象
     * $array 关联数组
    */
    public function hash_get($obj,$key,$array){
        if(!$is_array($array)){
            return $obj->hget($key,$array);
        }
        return $obj->hmget($key,$array);
    }

}

?>