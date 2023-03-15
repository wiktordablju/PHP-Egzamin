<?php
$mysqlHost = 'localhost';
$port = '3306';
$username = 'root';
$password = '';
$database = 'logowanie';

try {
    $pdo = new PDO('mysql:host=' . $mysqlHost . ';dbname=' . $database . ';port=' . $port, $username, $password);
}
catch(PDOException $e) {
    echo 'Polaczenie nie moglo zostac utworzone';
}

?>