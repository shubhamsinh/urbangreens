<?php

$dns='mysql:host=https://urbangreens.000webhostapp.com;dbname=id18585216_urban_greens';
$user='urbangreens';
$pass='8G<fNC?A@r_j6mcm';

try{
    $db = new PDO($dns,$user,$pass);
    echo 'connected';
}catch(PDOException $e){
    $error=$e->getMessage();
    echo $error;
}
?>