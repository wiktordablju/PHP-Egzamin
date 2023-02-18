<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Prywatne gabienty lekarskie - Lekarzex </title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css" />
</head>

<body>
    <main>
        <aside>
            <form method="POST">
                Wybierz datę wizyty
                <br>
                <input type="date" name="date">
                <input type="time" name="time">
                <input type="submit" value="Pokaż">
            </form>

            <div class="oznakowanie">
                <span >Oznakowanie:<br>Gabinet 1 - Stomatolog<br>Gabinet 2 - Okulista<br>Gabinet 3 - Dentysta<br>Gabinet 4 - Alergolog</span>
            </div>
        </aside>
        <article>
            <?php
            $conn = mysqli_connect('localhost', 'root', '', 'gabinety');
            if (mysqli_connect_errno()!=0) {
                echo "wystapil blad polecznia";
            }
            else {
            $date = $_POST['date'];
            $time = $_POST['time'];
            $charset = "UTF8";
            mysqli_set_charset($conn, $charset);
            if (!empty($date) && !empty($time)) {

            $kwerenda = "SELECT gabinet, lekarz from rezerwacje where data = '" . $date . "'AND godzina = '" . $time . "'";
            $wykonaj = mysqli_query($conn, $kwerenda);

    

                for ($i = 1; $i <= 4; $i++)
                    for ($j = 1; $j <= 4; $j++)
                        $tab[$i][$j] = 0;

                while($row=mysqli_fetch_assoc($wykonaj)) {
                    $tab[$row['gabinet']][$row['lekarz']] = 1;
                }
                echo "<p>GABINETY:</p>";
                echo "<table>";
                for ($i=1;$i<=4;$i++) {
                    echo "<tr><th>".$i.'</th>';
                    for ($j = 1; $j <= 4; $j++)
                        if ($tab[$i][$j] == 0) echo "<td class='wolne'>" . "Lekarz " . $j . "</td>";
                        else echo "<td class='zajete'>" . "Lekarz " . $j . "</td>";
                        
                    echo "</tr>";
                }
                echo "</table>";
            } else
                    echo "podaj poprawna date i godzine wizyty";
            }
            $conn->close();

            ?>


        </article>

    
    </main>
</body>

</html>