<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona glowna</title>
</head>

<body>
    <div>
        <?php
        session_start();
        if (isset($_SESSION['zalogowany'])) {
            echo '<a href="logout.php">Wyloguj sie </a>';
        }
        else {
            echo '<a href="logowanie.php"> Zaloguj sie </a>';
        }


        ?>
    </div>
</body>

</html>