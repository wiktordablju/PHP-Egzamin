-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Mar 2023, 14:37
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `hurtownia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owoce`
--

CREATE TABLE `owoce` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `owoce`
--

INSERT INTO `owoce` (`id`, `nazwa`, `ilosc`, `cena`) VALUES
(1, 'banan', 300, 8),
(2, 'brzoskwinia', 200, 6),
(3, 'kiwi', 10, 20),
(4, 'jablko', 500, 3),
(5, 'granat', 25, 40);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `owoce`
--
ALTER TABLE `owoce`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `owoce`
--
ALTER TABLE `owoce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
