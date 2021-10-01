<?php
include "../Diagnostico/conn.php";
$pdo = $db;
$name = isset($_POST['name']) ? $_POST['name'] : "";
$nit = isset($_POST['nit']) ? $_POST['nit'] : "";
try {
    $pdo->beginTransaction();
    $insertSql = "
    INSERT INTO `company`(`name`,`state`, `NIT`) 
    VALUES (:name,1, :nit)
  ";
    $statement = $pdo->prepare($insertSql);
    $statement->execute(array(
        "name" => $name,
        "nit" => $nit,
    ));
    $pdo->commit();
    echo json_encode("Success");
} catch (\Exception $e) {
    $db->rollback();
    echo json_encode($e);
}