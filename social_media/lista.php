<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista przyjaciół</title>
    <link rel="stylesheet" href="./styl.css">
</head>

<body>
    <section class="baner">
        <h1>Portal Społecznościowy - moje konto</h1>
    </section>

    <section class="glowny">
        <h2>Moje zainteresowania</h2>
        <ul>
            <li>muzyka</li>
            <li>film</li>
            <li>komputery</li>
        </ul>
        <h2>Moi znajomi</h2>
        <?php
        $conn = mysqli_connect('localhost', 'root', '', 'dane');

        $query = "SELECT imie, nazwisko, opis, zdjecie FROM osoby WHERE Hobby_id = 1 OR Hobby_id = 2 or Hobby_id = 6;";

        $exe = mysqli_query($conn, $query);

        while ($row = $exe->fetch_assoc()) {
            echo "
            <div class='kontener'>
                <div class='zdjecie'>
                    <img src='" . $row['zdjecie'] . "' alt='przyjaciel'>
                </div>
                <div class='opis'>
                    <h3>" . $row['imie'] . " " . $row['nazwisko'] . "</h3>
                    <p>Ostatni wpis: " .  $row['opis'] . "</p>
                    </div>
                <div></div>
            </div> 
            <div class='linia'>
                <hr>
            </div>
            ";
        }

        mysqli_close($conn);
        ?>



    </section>


    <section class="stopka">
        Stronę wykonał: 00000000000
    </section>

    <section class="stopka">
        <a href="mailto:ja@portal.pl">napisz do mnie</a>
    </section>
</body>

</html>