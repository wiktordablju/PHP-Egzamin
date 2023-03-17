<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hurtownia</title>
    <link rel="stylesheet" href="./css/main.css">
</head>

<body>
    <div class="ceny">
        <h1>Ceny owoców w hurtowni za kilogram</h1>
        <br>
        <?php
        $conn = mysqli_connect('127.0.0.1', 'root', '', 'hurtownia');
        $query = "SELECT nazwa, cena FROM owoce";
        $exe = mysqli_query($conn, $query);
        echo '<table>';
        echo '<tr>
        <td>Owoc</td>
        <td>Cena</td>
        </tr>
        ';
        while($row=$exe->fetch_assoc()) {
            echo '<tr>';
            echo '<td>' . $row['nazwa'] . '</td>';
            echo '<td>' . $row['cena'] . '</td>';
            echo '</tr>';

        }
        echo '</table>';
        ?>
    </div>
    <div class="form">
        <form action="" method="post">
            <label for="">Jaki owoc zamawiasz?</label>
            <select name="owoc">
                <option value="banan">Banan</option>
                <option value="brzoskwinia">Brzoskwinia</option>
                <option value="kiwi">Kiwi</option>
                <option value="jablko">Jablko</option>
                <option value="granat">Granat</option>
            </select>
            <br>
            <label for="">Ile kilogramow</label>
            <input type="number" name="ilosc">
            <br>
            <input type="submit" value="Pokaż cenę">
        </form>
        <?php
        $owoc = $_POST['owoc'];
        $ilosc = $_POST['ilosc'];
        $queryCena = "SELECT nazwa, cena FROM owoce WHERE nazwa='$owoc'";
        $exe = mysqli_query($conn, $queryCena);
        $row = $exe->fetch_assoc();
        echo '<br>';
        echo '<p>Cena za ' . $ilosc . 'kg ' . $row['nazwa'] . ' to: ' . $row['cena'] * $ilosc . 'zł';
        ?>
    </div>
</body>

</html>