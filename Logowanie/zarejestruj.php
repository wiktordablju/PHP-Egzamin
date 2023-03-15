<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width= , initial-scale=1.0">
    <title>Zarejestruj</title>
</head>

<body>
    <div>
        <a href="index.php">Powrot do strony glownej</a>
        <h1>Zarejestruj sie</h1>

        <form action="zarejestruj.php" method="post">
            <div>
                <label for="login">Login</label><br><input type="text" name="login">
            </div>
            <div>
                <label for="haslo">Haslo</label><br><input type="password" name="haslo">
            </div>
            <div>
                <label for="haslo2">Powtorz haslo</label><br><input type="password" name="haslo2">
            </div>
            <input type="submit" name="loguj" value="Zarejestruj">
        </form>
        <?php
        require_once "db.php";

        if (isset($_POST['login'])) {
            $login = $_POST['login'];
            $haslo = $_POST['haslo'];
            $haslo2 = $_POST['haslo2'];

            if($haslo == $haslo2) {
                $haslo = hash('sha256', $haslo);
                $query = "INSERT INTO loginy (login, haslo) VALUES ('$login', '$haslo')";
                $pdo->query($query);
                echo "Zarejestrowano";
            }
            else {
                echo 'Haslo nie jest poprawne';
            }
        }
        else {
            echo 'essa';
        }


        ?>
    </div>
</body>

</html>