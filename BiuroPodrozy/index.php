<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./css/style.css" />
    <title>Biuro Podróży</title>
</head>

<body>
    <header>
        <h1>Wczasy w Polsce</h1>
    </header>
    <main>
        <section>
            <form action="script.php" method="post">
                <h3>Formularz zgłoszeniowy</h3>
                <label for="miejscowosc">Wybierz miejscowość
                    <select name="miejscowosc" id="miejscowosc">
                        <option disabled selected value>-- wybierz miejscowość --</option>
                        <option value="gdansk">Gdańsk</option>
                        <option value="gdynia">Gdynia</option>
                        <option value="kolobrzeg">Kołobrzeg</option>
                        <option value="krynica_zdroj">Krynica Zdrój</option>
                        <option value="solina">Solina</option>
                        <option value="sopot">Sopot</option>
                        <option value="swinioujscie">Świnioujście</option>
                        <option value="ustron">Ustroń</option>
                        <option value="wisla">Wisła</option>
                        <option value="zakopane">Zakopane</option>
                    </select> </label><br />
                <label for="dzieci">Liczba dzieci (0-18 lat):

                    <input type="number" id="dzieci" name="dzieci" /></label><br />
                <label for="dorosli">Liczba dorosłych:

                    <input type="number" id="dorosli" name="dorosli" /></label><br />

                <label for="noclegi">Liczba noclegów:

                    <input type="number" id="noclegi" name="noclegi" /></label><br />

                <input type="submit">
                <h3 id="tytul"></h3>

                <p id="koszty">
                    <?php
			if (isset($_SESSION['miasto']) && isset($_SESSION['kids']) && isset($_SESSION['adult']) && isset($_SESSION['night'])){
                echo $_SESSION['miasto'] . '<br>';
			    echo 'Ilosc dzieci: ' . $_SESSION['kids'] . '<br>';
			    echo 'Ilosc doroslych: ' . $_SESSION['adult'] . '<br>';
			    echo 'Ilosc noclegow: ' . $_SESSION['night'] . '<br>';
			    echo 'Do zaplaty: ' . $_SESSION['total'] . '<br>';

            }
            
				
			?>
                </p>
            </form>
        </section>
        <aside>
            <h3 id="nazwa">Miejscowość</h3>
            <?php
			if (isset($_SESSION['miasto'])) {
				echo '<img src="img/' . $_SESSION['miasto'] . '.jpg" id="zdjecie">';
			}
			?>
        </aside>
    </main>
    <footer>
        <h2>Spółka cywilna "Wczasy w Polsce"</h2>
    </footer>
</body>

</html>