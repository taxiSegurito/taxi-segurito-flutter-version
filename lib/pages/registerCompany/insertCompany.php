<?php


include "../lib/pages/registerCompany/conn.php";

$pdo = $db;


$fullname = $_POST['fullname'];
$cellphone = $_POST['cellphone'];
$email = $_POST['email'];
$password = $_POST['password'];
$address = $_POST['address'];


try {

    $pdo->beginTransaction();
    $insertSql = "
      INSERT INTO `person`
        (`fullname`,`cellphone`)
      VALUES
        (:fullname, :cellphone)
  ";
    $insertSql2 = "
      INSERT INTO `user`
        (`idUser`, `email`,`password`)
      VALUES
        (:idUser, :email ,:password)
  ";
    $insertSql3 = "
      INSERT INTO `owner`
        (`idowner`, `address`)
      VALUES
        (:idowner, :address)";

    $statement = $pdo->prepare($insertSql);
    $statement->execute(array(
        "fullname" => $fullname,
        "cellphone" => $cellphone,
    ));
    $idPerson = $pdo->lastInsertId();
    $idowner = $idPerson;
    $statement2 = $pdo->prepare($insertSql2);
    $statement2->execute(array(
        "idUser" => $idPerson,
        "email" => $email,
        "password" => $password,
    ));
    $statement3 = $pdo->prepare($insertSql3);
    $statement3->execute(array(
        "idowner" => $idowner,
        "address" => $address,
    ));

    $pdo->commit();

    echo json_encode("Success");
} catch (\Exception $e) {
    $pdo->rollback();
    echo json_encode($e);
}
