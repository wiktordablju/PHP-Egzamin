-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 31 Sty 2023, 20:40
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `gabinety`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `ID` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Godzina` time NOT NULL,
  `Gabinet` int(11) NOT NULL,
  `Lekarz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rezerwacje`
--

INSERT INTO `rezerwacje` (`ID`, `Data`, `Godzina`, `Gabinet`, `Lekarz`) VALUES
(2, '2023-01-17', '13:00:00', 1, 1),
(3, '2023-01-17', '13:00:00', 2, 1),
(4, '2023-01-17', '15:00:00', 2, 1),
(5, '2023-01-17', '13:00:00', 2, 2),
(6, '2023-01-17', '15:00:00', 2, 3),
(7, '2023-01-17', '13:00:00', 3, 1),
(8, '2023-01-17', '13:00:00', 3, 2),
(9, '2023-01-17', '18:00:00', 3, 4),
(10, '2023-01-17', '18:00:00', 3, 3),
(11, '2023-01-17', '18:00:00', 4, 1),
(12, '2023-01-17', '18:00:00', 4, 2),
(13, '2023-01-17', '18:00:00', 4, 3),
(14, '2023-01-17', '13:00:00', 4, 4),
(15, '2023-01-17', '18:00:00', 1, 2),
(16, '2023-01-17', '15:00:00', 1, 3),
(17, '2023-01-17', '15:00:00', 1, 4);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
