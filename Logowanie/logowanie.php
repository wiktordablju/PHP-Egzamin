<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width= , initial-scale=1.0">
    <title>Zaloguj sie</title>
</head>

<body>
    <div>
        <a href="index.php">Powrot do strony glownej</a>
        <h1>Zaloguj sie</h1>

        <form action="logowanie.php" method="post">
            <div>
                <label for="">Login</label><br><input type="text" name="login">
            </div>
            <div>
                <label for="">Haslo</label><br><input type="password" name="haslo">
            </div>
            <input type="submit" name="loguj" value="zaloguj sie">
        </form>
        <a href="zarejestruj.php">Zarejestruj</a>
        <?php
        require_once "db.php";

        if (isset($_POST['login'])) {
            $login = $_POST['login'];
            $haslo = $_POST['haslo'];
            $haslo = hash('sha256', $haslo);
            $query = "SELECT * FROM loginy WHERE login='$login' AND haslo='$haslo'";
            $result = $pdo->query($query);
            $row = $result->fetchAll();

            if(count($row)>=1) {
                session_start();
                $_SESSION['zalogowany'] = true;
                $_SESSION['login'] = $login;
                header('Location: index.php');
            }
            else {
                echo "Niepoprawny login lub haslo";
            }
        }
        ?>
    </div>
</body>

</html>