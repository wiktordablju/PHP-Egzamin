<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    $connect = mysqli_connect('localhost', 'root', '', 'sklep');
    $query = " SELECT nazwa, kraj FROM klient WHERE kraj = 'USA'";
    $exe = mysqli_query($connect, $query);

    echo "
        <table>
        <tr>
        <th>nazwa</th>
        <th>kraj</th>
        </tr>
        ";

    while ($row = $exe->fetch_assoc()) {
        echo "<tr>
        <td>" . $row['nazwa'] . "</td>
        <td>" . $row['kraj'] . "</td>";
    }
    echo "</table>";

    echo "<h6>---------------------------------------------------</h6>";

    $query = "SELECT klient.nazwa, zamowienie.typ_zaplaty FROM zamowienie INNER JOIN klient ON zamowienie.klient_id = klient.id WHERE zamowienie.typ_zaplaty = 'KREDYT';";
    $exe = mysqli_query($connect, $query);

    echo "
        <table border=1>
        <tr>
        <th>nazwa</th>
        <th>typ zaplaty</th>
        </tr>
        ";

    while ($row = $exe->fetch_assoc()) {
        echo "<tr>
        <td>" . $row['nazwa'] . "</td>
        <td>" . $row['typ_zaplaty'] . "</td>";
    }
    echo "</table>";

    echo "<h6>---------------------------------------------------</h6>";

    $query = "SELECT klient.nazwa as klient, region.nazwa as kraj FROM region INNER JOIN klient ON region.id = klient.region_id WHERE region.nazwa='Afryka';";
    $exe = mysqli_query($connect, $query);

    echo "<ol>";
    while ($row = $exe->fetch_assoc()) {
        echo "
        <li>" . $row['klient'] . "</li>
        <li>" . $row['kraj'] . "</li>";
    }
    echo "</ol>";

    echo "<h6>---------------------------------------------------</h6>";

    $query = "SELECT produkt.nazwa, pozycja.ilosc_sprzedana FROM produkt INNER JOIN pozycja ON produkt.id = pozycja.produkt_id ORDER BY pozycja.ilosc_sprzedana ASC LIMIT 4";
    $exe = mysqli_query($connect, $query);

    echo "<ul>";
    while ($row = $exe->fetch_assoc()) {
        echo "
        <li>" . $row['nazwa'] . "-" . $row['ilosc_sprzedana'] . "</li>";
    }
    echo "</ul>";

    mysqli_close($connect);
    ?>
</body>

</html>