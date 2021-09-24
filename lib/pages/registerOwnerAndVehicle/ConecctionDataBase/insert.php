<?php
    require "conn.php";
    $fullName = $_POST['nombre'];
    $carnet = $_POST['telefono'];
    $nationality = $_POST['nationality'];
    $phoneNumber = $_POST['phoneNumber'];
    $model = $_POST['model'];
    $plaqueNumber = $_POST['plaqueNumber'];
    $color = $_POST['color'];
    $capacity = $_POST['capacity'];

    $sql = "INSERT INTO owners ('fullName', 'carnet', 'nationality', 'phoneNumber', 'model', 'plaqueNumber', 'color', 'capacity')
      VALUES('$fullName', '$carnet', '$nationality', '$phoneNumber', '$model', '$plaqueNumber', '$color', '$capacity' )";
    
    $query = $mysqli->query($sql);
    
?>
