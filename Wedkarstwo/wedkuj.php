<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wedkowanie</title>
    <link rel="stylesheet" href="styl_1.css">
</head>

<body>
    <div class="main">
        <div class="baner">
            <h1>Portal dla wedkarzy</h1>
        </div>
        <div class="lewy_gora">
            <h3>Ryby zamieszkujace rzeki</h3>
            <?php
            $conn = mysqli_connect('localhost', 'root', '', 'wedkowanie');
            $wyswietl1 = "SELECT nazwa, akwen, wojewodztwo FROM ryby INNER JOIN lowisko ON Ryby.id = lowisko.ryby_id WHERE rodzaj = '3'";

            $qq1 = mysqli_query($conn, $wyswietl1);
            echo "<ol>";


            while ($ww = mysqli_fetch_array($qq1)) {
                echo "<li>" . $ww[0] . " plywa w rzece" . " " . $ww[1] . " " . $ww[2];
            }

            ?>

        </div>
        <div class="prawy">
            <img src="ryba1.jpg" alt="Sum">
            <br>
            <a href="kwerendy.txt" download="kwerendy.txt">Pobierz</a>
        </div>
        <div class="lewy_dol">
            <h3>Ryby drapiezne naszych wód</h3>

            <?php
            $conn = mysqli_connect('localhost', 'root', '', 'wedkowanie');
            $zapytanie = "SELECT id, nazwa, wystepowanie FROM ryby WHERE styl_zycia = '1'";
            $qq2 = mysqli_query($conn, $zapytanie);

            echo "<table>";
            echo "<tr>";
            echo "<th>L.p</th>";
            echo "<th>Gatunek</th>";
            echo "<th>Występowanie</th>";
            echo "</tr>";

            while ($ww = mysqli_fetch_array($qq2)) {
                echo "<tr><td>" . $ww[0] . "</td><td>" . $ww[1] . "</td><td>" . $ww[2] . "</td></tr>";
            }
            echo "</table>"
            ?>

        </div>

        <div class="footer">
            <p>Strone Wykonal: Wiktor Dziendziel</p>
        </div>
    </div>
</body>

</html>