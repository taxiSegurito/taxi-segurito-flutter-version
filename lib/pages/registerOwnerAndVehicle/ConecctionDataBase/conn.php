<?php
try{
    $conn = new PDO('mysql:host=localhost, dbname=id17645085_duenos', 'id17645085_root', 'loquito123C!');
    $conn ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "yes Connected";

    }catch(PDOException $ex){
    echo $ex ->getMessage();
    die("could not connect");
    }
?>