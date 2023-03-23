<?php
// WSZYSTKIE WAZNE RZECZY DO SPRAWDZIANU Z PHP 

// OPIS SPRAWDZIANU (LIBRUS): Obsługa bazy - połączenie z bazą, obsługa i wyświetlanie

// w PHP uzywajac metody mysqli od razu ta czynnosc sie wykonuje


// tworzysz zmienna najczesciej o nazwie conn, w mysqli_connect po kolei ustawiasz ip twojego serwera, uzytkownika wchodzacego do bazy, haslo do usera, nazwe bazy
$conn = mysqli_connect('127.0.0.1', 'root', '', 'baza');

// dla wygody w zmiennej umieszczamy STRINGA ktorego zawartosc to kwerenda ktora chcemy wykonac
$query = "SELECT * FROM tabela";

// Tworzymy zmienna i przypisujemy jej wartosc mysqli_query, w srodku umieszczamy po kolei: zmienna z nasza baza oraz zmienna z kwerenda (Wiadomo mozesz to od palca wpisac ale komu by sie chcialo)
$execute = mysqli_query($conn, $query);


//Skoro przerobione mamy wszystko co z grelich robilismy jesli chodzi o laczenie sie z baza i wykonywaniu kwerend na niej to pora zajac sie robieniem rzeczy na stronie

// Dla przykladu dajmy ze w naszej bazie mamy imie i nazwisko w tabeli tabela
// do wypisania wszystkiego z niej uzywamy petli while a w niej tworzymy zmienna pomocnicza(w tym przypadku $row) 
// jej wartosc nadamy jako wyniki kwerendy wlozone w tabele asocjacyjna
// Sprawi to ze mozemy teraz do kazdej kolumny odwolywac sie osobno

while($row=$execute->fetch_assoc()) {
    // Tak jak wyzej pisalem, majac wyniki w tabeli asocjacyjnej mozemy sie odwolac osobno do kazdej kolumny (w tym przypadku imie i nazwisko)
    echo $row['imie'];
    echo $row['nazwisko'];
}
?>

 <!-- Nastepne co robilismy to wyswietlanie danych z bazy na podstawie formularza, tutaj wyszukamy w bazie osob o danym imieniu i nazwisko -->
<div class="form">
    <!-- Wazne by uzyc tutaj method post, inaczej moze nie dzialac -->
    <form action="" method="post">
        <label for="">Wpisz szukane imie</label>
        <input type="text" name="imie">
        <br>
        <label for="">Wpisz szukane nazwisko</label>
        <input type="text" name="nazwisko">
        <br>
        <!-- Wazne by miec w formie input type submit, by nasze dane byly wyslane do POSTu(ktory zadeklarowalismy tworzac forma) -->
        <input type="submit" value="wyslij">
    </form>
</div>

<?php
// Teraz 

// Tworzymy zmienne ktorych wartosci nadamy rzeczy pobrane przez POSTa, robimy to $_POST['wartosc name w inpucie']
$imie = $_POST['imie'];
$nazwisko = $_POST['nazwisko'];

// Tworzymy string z kwerenda ktora bedziemy wyswietlac osoby z bazy o podanym imieniu i nazwisku
$query = "SELECT imie, nazwisko FROM tabela WHERE imie='$imie' AND nazwisko='$nazwisko'";

// Tak jak wczesniej tworzymy zmienna o wartosci wyniku kwerendy oraz tworzymy pomocnicza zmienna w ktorej wyniki wsadzimy do tabeli asocjacyjnej
$execute = mysqli_query($conn, $query);
$row = $execute->fetch_assoc();

// nie robimy tego w whilu bo zakladamy ze w bazie mamy tylko jedna osobe o danym imieniu i nazwisku

echo '<p>Osoba w bazie o podanym imieniu i nazwisku: ' . $row['imie'] . $row['nazwisko'] . '</p>'; 

?>


