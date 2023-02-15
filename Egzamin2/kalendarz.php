<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mój kalendarz</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <header>
        <div class="headerLogo"> <img src="./images/logo1.png" alt="Mój kalendarz"> </div>
        <div class="headerTresc">
            <h1>KALENDARZ</h1>
            <?php
            $conn = mysqli_connect('localhost', 'root', '', 'baza5');
            $query = "SELECT miesiac, rok FROM `zadania` WHERE dataZadania = '2020-07-01'";
            $execute = mysqli_query($conn, $query);
            echo "<h3>";
            while($row=$execute->fetch_assoc()) {
                echo "miesiąc: " . $row['miesiac'] . " <br>rok: " . $row['rok']; 
            }
            echo "</h3>"
            ?>
        </div>
    </header>

    <main>
        <?php
        $query = "SELECT dataZadania, wpis FROM `zadania` WHERE miesiac='Lipiec'";
        $execute = mysqli_query($conn, $query);
        while($row=$execute->fetch_assoc()) {
            echo '<div class="blok"> ';
            echo $row['dataZadania'];
            echo '<br>';
            echo "<p> " . $row['wpis'] . "</p>";
            echo '</div>';
        }
        ?>
    </main>

    <footer>
        <form action="" method="POST">
            <label for="">
                dodaj wpis:
                <input type="text" name="wpis">
                <input type="submit" value="DODAJ">
            </label>
        </form>
        <?php
        $query = "UPDATE zadania SET wpis='$_POST[wpis]' WHERE dataZadania='2020-07-13'";
        $execute = mysqli_query($conn, $query);
        
        if($execute === TRUE) {
            
        }
       

        

        $conn->close();

        ?>


        <p>Stronę wykonał: 00000000000</p>
    </footer>


</body>

</html>