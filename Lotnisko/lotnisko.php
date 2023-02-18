<?php

if(!isset($_COOKIE['moje'])) {
    setcookie('moje', 'ciasteczko1', time()+7200);
    $cookie="Dzień dobry! Strona lotniska używa ciasteczek";
}
else {
    $cookie="Witaj ponownie na stronie lotniska";
}
?>

<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Port Lotniczy</title>
    <link rel="stylesheet" href="styl5.css">
</head>

<body>
    <header>
        <section class="jeden"><img src="zad5.png" alt="logo lotnisko"></section>

        <section class="dwa">
            <h1>Przyloty</h1>
        </section>

        <section class="trzy">
            <h3>przydatne link</h3>
            <a href="kwerendy.txt" download="kwerendy.txt">Pobierz...</a>
        </section>
    </header>

    <main>
        <?php
        $conn = mysqli_connect("127.0.0.1", "root", "", "egzamin_dziendziel");
        $zapytanie = "SELECT czas, kierunek, nr_rejsu, status_lotu FROM przyloty ORDER BY czas ASC";
        $wykonaj = mysqli_query($conn, $zapytanie);

        echo "<table>
            <tr>
            <th>czas</th>
            <th>kierunek</th>
            <th>numer rejsu</th>
            <th>status</th>
            </tr>";
           while($row=$wykonaj->fetch_assoc()) {
            echo "<tr>
            <td>".$row['czas']."</td>
            <td>".$row['kierunek']."</td>
            <td>".$row['nr_rejsu']."</td>
            <td>".$row['status_lotu']."</td>";
           }
        echo "</table>";
        mysqli_close($conn);
        ?>

    </main>

    <section class="lewo">
        <?php
        if($cookie == "Dzień dobry! Strona lotniska używa ciasteczek"){
            echo"<p><b>".$cookie."</b></p>";
        }  
        else {
            echo"<p><i>".$cookie."</i></p>";
        }

        ?>
    </section>
    <section class="prawo">
        Autor: Wiktor Dziendziel
    </section>


</body>

</html>