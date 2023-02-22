<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wycieczki i urlopy</title>
    <link rel="stylesheet" href="styl3.css">
</head>
<body>
    <header>
        <h1>BIURO PODRÓŻY</h1>
    </header>
    <section class="left">
        <h2>KONTAKT</h2>
        <a href="mailto="biuro@wycieczki.pl"" >napisz do nas</a>
        <p>telefon: 555666777</p>
    </section>
    <section class="mid">
        <h2>GALERIA</h2>
        <?php
        $conn = mysqli_connect('localhost', 'root', '', 'egzamin3');
        $query = "SELECT nazwaPliku, podpis FROM zdjecia ORDER BY podpis ASC";
        $execute = mysqli_query($conn, $query);
      
        while ($row=$execute->fetch_assoc()) {
            echo "<img src='$row[nazwaPliku]' alt='$row[podpis]'> ";
        }
        ?>
    </section> 
    <section class="right">
        <h2>PROMOCJE</h2>
        <table>
            <tr>
                <td>Jesień</td>
                <td>Grupa 4+</td>
                <td>Grupa 10+</td>
            </tr>
            <tr>
                <td>5%</td>    
                <td>10%</td>    
                <td>15%</td>    
            </tr>
        </table>
    </section>
    <section class="data">
        <h2>LISTA WYCIECZEK</h2>
        <?php
        $conn = mysqli_connect('localhost', 'root', '', 'egzamin3');
        $query =  "SELECT id, datawyjazdu, cel, cena FROM wycieczki WHERE dostepna='1'";
        $execute = mysqli_query($conn, $query);
        while($row=$execute->fetch_assoc()) {
            echo $row['id'] . " ";
            echo $row['datawyjazdu'] . " ";
            echo $row['cel'] . " ";
            echo "cena: ".$row['cena'] . " ";
            echo "<br>";
        }

        $execute->close();
        ?>
    </section>
    <footer>
        <p>Stronę wykonał: 00000000000</p>
    </footer>
</body>
</html>