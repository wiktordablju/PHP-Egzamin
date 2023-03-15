<?php
session_start();
const adultPrice = 80;
const kidsPrice = 50;

$selectedCity = $_POST['miejscowosc'];
$kids = $_POST['dzieci'];
$adults = $_POST['dorosli'];
$nights = $_POST['noclegi'];

$_SESSION['miasto'] = $selectedCity;
$_SESSION['kids'] = $kids;
$_SESSION['adult'] = $adults;
$_SESSION['night'] = $nights;

$totalCost = $adults * adultPrice * $nights + $kids * kidsPrice * $nights;
$_SESSION['total'] = $totalCost;
header('Location: index.php')
?>