<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>KINO "Za rogiem"</title>
    <link rel="stylesheet" href="style.css" />
</head>

<body>
    <main>
        <header><img src="baner.jpg" alt="baner" /></header>
        <aside>
            <ol>
                <li><a href="index.html">Strona Główna</a></li>
            </ol>
            <hr>
            <form method="POST">
                Data i godzina seansu
                <br>
                <input type="date" name="date">
                <input type="time" name="time">
                <input type="submit" value="Pokaż">
            </form>
        </aside>
        <article>
            <?php
            $conn = mysqli_connect('localhost', 'root', '', 'kino');
            if (mysqli_connect_errno()!=0) {
                echo "wystapil blad polecznia";
            }
            else {
            $date = $_POST['date'];
            $time = $_POST['time'];
            $charset = "UTF8";
            mysqli_set_charset($conn, $charset);
            if (!empty($date) && !empty($time)) {

            $kwerenda = "SELECT rzad, miejsce from rezerwacje where date = '" . $date . "'AND godzina = '" . $time . "'";
            $wykonaj = mysqli_query($conn, $kwerenda);

    

                for ($i = 1; $i <= 15; $i++)
                    for ($j = 1; $j <= 20; $j++)
                        $tab[$i][$j] = 0;

                while($row=mysqli_fetch_assoc($wykonaj)) {
                    $tab[$row['rzad']][$row['miejsce']] = 1;
                }
                echo "<p>EKRAN</p>";
                echo "<table>";
                for ($i=1;$i<=15;$i++) {
                    echo "<tr><th>".$i.'</th>';
                    for ($j = 1; $j <= 20; $j++)
                        if ($tab[$i][$j] == 0) echo "<td class='wolne'>" . $j . "</td>";
                        else echo "<td class='zajete'>" . $j . "</td>";
                        
                    echo "</tr>";
                }
                echo "</table>";
            } else
                    echo "podaj poprawna date i godzine seansu";
            }
            $conn->close();

            ?>


        </article>

        <footer>
            <h5>Egzamin INF.03 - Wiktor Dziendziel 00000000000</h5>
        </footer>
    </main>
</body>

</html>