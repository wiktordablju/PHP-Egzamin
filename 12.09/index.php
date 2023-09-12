<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dziendziel 5aT</title>
</head>

<!-- Dwie pierwsze tabela, trzecia ol, czwarta ul -->

<body>

    <?php
    $connect = mysqli_connect('localhost', 'root', '', 'sklep');

    // Kwerenda 1.
    $query = "SELECT klient.nazwa, pracownik.nazwisko, pracownik.stanowisko FROM klient INNER JOIN pracownik ON klient.pracownik_id = pracownik.id ORDER BY pracownik.nazwisko ASC;";
    $exe = mysqli_query($connect, $query);

    echo "
        <table border=1>
        <tr>
        <th>Nazwa Klienta</th>
        <th>Nazwisko pracownika</th>
        <th>Stanowisko pracownika</th>
        </tr>
        ";

    while ($row = $exe->fetch_assoc()) {
        echo "<tr>
        <td>" . $row['nazwa'] . "</td>
        <td>" . $row['nazwisko'] . "</td>
        <td>" . $row['stanowisko'] . "</td>";
    }
    echo "</table>";

    echo "<h1>--------------------------------------------------</h1>";

    // Kwerenda 2

    $query = "SELECT ocena_kredytowa, COUNT(*) as 'ZDOLNOŚĆ KREDYTOWA' FROM klient GROUP BY ocena_kredytowa;";
    $exe = mysqli_query($connect, $query);

    echo "
        <table border=1>
        <tr>
        <th>Ocena Kredytowa</th>
        <th>Zdolnośc Kredytowa</th>
        </tr>
        ";

    while ($row = $exe->fetch_assoc()) {
        echo "<tr>
        <td>" . $row['ocena_kredytowa'] . "</td>
        <td>" . $row['ZDOLNOŚĆ KREDYTOWA'] . "</td>";
    }
    echo "</table>";

    echo "<h1>--------------------------------------------------</h1>";

    // Kwerenda 3

    $query = "SELECT produkt.nazwa, pozycja.ilosc_sprzedana FROM produkt INNER JOIN pozycja ON produkt.id = pozycja.produkt_id ORDER BY pozycja.ilosc_sprzedana DESC LIMIT 5;";
    $exe = mysqli_query($connect, $query);

    echo "
    <ol>
    ";

    while ($row = $exe->fetch_assoc()) {
        echo "
        <li>" . $row['nazwa'] . " - " . $row['ilosc_sprzedana'] . "</li>";
    }
    echo "</ol>";

    echo "<h1>--------------------------------------------------</h1>";

    // Kwerenda 4.

    $query = "SELECT klient.nazwa, zamowienie.typ_zaplaty FROM klient INNER JOIN zamowienie ON klient.id = zamowienie.klient_id WHERE zamowienie.typ_zaplaty = 'GOTOWKA' AND klient.nazwa LIKE 'O%';";
    $exe = mysqli_query($connect, $query);

    echo "
    <ol>
    ";

    while ($row = $exe->fetch_assoc()) {
        echo "
        <li>" . $row['nazwa'] . " - " . $row['typ_zaplaty'] . "</li>";
    }
    echo "</ol>";


    mysqli_close($connect);

    ?>

</body>

</html>