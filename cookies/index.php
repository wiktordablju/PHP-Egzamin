<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Cookies</title>
</head>

<body>
    <?php
    session_start();
    setcookie('visits', $_SESSION['visits'], time() + 86400);

    // Jak nie ma wizyt to je utworz z 0
    if (!isset($_SESSION['visits'])) {
        $_SESSION['visits'] = 0;
    } else {
        $_SESSION['visits'] += 1;
    }

    echo "Odwiedziłeś dziś tą witrynę " . $_SESSION['visits'] . " razy.";


    if (isset($_POST['create_cookie'])) {
        $cookie_name = $_POST['cookie_name'];


        if ($cookie_name == "") {
            echo '<br>Nie podałeś cookie do ustawienia';
        } else if (!isset($_COOKIE[$cookie_name])) {
            setcookie($cookie_name, 'test', time() + 86400); //86400 sekund to cały dzień
            echo "<br>Tworzę cookie o nazwie: " . $cookie_name;
        } else {
            echo "<br>Cookie o nazwie '" . $cookie_name . "' już istnieje.";
        }
    }
    ?>

    <form method="post">
        Nazwa ciasteczka: <input type="text" name="cookie_name">
        <input type="submit" name="create_cookie" value="Utwórz">
    </form>
</body>

</html>