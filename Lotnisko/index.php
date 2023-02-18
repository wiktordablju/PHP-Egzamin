<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dziendziel4aT</title>
    <link rel="stylesheet" href="style.css">
    </link>
</head>

<body>
    <header>
        <h1>Sklep samochodowy</h1>
        <p>Przykładowy tekst</p>
    </header>
    <div class="main">
        <?php
        $images = array(1, 3, 4, 5, 6, 7, 8, 9,);

        shuffle($images);

        $i = 0;
        foreach ($images as $img ) {
            if($i==3) break;
            echo"<div class='image'>"."<img src='images/$img.png'>"."</div>";
            $i++;
        }

        $url=$_SERVER['REQUEST_URI'];
        header("Refresh: 5; URL=$url");
        ?>
    </div>
</body>

</html>