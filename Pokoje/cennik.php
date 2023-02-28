<head>
    <title>POKOJE</title>
    <link rel="stylesheet" href="./css/styl.css" />
</head>
<body>
    <header>
        <h2>WYNAJEM POKOI</h2>
    </header>
    <nav>
        <section class="menuone">
            <a href="./index.html">POKOJE</a>
        </section>
        <section class="menutwo">
            <a href="./cennik.php">CENNIK</a>
        </section>
        <section class="menuthree">
            <a href="./kalkulator.html">kalkulator</a>
        </section>
    </nav>
    <section class="banertwo"></section>
    <main>
        <section class="panellewy"></section>
        <section class="panelsrodkowy">
            <h1>Cennik</h1>
            <table>
                <?php
                $conn = mysqli_connect('localhost', 'root', '', 'pokoje');
                $query = "SELECT * FROM pokoje";
                $exe = mysqli_query($conn, $query);
                while($row = mysqli_fetch_array($exe)) {
                    echo "<tr>";
                    echo "<td>$row[0]</td>";
                    echo "<td>$row[1]</td>";
                    echo "<td>$row[2]</td>";
                    echo "</tr>";
                }
                mysqli_close($conn);
                ?>
            </table>
        </section>
        <section class="panelprawy"></section>
    </main>
    <footer>
        <p>Strone opracowal: 00000000000</p>
    </footer>
</body>