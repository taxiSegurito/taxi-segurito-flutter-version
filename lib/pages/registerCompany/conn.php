<?php
// parameters
$dsn = 'mysql:host=localhost;port=3306;dbname=taxisegurito;';
$username = 'root';
$password = 'Univalle';
$options = array(
  PDO::ATTR_EMULATE_PREPARES => false,
  PDO::ATTR_ERRMODE,
  PDO::ERRMODE_EXCEPTION
);

try {
  $db = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
  echo $e->getMessage();
  die();
}
