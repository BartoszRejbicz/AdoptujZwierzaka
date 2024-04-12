-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 12, 2024 at 06:08 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schroniskodb`
--
CREATE DATABASE IF NOT EXISTS `schroniskodb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `schroniskodb`;
-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `RolaId` int(11) NOT NULL,
  `NazwaRoli` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RolaId`, `NazwaRoli`) VALUES
(1, 'admin'),
(2, 'schronisko'),
(3, 'user');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `schroniska`
--

CREATE TABLE `schroniska` (
  `SchroniskoId` int(11) NOT NULL,
  `Nazwa` varchar(255) NOT NULL,
  `Adres` varchar(255) NOT NULL,
  `Miasto` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NrTel` int(9) NOT NULL,
  `RolaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schroniska`
--

INSERT INTO `schroniska` (`SchroniskoId`, `Nazwa`, `Adres`, `Miasto`, `Email`, `NrTel`, `RolaId`) VALUES
(1, 'Schronisko Zielone Wzgórza', 'Ulica Leśna 1, 00-001', ' Warszawa', 'zielone@schronisko.pl', 123456789, 2),
(2, 'Schronisko Nadzieja', 'Ulica Słoneczna 5, 00-002', 'Kraków', 'nadzieja@schronisko.pl', 123456789, 2),
(3, 'Schronisko Przytul Mnie', 'Ulica Miła 10, 00-003', 'Wrocław', 'przytul@schronisko.pl', 123456789, 2),
(4, 'Schronisko Cztery Łapy', 'Ulica Psia 15, 00-004', 'Gdańsk', 'cztery@schronisko.pl', 123456789, 2),
(5, 'Schronisko Biały Kieł', 'Ulica Wilcza 20, 00-005', 'Poznań', 'bialy@schronisko.pl', 123456789, 2),
(6, 'Schronisko Azyl', 'Ulica Bezdomna 25, 00-006', 'Szczecin', 'azyl@schronisko.pl', 123456789, 2),
(7, 'Schronisko Dom Włóczęgi', 'Ulica Wędrowna 30, 00-007', 'Lublin', 'dom@schronisko.pl', 123456789, 2),
(8, 'Schronisko Pod Dobrą Gwiazdą', 'Ulica Gwiezdna 35, 00-008', 'Katowice', 'gwiazda@schronisko.pl', 123456789, 2),
(9, 'Schronisko Przystań', 'Ulica Portowa 40, 00-009 ', 'Gdynia', 'przystan@schronisko.pl', 123456789, 2),
(10, 'Schronisko Ostoja', 'Ulica Spokojna 45, 00-010', 'Łódź', 'ostoja@schronisko.pl', 123456789, 2),
(13, 'Bartex', 'Granicza 12, 54-123', 'Jastrzębie-Zdrój', 'bartosz_rej@o2.pl', 123456789, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ulubione`
--

CREATE TABLE `ulubione` (
  `UzytkownikId` int(11) NOT NULL,
  `ZwierzeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ulubione`
--

INSERT INTO `ulubione` (`UzytkownikId`, `ZwierzeId`) VALUES
(22, 1),
(22, 2),
(22, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `UzytkownikId` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Haslo` varchar(255) NOT NULL,
  `Imie` varchar(255) DEFAULT NULL,
  `Nazwisko` varchar(255) DEFAULT NULL,
  `RolaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`UzytkownikId`, `Email`, `Haslo`, `Imie`, `Nazwisko`, `RolaId`) VALUES
(1, 'nadzieja@schronisko.pl', '$2a$12$WIFZiwGqC2.E0CfMyw.6Qe5maYrBrXK91xAkJhSWGIyCW/B6aWYz.', 'Bartosz', 'Kacperczyk', 2),
(2, 'zielone@schronisko.pl', '$2a$12$/13d4XatLAX./FL28RS6ruBdqszIBYioZ3x6a253r/BlJPTRele32', 'Katarzyna', 'Rosół', 2),
(3, 'przytul@schronisko.pl', '$2a$12$QxLOUMhqwQD.vVAIVOVJIeL8Yww7cEW3nHCODuBWyVcdVyis9P6am', 'Bogusław', 'Konopacki', 2),
(4, 'cztery@schronisko.pl', '$2a$12$qKiEmHiAm0Ci3BBkJY56ie/w85ZN1bQ5sjI/RaAew3heqrm4w.84.', 'Amelia', 'Pieroń', 2),
(5, 'bialy@schronisko.pl', '$2a$12$A02IkgzC3gTwbrtUCU7kIuoMIh1V7A9b7lxc.Uu8pLpt/A9jc2Hra', 'Małgorzata', 'Szyc', 2),
(6, 'azyl@schronisko.pl', '$2a$12$wta//F/FsCk/DOQ2QMbdMuhdb6p5G.1qrCdXB4OckTBeh5EMhUZOm', 'Witold', 'Czarek', 2),
(7, 'dom@schronisko.pl', '$2a$12$TsDy1T.M.3VT4WlZ37fPX.66do.LAd1vL/ZneE.yGk3VjHI7WIQfC', 'Magdalena', 'Bierda', 2),
(8, 'gwiazda@schronisko.pl', '$2a$12$7trZCHUzxNF3FddE9f472uxzugAFRdzyORjH0/XYl/22ls07uul6u', 'Mariusz', 'Pędzierski', 2),
(9, 'przystan@schronisko.pl', '$2a$12$43rALD5LHxR/20zrUPcCsO0ed4qyKmqnNrx1g4JAdYIGZT0RYj6nu', 'Mateusz', 'Wilk', 2),
(10, 'ostoja@schronisko.pl', '$2a$12$i/CWXsJmEbssSbdCsV2kmu5O8RPtmTUhcMHK6z7sG.zkM1wN6vPjS', 'Paulina', 'Mak', 2),
(11, 'admin@admin.pl', '$2a$12$sdSxmcVT.MB6l0UlTJ/JheHXM4tDIK92dK5yA2lUZfjjX3AfKFnIO', 'Bartek', 'Rejbicz', 1),
(13, 'paluch@o2.pl', '$2a$12$eGcvgrbceoa8BzuycPgYfef4BpBGBWqUkZwHnKBvu9ZmWRFXO6Zwy', 'Pawel', 'Paluchowski', 3),
(22, '123@123.pl', '$2a$12$f/8VcArBZ5Vso79qfQN..eNPJDRQaujSV8NTIohjhCg6j6354mMee', 'Oskar', 'Wielczyk', 3),
(23, 'bartosz_rej@o2.pl', '$2a$12$1wjW8pBgPfimvYQDtvJEY.CyqyJ7F5h/mAkQat4rqC9FZ2jGcbFWG', 'Bartosz', 'Rejbicz', 2),
(24, '1234@1234.pl', '$2a$12$x9Ol/voHzxXMcXXpmH.nD.8G1dqvlNlQ7Euq0XEHHu9qcmsMfWdUu', 'Krzysztof', 'Marecki', 3),
(27, 'sowa@o2.pl', '$2a$12$Fuc19euw38ccenDmmt8nQuGxMgmKkWs3Ohm59V.fGZU6dJ8T4iSwa', 'Aneta', 'Wróbel', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zwierzeta`
--

CREATE TABLE `zwierzeta` (
  `ZwierzeId` int(11) NOT NULL,
  `SchroniskoId` int(11) DEFAULT NULL,
  `Typ` enum('Pies','Kot') DEFAULT NULL,
  `Imie` varchar(30) DEFAULT NULL,
  `ZdjecieURL` varchar(255) DEFAULT NULL,
  `Opis` text DEFAULT NULL,
  `Wiek` enum('Szczeniak','Młody','Dorosły','Senior') DEFAULT NULL,
  `Waga` decimal(5,2) DEFAULT NULL,
  `Wielkosc` enum('Mały','Średni','Duży') DEFAULT NULL,
  `Plec` enum('Samiec','Samica') DEFAULT NULL,
  `RodzajWlosia` enum('Krótka','Długa','Szorstka','Jedwabista') DEFAULT NULL,
  `Kolor` varchar(50) DEFAULT NULL,
  `RasaPsa` enum('Mieszaniec','Labrador','Golden Retriever','Buldog','Beagle','Yorkshire Terrier','Shih Tzu','Maltanczyk','Owczarek Niemiecki','Husky','Akita','Border Collie','Jack Russell Terrier','West Highland White Terrier','Fox Terrier','Cocker Spaniel') DEFAULT NULL,
  `RasaKota` enum('Dachowiec','Rasowy') DEFAULT NULL,
  `CechyZachowania` text DEFAULT NULL,
  `PrzebyteChoroby` text DEFAULT NULL,
  `Kastrowany` enum('Tak','Nie') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zwierzeta`
--

INSERT INTO `zwierzeta` (`ZwierzeId`, `SchroniskoId`, `Typ`, `Imie`, `ZdjecieURL`, `Opis`, `Wiek`, `Waga`, `Wielkosc`, `Plec`, `RodzajWlosia`, `Kolor`, `RasaPsa`, `RasaKota`, `CechyZachowania`, `PrzebyteChoroby`, `Kastrowany`) VALUES
(1, 1, 'Pies', 'Baśka', 'pies1.jpg', 'Opis Piesa numer 1', 'Szczeniak', 9.14, 'Średni', 'Samica', 'Długa', 'Biały', 'Fox Terrier', NULL, NULL, NULL, 'Nie'),
(2, 1, 'Pies', 'Nela', 'pies2.jpg', 'Opis Piesa numer 1', 'Szczeniak', 6.89, 'Mały', 'Samica', 'Długa', 'Czarny', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(3, 1, 'Kot', 'Plamka', 'kot3.jpg', 'Opis Kota numer 2', 'Senior', 6.38, 'Mały', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(4, 1, 'Kot', 'Szefu', 'kot4.jpg', 'Opis Kota numer 3', 'Senior', 6.90, 'Mały', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(5, 1, 'Pies', 'Fiona', 'pies5.jpg', 'Opis Piesa numer 4', 'Młody', 18.38, 'Duży', 'Samica', 'Krótka', 'Inny', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(6, 1, 'Kot', 'Rita', 'kot6.jpg', 'Opis Kota numer 5', 'Młody', 14.70, 'Średni', 'Samica', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(7, 1, 'Pies', 'Rocky', 'pies7.jpg', 'Opis Piesa numer 6', 'Szczeniak', 26.64, 'Mały', 'Samiec', 'Szorstka', 'Czarny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(8, 1, 'Kot', 'Kukuś', 'kot8.jpg', 'Opis Kota numer 7', 'Młody', 11.38, 'Średni', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(9, 1, 'Pies', 'Kajtek', 'pies9.jpg', 'Opis Piesa numer 8', 'Młody', 6.98, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(10, 1, 'Pies', 'Szarik', 'pies10.jpg', 'Opis Piesa numer 9', 'Senior', 22.64, 'Średni', 'Samiec', 'Krótka', 'Czarny', 'Buldog', NULL, NULL, NULL, 'Nie'),
(11, 1, 'Pies', 'Rita', 'pies11.jpg', 'Opis Piesa numer 10', 'Młody', 29.18, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Buldog', NULL, NULL, NULL, 'Tak'),
(12, 1, 'Kot', 'Bianka', 'kot12.jpg', 'Opis Kota numer 11', 'Senior', 6.11, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(13, 1, 'Kot', 'Czika', 'kot13.jpg', 'Opis Kota numer 12', 'Dorosły', 7.80, 'Mały', 'Samica', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(14, 1, 'Pies', 'Nikita', 'pies14.jpg', 'Opis Piesa numer 13', 'Senior', 16.54, 'Mały', 'Samica', 'Jedwabista', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(15, 1, 'Kot', 'Diva', 'kot15.jpg', 'Opis Kota numer 14', 'Szczeniak', 13.91, 'Średni', 'Samica', 'Krótka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(16, 1, 'Kot', 'Burek', 'kot16.jpg', 'Opis Kota numer 15', 'Szczeniak', 10.65, 'Średni', 'Samiec', 'Długa', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(17, 2, 'Kot', 'Kajtek', 'kot17.jpg', 'Opis Kota numer 1', 'Szczeniak', 9.44, 'Duży', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(18, 2, 'Kot', 'Borys', 'kot18.jpg', 'Opis Kota numer 2', 'Szczeniak', 13.40, 'Mały', 'Samiec', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(19, 2, 'Kot', 'Blondie', 'kot19.jpg', 'Opis Kota numer 3', 'Senior', 14.82, 'Duży', 'Samica', 'Jedwabista', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(20, 2, 'Pies', 'Cezar', 'pies20.jpg', 'Opis Piesa numer 4', 'Dorosły', 35.19, 'Duży', 'Samiec', 'Szorstka', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(21, 2, 'Pies', 'Bobik', 'pies21.jpg', 'Opis Piesa numer 5', 'Senior', 17.05, 'Średni', 'Samiec', 'Jedwabista', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(22, 2, 'Kot', 'Nikita', 'kot22.jpg', 'Opis Kota numer 6', 'Dorosły', 10.76, 'Mały', 'Samica', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(23, 2, 'Pies', 'Mokka', 'pies23.jpg', 'Opis Piesa numer 7', 'Młody', 35.96, 'Duży', 'Samica', 'Długa', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Nie'),
(24, 2, 'Pies', 'Ruda', 'pies24.jpg', 'Opis Piesa numer 8', 'Młody', 44.38, 'Mały', 'Samica', 'Krótka', 'Biały', 'Akita', NULL, NULL, NULL, 'Nie'),
(25, 2, 'Pies', 'Bambi', 'pies25.jpg', 'Opis Piesa numer 9', 'Dorosły', 18.70, 'Duży', 'Samica', 'Długa', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(26, 2, 'Pies', 'Max', 'pies26.jpg', 'Opis Piesa numer 10', 'Szczeniak', 32.91, 'Mały', 'Samiec', 'Jedwabista', 'Biały', 'Akita', NULL, NULL, NULL, 'Tak'),
(27, 2, 'Pies', 'Czarek', 'pies27.jpg', 'Opis Piesa numer 11', 'Szczeniak', 4.80, 'Duży', 'Samiec', 'Krótka', 'Czarny', 'Yorkshire Terrier', NULL, NULL, NULL, 'Tak'),
(28, 2, 'Pies', 'Zygmunt', 'pies28.jpg', 'Opis Piesa numer 12', 'Dorosły', 5.95, 'Średni', 'Samiec', 'Jedwabista', 'Biały', 'Maltanczyk', NULL, NULL, NULL, 'Tak'),
(29, 2, 'Kot', 'Bryza', 'kot29.jpg', 'Opis Kota numer 13', 'Szczeniak', 10.80, 'Mały', 'Samica', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(30, 2, 'Pies', 'Bambi', 'pies30.jpg', 'Opis Piesa numer 14', 'Szczeniak', 11.19, 'Duży', 'Samica', 'Szorstka', 'Biały', 'Mieszaniec', NULL, NULL, NULL, 'Nie'),
(31, 2, 'Kot', 'Gruby', 'kot31.jpg', 'Opis Kota numer 15', 'Młody', 14.73, 'Duży', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(32, 3, 'Pies', 'Koko', 'pies32.jpg', 'Opis Piesa numer 1', 'Dorosły', 34.61, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Husky', NULL, NULL, NULL, 'Tak'),
(33, 3, 'Pies', 'Bruno', 'pies33.jpg', 'Opis Piesa numer 2', 'Senior', 25.73, 'Duży', 'Samiec', 'Długa', 'Brązowy', 'Husky', NULL, NULL, NULL, 'Tak'),
(34, 3, 'Pies', 'Czika', 'pies34.jpg', 'Opis Piesa numer 3', 'Młody', 9.94, 'Średni', 'Samica', 'Jedwabista', 'Czarny', 'Jack Russell Terrier', NULL, NULL, NULL, 'Tak'),
(35, 3, 'Kot', 'Azor', 'kot35.jpg', 'Opis Kota numer 4', 'Młody', 10.31, 'Mały', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(36, 3, 'Kot', 'Pola', 'kot36.jpg', 'Opis Kota numer 5', 'Senior', 11.61, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(37, 3, 'Pies', 'Czika', 'pies37.jpg', 'Opis Piesa numer 6', 'Szczeniak', 8.39, 'Średni', 'Samica', 'Długa', 'Biały', 'Fox Terrier', NULL, NULL, NULL, 'Nie'),
(38, 3, 'Pies', 'Frida', 'pies38.jpg', 'Opis Piesa numer 7', 'Senior', 30.64, 'Duży', 'Samica', 'Jedwabista', 'Czarny', 'Labrador', NULL, NULL, NULL, 'Nie'),
(39, 3, 'Pies', 'Młotek', 'pies39.jpg', 'Opis Piesa numer 8', 'Szczeniak', 5.30, 'Średni', 'Samiec', 'Krótka', 'Inny', 'Shih Tzu', NULL, NULL, NULL, 'Tak'),
(40, 3, 'Kot', 'Milka', 'kot40.jpg', 'Opis Kota numer 9', 'Dorosły', 7.83, 'Mały', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(41, 3, 'Kot', 'Azor', 'kot41.jpg', 'Opis Kota numer 10', 'Dorosły', 11.91, 'Średni', 'Samiec', 'Długa', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(42, 3, 'Pies', 'Kasiek', 'pies42.jpg', 'Opis Piesa numer 11', 'Szczeniak', 18.70, 'Duży', 'Samiec', 'Długa', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(43, 3, 'Pies', 'Bryza', 'pies43.jpg', 'Opis Piesa numer 12', 'Szczeniak', 8.21, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Shih Tzu', NULL, NULL, NULL, 'Nie'),
(44, 3, 'Kot', 'Ruda', 'kot44.jpg', 'Opis Kota numer 13', 'Dorosły', 7.07, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(45, 3, 'Kot', 'Młotek', 'kot45.jpg', 'Opis Kota numer 14', 'Senior', 8.95, 'Duży', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(46, 3, 'Pies', 'Blondie', 'pies46.jpg', 'Opis Piesa numer 15', 'Senior', 5.32, 'Średni', 'Samica', 'Długa', 'Biały', 'Yorkshire Terrier', NULL, NULL, NULL, 'Tak'),
(47, 4, 'Pies', 'Władek', 'pies47.jpg', 'Opis Piesa numer 1', 'Szczeniak', 15.74, 'Mały', 'Samiec', 'Jedwabista', 'Czarny', 'Beagle', NULL, NULL, NULL, 'Tak'),
(48, 4, 'Pies', 'Diva', 'pies48.jpg', 'Opis Piesa numer 2', 'Szczeniak', 9.79, 'Duży', 'Samica', 'Długa', 'Brązowy', 'Fox Terrier', NULL, NULL, NULL, 'Tak'),
(49, 4, 'Kot', 'Maks', 'kot49.jpg', 'Opis Kota numer 3', 'Senior', 5.44, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(50, 4, 'Kot', 'Blondie', 'kot50.jpg', 'Opis Kota numer 4', 'Senior', 13.04, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(51, 4, 'Pies', 'Doda', 'pies51.jpg', 'Opis Piesa numer 5', 'Szczeniak', 10.64, 'Duży', 'Samica', 'Krótka', 'Biały', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(52, 4, 'Pies', 'Rysiek', 'pies52.jpg', 'Opis Piesa numer 6', 'Młody', 7.43, 'Mały', 'Samiec', 'Szorstka', 'Czarny', 'Shih Tzu', NULL, NULL, NULL, 'Nie'),
(53, 4, 'Kot', 'Reksio', 'kot53.jpg', 'Opis Kota numer 7', 'Senior', 10.41, 'Duży', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(54, 4, 'Pies', 'Beza', 'pies54.jpg', 'Opis Piesa numer 8', 'Senior', 10.37, 'Duży', 'Samica', 'Długa', 'Biały', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(55, 4, 'Pies', 'Beza', 'pies55.jpg', 'Opis Piesa numer 9', 'Dorosły', 20.02, 'Duży', 'Samica', 'Długa', 'Inny', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(56, 4, 'Pies', 'Zygmunt', 'pies56.jpg', 'Opis Piesa numer 10', 'Młody', 32.97, 'Średni', 'Samiec', 'Jedwabista', 'Brązowy', 'Akita', NULL, NULL, NULL, 'Tak'),
(57, 4, 'Kot', 'Doda', 'kot57.jpg', 'Opis Kota numer 11', 'Młody', 12.66, 'Mały', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(58, 4, 'Kot', 'Bambi', 'kot58.jpg', 'Opis Kota numer 12', 'Senior', 5.25, 'Duży', 'Samica', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(59, 4, 'Pies', 'Szarik', 'pies59.jpg', 'Opis Piesa numer 13', 'Szczeniak', 30.50, 'Średni', 'Samiec', 'Jedwabista', 'Czarny', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(60, 4, 'Kot', 'Baśka', 'kot60.jpg', 'Opis Kota numer 14', 'Młody', 8.67, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(61, 4, 'Pies', 'Filuś', 'pies61.jpg', 'Opis Piesa numer 15', 'Szczeniak', 32.53, 'Średni', 'Samiec', 'Długa', 'Brązowy', 'Labrador', NULL, NULL, NULL, 'Tak'),
(62, 5, 'Kot', 'Frida', 'kot62.jpg', 'Opis Kota numer 1', 'Młody', 13.11, 'Średni', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(63, 5, 'Kot', 'Milka', 'kot63.jpg', 'Opis Kota numer 2', 'Szczeniak', 14.55, 'Średni', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(64, 5, 'Kot', 'Szaman', 'kot64.jpg', 'Opis Kota numer 3', 'Senior', 11.78, 'Średni', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(65, 5, 'Pies', 'Nela', 'pies65.jpg', 'Opis Piesa numer 4', 'Dorosły', 6.72, 'Duży', 'Samica', 'Szorstka', 'Czarny', 'Mieszaniec', NULL, NULL, NULL, 'Nie'),
(66, 5, 'Pies', 'Łatka', 'pies66.jpg', 'Opis Piesa numer 5', 'Dorosły', 8.67, 'Średni', 'Samica', 'Krótka', 'Biały', 'Shih Tzu', NULL, NULL, NULL, 'Tak'),
(67, 5, 'Pies', 'Siwa', 'pies67.jpg', 'Opis Piesa numer 6', 'Szczeniak', 32.10, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Husky', NULL, NULL, NULL, 'Nie'),
(68, 5, 'Kot', 'Kukuś', 'kot68.jpg', 'Opis Kota numer 7', 'Dorosły', 14.26, 'Duży', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(69, 5, 'Pies', 'Pola', 'pies69.jpg', 'Opis Piesa numer 8', 'Dorosły', 6.70, 'Średni', 'Samica', 'Jedwabista', 'Biały', 'Maltanczyk', NULL, NULL, NULL, 'Nie'),
(70, 5, 'Kot', 'Młotek', 'kot70.jpg', 'Opis Kota numer 9', 'Senior', 5.32, 'Średni', 'Samiec', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(71, 5, 'Kot', 'Poldek', 'kot71.jpg', 'Opis Kota numer 10', 'Dorosły', 14.88, 'Średni', 'Samiec', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(72, 5, 'Pies', 'Bimber', 'pies72.jpg', 'Opis Piesa numer 11', 'Szczeniak', 6.33, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'West Highland White Terrier', NULL, NULL, NULL, 'Tak'),
(73, 5, 'Kot', 'Łatka', 'kot73.jpg', 'Opis Kota numer 12', 'Młody', 14.55, 'Mały', 'Samica', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(74, 5, 'Pies', 'Kaszka', 'pies74.jpg', 'Opis Piesa numer 13', 'Dorosły', 9.39, 'Mały', 'Samica', 'Szorstka', 'Czarny', 'Mieszaniec', NULL, NULL, NULL, 'Nie'),
(75, 5, 'Pies', 'Koko', 'pies75.jpg', 'Opis Piesa numer 14', 'Dorosły', 10.08, 'Duży', 'Samica', 'Krótka', 'Biały', 'West Highland White Terrier', NULL, NULL, NULL, 'Tak'),
(76, 5, 'Kot', 'Czika', 'kot76.jpg', 'Opis Kota numer 15', 'Szczeniak', 14.48, 'Średni', 'Samica', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(77, 6, 'Kot', 'Doda', 'kot77.jpg', 'Opis Kota numer 1', 'Dorosły', 12.20, 'Średni', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(78, 6, 'Pies', 'Beza', 'pies78.jpg', 'Opis Piesa numer 2', 'Młody', 5.16, 'Średni', 'Samica', 'Krótka', 'Inny', 'Maltanczyk', NULL, NULL, NULL, 'Nie'),
(79, 6, 'Pies', 'Bambi', 'pies79.jpg', 'Opis Piesa numer 3', 'Młody', 18.60, 'Duży', 'Samica', 'Krótka', 'Biały', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(80, 6, 'Pies', 'Bruno', 'pies80.jpg', 'Opis Piesa numer 4', 'Dorosły', 20.85, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(81, 6, 'Kot', 'Pikuś', 'kot81.jpg', 'Opis Kota numer 5', 'Dorosły', 9.17, 'Średni', 'Samiec', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(82, 6, 'Kot', 'Burek', 'kot82.jpg', 'Opis Kota numer 6', 'Dorosły', 10.39, 'Mały', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(83, 6, 'Kot', 'Maks', 'kot83.jpg', 'Opis Kota numer 7', 'Dorosły', 11.83, 'Mały', 'Samiec', 'Krótka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(84, 6, 'Pies', 'Kukuś', 'pies84.jpg', 'Opis Piesa numer 8', 'Szczeniak', 27.19, 'Duży', 'Samiec', 'Długa', 'Czarny', 'Labrador', NULL, NULL, NULL, 'Nie'),
(85, 6, 'Pies', 'Pela', 'pies85.jpg', 'Opis Piesa numer 9', 'Senior', 27.87, 'Duży', 'Samica', 'Jedwabista', 'Brązowy', 'Labrador', NULL, NULL, NULL, 'Tak'),
(86, 6, 'Kot', 'Kaszka', 'kot86.jpg', 'Opis Kota numer 10', 'Dorosły', 9.76, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(87, 6, 'Kot', 'Azor', 'kot87.jpg', 'Opis Kota numer 11', 'Senior', 6.82, 'Średni', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(88, 6, 'Kot', 'Koko', 'kot88.jpg', 'Opis Kota numer 12', 'Młody', 5.64, 'Średni', 'Samica', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(89, 6, 'Kot', 'Pyza', 'kot89.jpg', 'Opis Kota numer 13', 'Dorosły', 12.66, 'Mały', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(90, 6, 'Pies', 'Beza', 'pies90.jpg', 'Opis Piesa numer 14', 'Dorosły', 13.27, 'Średni', 'Samica', 'Szorstka', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(91, 6, 'Pies', 'Koko', 'pies91.jpg', 'Opis Piesa numer 15', 'Dorosły', 14.10, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(92, 7, 'Kot', 'Bobik', 'kot92.jpg', 'Opis Kota numer 1', 'Szczeniak', 10.90, 'Średni', 'Samiec', 'Krótka', 'Inny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(93, 7, 'Kot', 'Rita', 'kot93.jpg', 'Opis Kota numer 2', 'Senior', 5.47, 'Średni', 'Samica', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(94, 7, 'Kot', 'Pyza', 'kot94.jpg', 'Opis Kota numer 3', 'Młody', 5.62, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(95, 7, 'Pies', 'Bruno', 'pies95.jpg', 'Opis Piesa numer 4', 'Senior', 33.46, 'Średni', 'Samiec', 'Jedwabista', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(96, 7, 'Pies', 'Pela', 'pies96.jpg', 'Opis Piesa numer 5', 'Młody', 25.39, 'Duży', 'Samica', 'Długa', 'Biały', 'Labrador', NULL, NULL, NULL, 'Tak'),
(97, 7, 'Pies', 'Maks', 'pies97.jpg', 'Opis Piesa numer 6', 'Młody', 32.55, 'Duży', 'Samiec', 'Krótka', 'Czarny', 'Husky', NULL, NULL, NULL, 'Tak'),
(98, 7, 'Pies', 'Mokka', 'pies98.jpg', 'Opis Piesa numer 7', 'Senior', 19.86, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(99, 7, 'Pies', 'Bobik', 'pies99.jpg', 'Opis Piesa numer 8', 'Senior', 12.35, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(100, 7, 'Pies', 'Rocky', 'pies100.jpg', 'Opis Piesa numer 9', 'Senior', 33.58, 'Duży', 'Samiec', 'Jedwabista', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(101, 7, 'Kot', 'Baśka', 'kot101.jpg', 'Opis Kota numer 10', 'Dorosły', 6.97, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(102, 7, 'Pies', 'Kaszka', 'pies102.jpg', 'Opis Piesa numer 11', 'Senior', 6.02, 'Mały', 'Samica', 'Szorstka', 'Czarny', 'Maltanczyk', NULL, NULL, NULL, 'Tak'),
(103, 7, 'Pies', 'Zuzia', 'pies103.jpg', 'Opis Piesa numer 12', 'Młody', 28.81, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Husky', NULL, NULL, NULL, 'Nie'),
(104, 7, 'Pies', 'Młotek', 'pies104.jpg', 'Opis Piesa numer 13', 'Młody', 37.55, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'Akita', NULL, NULL, NULL, 'Nie'),
(105, 7, 'Kot', 'Burek', 'kot105.jpg', 'Opis Kota numer 14', 'Senior', 5.27, 'Duży', 'Samiec', 'Jedwabista', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(106, 7, 'Kot', 'Beza', 'kot106.jpg', 'Opis Kota numer 15', 'Dorosły', 5.43, 'Duży', 'Samica', 'Krótka', 'Inny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(107, 8, 'Pies', 'Szarik', 'pies107.jpg', 'Opis Piesa numer 1', 'Senior', 9.66, 'Mały', 'Samiec', 'Szorstka', 'Biały', 'Jack Russell Terrier', NULL, NULL, NULL, 'Tak'),
(108, 8, 'Kot', 'Perła', 'kot108.jpg', 'Opis Kota numer 2', 'Senior', 9.02, 'Mały', 'Samica', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(109, 8, 'Kot', 'Rysiek', 'kot109.jpg', 'Opis Kota numer 3', 'Młody', 5.70, 'Mały', 'Samiec', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(110, 8, 'Pies', 'Milka', 'pies110.jpg', 'Opis Piesa numer 4', 'Szczeniak', 32.02, 'Mały', 'Samica', 'Krótka', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(111, 8, 'Kot', 'Reksio', 'kot111.jpg', 'Opis Kota numer 5', 'Młody', 9.51, 'Duży', 'Samiec', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(112, 8, 'Kot', 'Pela', 'kot112.jpg', 'Opis Kota numer 6', 'Młody', 9.20, 'Średni', 'Samica', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(113, 8, 'Pies', 'Perła', 'pies113.jpg', 'Opis Piesa numer 7', 'Dorosły', 7.87, 'Mały', 'Samica', 'Szorstka', 'Biały', 'West Highland White Terrier', NULL, NULL, NULL, 'Tak'),
(114, 8, 'Pies', 'Oreo', 'pies114.jpg', 'Opis Piesa numer 8', 'Senior', 36.17, 'Średni', 'Samiec', 'Krótka', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(115, 8, 'Kot', 'Bimber', 'kot115.jpg', 'Opis Kota numer 9', 'Dorosły', 14.63, 'Duży', 'Samiec', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(116, 8, 'Pies', 'Szarik', 'pies116.jpg', 'Opis Piesa numer 10', 'Senior', 32.47, 'Średni', 'Samiec', 'Długa', 'Biały', 'Labrador', NULL, NULL, NULL, 'Nie'),
(117, 8, 'Kot', 'Doda', 'kot117.jpg', 'Opis Kota numer 11', 'Młody', 7.80, 'Średni', 'Samica', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(118, 8, 'Pies', 'Frida', 'pies118.jpg', 'Opis Piesa numer 12', 'Młody', 31.41, 'Średni', 'Samica', 'Szorstka', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(119, 8, 'Kot', 'Borys', 'kot119.jpg', 'Opis Kota numer 13', 'Młody', 11.23, 'Średni', 'Samiec', 'Szorstka', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(120, 8, 'Pies', 'Siwa', 'pies120.jpg', 'Opis Piesa numer 14', 'Dorosły', 7.06, 'Średni', 'Samica', 'Długa', 'Brązowy', 'Jack Russell Terrier', NULL, NULL, NULL, 'Nie'),
(121, 8, 'Kot', 'Oreo', 'kot121.jpg', 'Opis Kota numer 15', 'Senior', 12.40, 'Duży', 'Samiec', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(122, 9, 'Kot', 'Czarek', 'kot122.jpg', 'Opis Kota numer 1', 'Szczeniak', 6.26, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(123, 9, 'Kot', 'Luna', 'kot123.jpg', 'Opis Kota numer 2', 'Senior', 9.10, 'Duży', 'Samica', 'Szorstka', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(124, 9, 'Pies', 'Śnieżka', 'pies124.jpg', 'Opis Piesa numer 3', 'Szczeniak', 22.26, 'Średni', 'Samica', 'Krótka', 'Czarny', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(125, 9, 'Kot', 'Czarek', 'kot125.jpg', 'Opis Kota numer 4', 'Dorosły', 11.52, 'Średni', 'Samiec', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(126, 9, 'Kot', 'Doda', 'kot126.jpg', 'Opis Kota numer 5', 'Senior', 8.78, 'Średni', 'Samica', 'Krótka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(127, 9, 'Kot', 'Koko', 'kot127.jpg', 'Opis Kota numer 6', 'Dorosły', 6.87, 'Duży', 'Samica', 'Szorstka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(128, 9, 'Kot', 'Rita', 'kot128.jpg', 'Opis Kota numer 7', 'Młody', 8.89, 'Średni', 'Samica', 'Jedwabista', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(129, 9, 'Kot', 'Łatka', 'kot129.jpg', 'Opis Kota numer 8', 'Dorosły', 12.95, 'Mały', 'Samica', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(130, 9, 'Kot', 'Szefu', 'kot130.jpg', 'Opis Kota numer 9', 'Dorosły', 9.60, 'Średni', 'Samiec', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(131, 9, 'Kot', 'Bobik', 'kot131.jpg', 'Opis Kota numer 10', 'Młody', 5.77, 'Średni', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(132, 9, 'Kot', 'Poldek', 'kot132.jpg', 'Opis Kota numer 11', 'Senior', 12.00, 'Mały', 'Samiec', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(133, 9, 'Kot', 'Doda', 'kot133.jpg', 'Opis Kota numer 12', 'Senior', 12.44, 'Duży', 'Samica', 'Krótka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(134, 9, 'Kot', 'Doda', 'kot134.jpg', 'Opis Kota numer 13', 'Szczeniak', 14.73, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(135, 9, 'Kot', 'Pikuś', 'kot135.jpg', 'Opis Kota numer 14', 'Senior', 14.40, 'Średni', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(136, 9, 'Pies', 'Bryza', 'pies136.jpg', 'Opis Piesa numer 15', 'Szczeniak', 37.66, 'Średni', 'Samica', 'Krótka', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Nie'),
(137, 10, 'Kot', 'Beza', 'kot137.jpg', 'Opis Kota numer 1', NULL, 12.55, 'Duży', 'Samica', 'Długa', 'Czarny', NULL, 'Dachowiec', 'test', '', ''),
(138, 10, 'Kot', 'Max', 'kot138.jpg', 'Opis Kota numer 2', NULL, 13.98, 'Duży', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', 'Fajny', '', 'Nie'),
(139, 10, 'Kot', 'Pluton', 'kot139.jpg', 'Opis Kota numer 3', 'Szczeniak', 11.16, 'Mały', 'Samiec', 'Krótka', 'Inny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(141, 10, 'Pies', 'Koko', 'pies141.jpg', 'Opis Piesa numer 5', 'Szczeniak', 38.64, 'Mały', 'Samica', 'Krótka', 'Biały', 'Owczarek Niemiecki', NULL, NULL, NULL, 'Tak'),
(142, 10, 'Kot', 'Fiodor', 'kot142.jpg', 'Opis Kota numer 6', 'Dorosły', 5.52, 'Średni', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(143, 10, 'Kot', 'Bobik', 'kot143.jpg', 'Opis Kota numer 7', 'Dorosły', 6.42, 'Średni', 'Samiec', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(144, 10, 'Kot', 'Blondie', 'kot144.jpg', 'Opis Kota numer 8', 'Młody', 12.79, 'Mały', 'Samica', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(145, 10, 'Kot', 'Siwa', 'kot145.jpg', 'Opis Kota numer 9', 'Szczeniak', 10.79, 'Duży', 'Samica', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(146, 10, 'Kot', 'Rita', 'kot146.jpg', 'Opis Kota numer 10', 'Dorosły', 5.13, 'Średni', 'Samica', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(147, 10, 'Kot', 'Czika', 'kot147.jpg', 'Opis Kota numer 11', 'Senior', 5.20, 'Mały', 'Samica', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(148, 10, 'Kot', 'Bambi', 'kot148.jpg', 'Opis Kota numer 12', 'Senior', 7.62, 'Średni', 'Samica', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(149, 10, 'Kot', 'Nela', 'kot149.jpg', 'Opis Kota numer 13', 'Szczeniak', 12.68, 'Mały', 'Samica', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(150, 10, 'Kot', 'Śnieżka', 'kot150.jpg', 'Opis Kota numer 14', 'Szczeniak', 6.05, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(151, 10, 'Kot', 'Filuś', 'kot151.jpg', 'Opis Kota numer 15', 'Szczeniak', 11.76, 'Duży', 'Samiec', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(152, 1, 'Kot', 'Diva', 'kot152.jpg', 'Opis Kota numer 2', 'Senior', 6.38, 'Mały', 'Samica', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(153, 1, 'Kot', 'Borys', 'kot153.jpg', 'Opis Kota numer 3', 'Senior', 6.90, 'Mały', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(154, 1, 'Pies', 'Luna', 'pies154.jpg', 'Opis Piesa numer 4', 'Młody', 18.38, 'Duży', 'Samica', 'Krótka', 'Biały', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(155, 1, 'Kot', 'Frida', 'kot155.jpg', 'Opis Kota numer 5', 'Młody', 14.70, 'Średni', 'Samica', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(156, 1, 'Pies', 'Szefu', 'pies156.jpg', 'Opis Piesa numer 6', 'Szczeniak', 26.64, 'Mały', 'Samiec', 'Szorstka', 'Inny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(157, 1, 'Kot', 'Max', 'kot157.jpg', 'Opis Kota numer 7', 'Młody', 11.38, 'Średni', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(158, 1, 'Pies', 'Maks', 'pies158.jpg', 'Opis Piesa numer 8', 'Młody', 6.98, 'Mały', 'Samiec', 'Krótka', 'Biały', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(159, 1, 'Pies', 'Władek', 'pies159.jpg', 'Opis Piesa numer 9', 'Senior', 22.64, 'Średni', 'Samiec', 'Krótka', 'Brązowy', 'Buldog', NULL, NULL, NULL, 'Nie'),
(160, 1, 'Pies', 'Śnieżka', 'pies160.jpg', 'Opis Piesa numer 10', 'Młody', 29.18, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Buldog', NULL, NULL, NULL, 'Nie'),
(161, 1, 'Kot', 'Koko', 'kot161.jpg', 'Opis Kota numer 11', 'Senior', 6.11, 'Mały', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(162, 1, 'Kot', 'Pela', 'kot162.jpg', 'Opis Kota numer 12', 'Dorosły', 7.80, 'Mały', 'Samica', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(163, 1, 'Pies', 'Perła', 'pies163.jpg', 'Opis Piesa numer 13', 'Senior', 16.54, 'Mały', 'Samica', 'Jedwabista', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(164, 1, 'Kot', 'Nela', 'kot164.jpg', 'Opis Kota numer 14', 'Szczeniak', 13.91, 'Średni', 'Samica', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(165, 1, 'Kot', 'Cezar', 'kot165.jpg', 'Opis Kota numer 15', 'Szczeniak', 10.65, 'Średni', 'Samiec', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(166, 2, 'Kot', 'Pikuś', 'kot166.jpg', 'Opis Kota numer 1', 'Szczeniak', 9.44, 'Duży', 'Samiec', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(167, 2, 'Kot', 'Kasiek', 'kot167.jpg', 'Opis Kota numer 2', 'Szczeniak', 13.40, 'Mały', 'Samiec', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(168, 2, 'Kot', 'Blondie', 'kot168.jpg', 'Opis Kota numer 3', 'Senior', 14.82, 'Duży', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(169, 2, 'Pies', 'Kasiek', 'pies169.jpg', 'Opis Piesa numer 4', 'Dorosły', 35.19, 'Duży', 'Samiec', 'Szorstka', 'Czarny', 'Golden Retriever', NULL, NULL, NULL, 'Nie'),
(170, 2, 'Pies', 'Bobik', 'pies170.jpg', 'Opis Piesa numer 5', 'Senior', 17.05, 'Średni', 'Samiec', 'Jedwabista', 'Biały', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(171, 2, 'Kot', 'Blondie', 'kot171.jpg', 'Opis Kota numer 6', 'Dorosły', 10.76, 'Mały', 'Samica', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(172, 2, 'Pies', 'Śnieżka', 'pies172.jpg', 'Opis Piesa numer 7', 'Młody', 35.96, 'Duży', 'Samica', 'Długa', 'Czarny', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(173, 2, 'Pies', 'Kaszka', 'pies173.jpg', 'Opis Piesa numer 8', 'Młody', 44.38, 'Mały', 'Samica', 'Krótka', 'Brązowy', 'Akita', NULL, NULL, NULL, 'Tak'),
(174, 2, 'Pies', 'Ruda', 'pies174.jpg', 'Opis Piesa numer 9', 'Dorosły', 18.70, 'Duży', 'Samica', 'Długa', 'Biały', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(175, 2, 'Pies', 'Filuś', 'pies175.jpg', 'Opis Piesa numer 10', 'Szczeniak', 32.91, 'Mały', 'Samiec', 'Jedwabista', 'Inny', 'Akita', NULL, NULL, NULL, 'Nie'),
(176, 2, 'Pies', 'Cezar', 'pies176.jpg', 'Opis Piesa numer 11', 'Szczeniak', 4.80, 'Duży', 'Samiec', 'Krótka', 'Czarny', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(177, 2, 'Pies', 'Kajtek', 'pies177.jpg', 'Opis Piesa numer 12', 'Dorosły', 5.95, 'Średni', 'Samiec', 'Jedwabista', 'Czarny', 'Maltanczyk', NULL, NULL, NULL, 'Nie'),
(178, 2, 'Kot', 'Nikita', 'kot178.jpg', 'Opis Kota numer 13', 'Szczeniak', 10.80, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(179, 2, 'Pies', 'Frida', 'pies179.jpg', 'Opis Piesa numer 14', 'Szczeniak', 11.19, 'Duży', 'Samica', 'Szorstka', 'Czarny', 'Mieszaniec', NULL, NULL, NULL, 'Tak'),
(180, 2, 'Kot', 'Rysiek', 'kot180.jpg', 'Opis Kota numer 15', 'Młody', 14.73, 'Duży', 'Samiec', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(181, 3, 'Pies', 'Śnieżka', 'pies181.jpg', 'Opis Piesa numer 1', 'Dorosły', 34.61, 'Średni', 'Samica', 'Jedwabista', 'Czarny', 'Husky', NULL, NULL, NULL, 'Tak'),
(182, 3, 'Pies', 'Zygmunt', 'pies182.jpg', 'Opis Piesa numer 2', 'Senior', 25.73, 'Duży', 'Samiec', 'Długa', 'Brązowy', 'Husky', NULL, NULL, NULL, 'Nie'),
(183, 3, 'Pies', 'Zuzia', 'pies183.jpg', 'Opis Piesa numer 3', 'Młody', 9.94, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Jack Russell Terrier', NULL, NULL, NULL, 'Tak'),
(184, 3, 'Kot', 'Max', 'kot184.jpg', 'Opis Kota numer 4', 'Młody', 10.31, 'Mały', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(185, 3, 'Kot', 'Frida', 'kot185.jpg', 'Opis Kota numer 5', 'Senior', 11.61, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(186, 3, 'Pies', 'Kaszka', 'pies186.jpg', 'Opis Piesa numer 6', 'Szczeniak', 8.39, 'Średni', 'Samica', 'Długa', 'Biały', 'Fox Terrier', NULL, NULL, NULL, 'Nie'),
(187, 3, 'Pies', 'Siwa', 'pies187.jpg', 'Opis Piesa numer 7', 'Senior', 30.64, 'Duży', 'Samica', 'Jedwabista', 'Brązowy', 'Labrador', NULL, NULL, NULL, 'Nie'),
(188, 3, 'Pies', 'Szefu', 'pies188.jpg', 'Opis Piesa numer 8', 'Szczeniak', 5.30, 'Średni', 'Samiec', 'Krótka', 'Inny', 'Shih Tzu', NULL, NULL, NULL, 'Nie'),
(189, 3, 'Kot', 'Luna', 'kot189.jpg', 'Opis Kota numer 9', 'Dorosły', 7.83, 'Mały', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(190, 3, 'Kot', 'Azor', 'kot190.jpg', 'Opis Kota numer 10', 'Dorosły', 11.91, 'Średni', 'Samiec', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(191, 3, 'Pies', 'Fiodor', 'pies191.jpg', 'Opis Piesa numer 11', 'Szczeniak', 18.70, 'Duży', 'Samiec', 'Długa', 'Biały', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(192, 3, 'Pies', 'Bianka', 'pies192.jpg', 'Opis Piesa numer 12', 'Szczeniak', 8.21, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Shih Tzu', NULL, NULL, NULL, 'Tak'),
(193, 3, 'Kot', 'Zuzia', 'kot193.jpg', 'Opis Kota numer 13', 'Dorosły', 7.07, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(194, 3, 'Kot', 'Burek', 'kot194.jpg', 'Opis Kota numer 14', 'Senior', 8.95, 'Duży', 'Samiec', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(195, 3, 'Pies', 'Łatka', 'pies195.jpg', 'Opis Piesa numer 15', 'Senior', 5.32, 'Średni', 'Samica', 'Długa', 'Czarny', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(196, 4, 'Pies', 'Szaman', 'pies196.jpg', 'Opis Piesa numer 1', 'Szczeniak', 15.74, 'Mały', 'Samiec', 'Jedwabista', 'Czarny', 'Beagle', NULL, NULL, NULL, 'Nie'),
(197, 4, 'Pies', 'Pela', 'pies197.jpg', 'Opis Piesa numer 2', 'Szczeniak', 9.79, 'Duży', 'Samica', 'Długa', 'Biały', 'Fox Terrier', NULL, NULL, NULL, 'Tak'),
(198, 4, 'Kot', 'Pikuś', 'kot198.jpg', 'Opis Kota numer 3', 'Senior', 5.44, 'Mały', 'Samiec', 'Jedwabista', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(199, 4, 'Kot', 'Diva', 'kot199.jpg', 'Opis Kota numer 4', 'Senior', 13.04, 'Duży', 'Samica', 'Krótka', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(200, 4, 'Pies', 'Ruda', 'pies200.jpg', 'Opis Piesa numer 5', 'Szczeniak', 10.64, 'Duży', 'Samica', 'Krótka', 'Biały', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(201, 4, 'Pies', 'Władek', 'pies201.jpg', 'Opis Piesa numer 6', 'Młody', 7.43, 'Mały', 'Samiec', 'Szorstka', 'Inny', 'Shih Tzu', NULL, NULL, NULL, 'Tak'),
(202, 4, 'Kot', 'Rysiek', 'kot202.jpg', 'Opis Kota numer 7', 'Senior', 10.41, 'Duży', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(203, 4, 'Pies', 'Blondie', 'pies203.jpg', 'Opis Piesa numer 8', 'Senior', 10.37, 'Duży', 'Samica', 'Długa', 'Brązowy', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(204, 4, 'Pies', 'Perła', 'pies204.jpg', 'Opis Piesa numer 9', 'Dorosły', 20.02, 'Duży', 'Samica', 'Długa', 'Inny', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(205, 4, 'Pies', 'Pikuś', 'pies205.jpg', 'Opis Piesa numer 10', 'Młody', 32.97, 'Średni', 'Samiec', 'Jedwabista', 'Biały', 'Akita', NULL, NULL, NULL, 'Tak'),
(206, 4, 'Kot', 'Śnieżka', 'kot206.jpg', 'Opis Kota numer 11', 'Młody', 12.66, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(207, 4, 'Kot', 'Bianka', 'kot207.jpg', 'Opis Kota numer 12', 'Senior', 5.25, 'Duży', 'Samica', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(208, 4, 'Pies', 'Czarek', 'pies208.jpg', 'Opis Piesa numer 13', 'Szczeniak', 30.50, 'Średni', 'Samiec', 'Jedwabista', 'Inny', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(209, 4, 'Kot', 'Rita', 'kot209.jpg', 'Opis Kota numer 14', 'Młody', 8.67, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(210, 4, 'Pies', 'Max', 'pies210.jpg', 'Opis Piesa numer 15', 'Szczeniak', 32.53, 'Średni', 'Samiec', 'Długa', 'Czarny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(211, 5, 'Kot', 'Diva', 'kot211.jpg', 'Opis Kota numer 1', 'Młody', 13.11, 'Średni', 'Samica', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(212, 5, 'Kot', 'Łatka', 'kot212.jpg', 'Opis Kota numer 2', 'Szczeniak', 14.55, 'Średni', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(213, 5, 'Kot', 'Poldek', 'kot213.jpg', 'Opis Kota numer 3', 'Senior', 11.78, 'Średni', 'Samiec', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(214, 5, 'Pies', 'Beza', 'pies214.jpg', 'Opis Piesa numer 4', 'Dorosły', 6.72, 'Duży', 'Samica', 'Szorstka', 'Brązowy', 'Mieszaniec', NULL, NULL, NULL, 'Nie'),
(215, 5, 'Pies', 'Nela', 'pies215.jpg', 'Opis Piesa numer 5', 'Dorosły', 8.67, 'Średni', 'Samica', 'Krótka', 'Biały', 'Shih Tzu', NULL, NULL, NULL, 'Nie'),
(216, 5, 'Pies', 'Łatka', 'pies216.jpg', 'Opis Piesa numer 6', 'Szczeniak', 32.10, 'Mały', 'Samica', 'Długa', 'Czarny', 'Husky', NULL, NULL, NULL, 'Nie'),
(217, 5, 'Kot', 'Maks', 'kot217.jpg', 'Opis Kota numer 7', 'Dorosły', 14.26, 'Duży', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(218, 5, 'Pies', 'Bambi', 'pies218.jpg', 'Opis Piesa numer 8', 'Dorosły', 6.70, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Maltanczyk', NULL, NULL, NULL, 'Tak'),
(219, 5, 'Kot', 'Władek', 'kot219.jpg', 'Opis Kota numer 9', 'Senior', 5.32, 'Średni', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(220, 5, 'Kot', 'Gruby', 'kot220.jpg', 'Opis Kota numer 10', 'Dorosły', 14.88, 'Średni', 'Samiec', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(221, 5, 'Pies', 'Fiodor', 'pies221.jpg', 'Opis Piesa numer 11', 'Szczeniak', 6.33, 'Mały', 'Samiec', 'Krótka', 'Czarny', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(222, 5, 'Kot', 'Zuzia', 'kot222.jpg', 'Opis Kota numer 12', 'Młody', 14.55, 'Mały', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(223, 5, 'Pies', 'Bryza', 'pies223.jpg', 'Opis Piesa numer 13', 'Dorosły', 9.39, 'Mały', 'Samica', 'Szorstka', 'Brązowy', 'Mieszaniec', NULL, NULL, NULL, 'Nie'),
(224, 5, 'Pies', 'Koko', 'pies224.jpg', 'Opis Piesa numer 14', 'Dorosły', 10.08, 'Duży', 'Samica', 'Krótka', 'Brązowy', 'West Highland White Terrier', NULL, NULL, NULL, 'Tak'),
(225, 5, 'Kot', 'Pela', 'kot225.jpg', 'Opis Kota numer 15', 'Szczeniak', 14.48, 'Średni', 'Samica', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(226, 6, 'Kot', 'Beza', 'kot226.jpg', 'Opis Kota numer 1', 'Dorosły', 12.20, 'Średni', 'Samica', 'Długa', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(227, 6, 'Pies', 'Pyza', 'pies227.jpg', 'Opis Piesa numer 2', 'Młody', 5.16, 'Średni', 'Samica', 'Krótka', 'Brązowy', 'Maltanczyk', NULL, NULL, NULL, 'Tak'),
(228, 6, 'Pies', 'Koko', 'pies228.jpg', 'Opis Piesa numer 3', 'Młody', 18.60, 'Duży', 'Samica', 'Krótka', 'Czarny', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(229, 6, 'Pies', 'Młotek', 'pies229.jpg', 'Opis Piesa numer 4', 'Dorosły', 20.85, 'Mały', 'Samiec', 'Krótka', 'Czarny', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(230, 6, 'Kot', 'Cezar', 'kot230.jpg', 'Opis Kota numer 5', 'Dorosły', 9.17, 'Średni', 'Samiec', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(231, 6, 'Kot', 'Czarek', 'kot231.jpg', 'Opis Kota numer 6', 'Dorosły', 10.39, 'Mały', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(232, 6, 'Kot', 'Bimber', 'kot232.jpg', 'Opis Kota numer 7', 'Dorosły', 11.83, 'Mały', 'Samiec', 'Krótka', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(233, 6, 'Pies', 'Borys', 'pies233.jpg', 'Opis Piesa numer 8', 'Szczeniak', 27.19, 'Duży', 'Samiec', 'Długa', 'Inny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(234, 6, 'Pies', 'Pela', 'pies234.jpg', 'Opis Piesa numer 9', 'Senior', 27.87, 'Duży', 'Samica', 'Jedwabista', 'Biały', 'Labrador', NULL, NULL, NULL, 'Tak'),
(235, 6, 'Kot', 'Pola', 'kot235.jpg', 'Opis Kota numer 10', 'Dorosły', 9.76, 'Duży', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(236, 6, 'Kot', 'Rysiek', 'kot236.jpg', 'Opis Kota numer 11', 'Senior', 6.82, 'Średni', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(237, 6, 'Kot', 'Milka', 'kot237.jpg', 'Opis Kota numer 12', 'Młody', 5.64, 'Średni', 'Samica', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(238, 6, 'Kot', 'Frida', 'kot238.jpg', 'Opis Kota numer 13', 'Dorosły', 12.66, 'Mały', 'Samica', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(239, 6, 'Pies', 'Nela', 'pies239.jpg', 'Opis Piesa numer 14', 'Dorosły', 13.27, 'Średni', 'Samica', 'Szorstka', 'Czarny', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(240, 6, 'Pies', 'Pola', 'pies240.jpg', 'Opis Piesa numer 15', 'Dorosły', 14.10, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(241, 7, 'Kot', 'Władek', 'kot241.jpg', 'Opis Kota numer 1', 'Szczeniak', 10.90, 'Średni', 'Samiec', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(242, 7, 'Kot', 'Bryza', 'kot242.jpg', 'Opis Kota numer 2', 'Senior', 5.47, 'Średni', 'Samica', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(243, 7, 'Kot', 'Pela', 'kot243.jpg', 'Opis Kota numer 3', 'Młody', 5.62, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(244, 7, 'Pies', 'Bruno', 'pies244.jpg', 'Opis Piesa numer 4', 'Senior', 33.46, 'Średni', 'Samiec', 'Jedwabista', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(245, 7, 'Pies', 'Baśka', 'pies245.jpg', 'Opis Piesa numer 5', 'Młody', 25.39, 'Duży', 'Samica', 'Długa', 'Brązowy', 'Labrador', NULL, NULL, NULL, 'Nie'),
(246, 7, 'Pies', 'Czarek', 'pies246.jpg', 'Opis Piesa numer 6', 'Młody', 32.55, 'Duży', 'Samiec', 'Krótka', 'Inny', 'Husky', NULL, NULL, NULL, 'Tak'),
(247, 7, 'Pies', 'Pela', 'pies247.jpg', 'Opis Piesa numer 7', 'Senior', 19.86, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(248, 7, 'Pies', 'Reksio', 'pies248.jpg', 'Opis Piesa numer 8', 'Senior', 12.35, 'Mały', 'Samiec', 'Jedwabista', 'Czarny', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(249, 7, 'Pies', 'Władek', 'pies249.jpg', 'Opis Piesa numer 9', 'Senior', 33.58, 'Duży', 'Samiec', 'Jedwabista', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Nie'),
(250, 7, 'Kot', 'Diva', 'kot250.jpg', 'Opis Kota numer 10', 'Dorosły', 6.97, 'Duży', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(251, 7, 'Pies', 'Bambi', 'pies251.jpg', 'Opis Piesa numer 11', 'Senior', 6.02, 'Mały', 'Samica', 'Szorstka', 'Brązowy', 'Maltanczyk', NULL, NULL, NULL, 'Nie'),
(252, 7, 'Pies', 'Ruda', 'pies252.jpg', 'Opis Piesa numer 12', 'Młody', 28.81, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Husky', NULL, NULL, NULL, 'Nie'),
(253, 7, 'Pies', 'Kajtek', 'pies253.jpg', 'Opis Piesa numer 13', 'Młody', 37.55, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'Akita', NULL, NULL, NULL, 'Tak'),
(254, 7, 'Kot', 'Filuś', 'kot254.jpg', 'Opis Kota numer 14', 'Senior', 5.27, 'Duży', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(255, 7, 'Kot', 'Bianka', 'kot255.jpg', 'Opis Kota numer 15', 'Dorosły', 5.43, 'Duży', 'Samica', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(256, 8, 'Pies', 'Młotek', 'pies256.jpg', 'Opis Piesa numer 1', 'Senior', 9.66, 'Mały', 'Samiec', 'Szorstka', 'Brązowy', 'Jack Russell Terrier', NULL, NULL, NULL, 'Tak'),
(257, 8, 'Kot', 'Baśka', 'kot257.jpg', 'Opis Kota numer 2', 'Senior', 9.02, 'Mały', 'Samica', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(258, 8, 'Kot', 'Max', 'kot258.jpg', 'Opis Kota numer 3', 'Młody', 5.70, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(259, 8, 'Pies', 'Bianka', 'pies259.jpg', 'Opis Piesa numer 4', 'Szczeniak', 32.02, 'Mały', 'Samica', 'Krótka', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(260, 8, 'Kot', 'Burek', 'kot260.jpg', 'Opis Kota numer 5', 'Młody', 9.51, 'Duży', 'Samiec', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(261, 8, 'Kot', 'Perła', 'kot261.jpg', 'Opis Kota numer 6', 'Młody', 9.20, 'Średni', 'Samica', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(262, 8, 'Pies', 'Milka', 'pies262.jpg', 'Opis Piesa numer 7', 'Dorosły', 7.87, 'Mały', 'Samica', 'Szorstka', 'Biały', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(263, 8, 'Pies', 'Reksio', 'pies263.jpg', 'Opis Piesa numer 8', 'Senior', 36.17, 'Średni', 'Samiec', 'Krótka', 'Inny', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(264, 8, 'Kot', 'Filuś', 'kot264.jpg', 'Opis Kota numer 9', 'Dorosły', 14.63, 'Duży', 'Samiec', 'Długa', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(265, 8, 'Pies', 'Rocky', 'pies265.jpg', 'Opis Piesa numer 10', 'Senior', 32.47, 'Średni', 'Samiec', 'Długa', 'Brązowy', 'Labrador', NULL, NULL, NULL, 'Tak'),
(266, 8, 'Kot', 'Diva', 'kot266.jpg', 'Opis Kota numer 11', 'Młody', 7.80, 'Średni', 'Samica', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(267, 8, 'Pies', 'Łatka', 'pies267.jpg', 'Opis Piesa numer 12', 'Młody', 31.41, 'Średni', 'Samica', 'Szorstka', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(268, 8, 'Kot', 'Zygmunt', 'kot268.jpg', 'Opis Kota numer 13', 'Młody', 11.23, 'Średni', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(269, 8, 'Pies', 'Pela', 'pies269.jpg', 'Opis Piesa numer 14', 'Dorosły', 7.06, 'Średni', 'Samica', 'Długa', 'Brązowy', 'Jack Russell Terrier', NULL, NULL, NULL, 'Tak'),
(270, 8, 'Kot', 'Gruby', 'kot270.jpg', 'Opis Kota numer 15', 'Senior', 12.40, 'Duży', 'Samiec', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(271, 9, 'Kot', 'Pikuś', 'kot271.jpg', 'Opis Kota numer 1', 'Szczeniak', 6.26, 'Mały', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(272, 9, 'Kot', 'Bianka', 'kot272.jpg', 'Opis Kota numer 2', 'Senior', 9.10, 'Duży', 'Samica', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(273, 9, 'Pies', 'Frida', 'pies273.jpg', 'Opis Piesa numer 3', 'Szczeniak', 22.26, 'Średni', 'Samica', 'Krótka', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(274, 9, 'Kot', 'Oreo', 'kot274.jpg', 'Opis Kota numer 4', 'Dorosły', 11.52, 'Średni', 'Samiec', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(275, 9, 'Kot', 'Bambi', 'kot275.jpg', 'Opis Kota numer 5', 'Senior', 8.78, 'Średni', 'Samica', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(276, 9, 'Kot', 'Zuzia', 'kot276.jpg', 'Opis Kota numer 6', 'Dorosły', 6.87, 'Duży', 'Samica', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(277, 9, 'Kot', 'Beza', 'kot277.jpg', 'Opis Kota numer 7', 'Młody', 8.89, 'Średni', 'Samica', 'Jedwabista', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(278, 9, 'Kot', 'Bambi', 'kot278.jpg', 'Opis Kota numer 8', 'Dorosły', 12.95, 'Mały', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(279, 9, 'Kot', 'Czarek', 'kot279.jpg', 'Opis Kota numer 9', 'Dorosły', 9.60, 'Średni', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(280, 9, 'Kot', 'Zygmunt', 'kot280.jpg', 'Opis Kota numer 10', 'Młody', 5.77, 'Średni', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(281, 9, 'Kot', 'Oreo', 'kot281.jpg', 'Opis Kota numer 11', 'Senior', 12.00, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(282, 9, 'Kot', 'Rita', 'kot282.jpg', 'Opis Kota numer 12', 'Senior', 12.44, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(283, 9, 'Kot', 'Rita', 'kot283.jpg', 'Opis Kota numer 13', 'Szczeniak', 14.73, 'Duży', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(284, 9, 'Kot', 'Rysiek', 'kot284.jpg', 'Opis Kota numer 14', 'Senior', 14.40, 'Średni', 'Samiec', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(285, 9, 'Pies', 'Fiona', 'pies285.jpg', 'Opis Piesa numer 15', 'Szczeniak', 37.66, 'Średni', 'Samica', 'Krótka', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(286, 10, 'Kot', 'Czika', 'kot286.jpg', 'Opis Kota numer 1', 'Szczeniak', 12.55, 'Duży', 'Samica', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(287, 10, 'Kot', 'Zygmunt', 'kot287.jpg', 'Opis Kota numer 2', 'Młody', 13.98, 'Duży', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(288, 10, 'Kot', 'Władek', 'kot288.jpg', 'Opis Kota numer 3', 'Szczeniak', 11.16, 'Mały', 'Samiec', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(289, 10, 'Kot', 'Pela', 'kot289.jpg', 'Opis Kota numer 4', 'Dorosły', 10.65, 'Duży', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(290, 10, 'Pies', 'Blondie', 'pies290.jpg', 'Opis Piesa numer 5', 'Szczeniak', 38.64, 'Mały', 'Samica', 'Krótka', 'Brązowy', 'Owczarek Niemiecki', NULL, NULL, NULL, 'Nie'),
(291, 10, 'Kot', 'Bobik', 'kot291.jpg', 'Opis Kota numer 6', 'Dorosły', 5.52, 'Średni', 'Samiec', 'Jedwabista', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(292, 10, 'Kot', 'Cezar', 'kot292.jpg', 'Opis Kota numer 7', 'Dorosły', 6.42, 'Średni', 'Samiec', 'Jedwabista', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(293, 10, 'Kot', 'Bianka', 'kot293.jpg', 'Opis Kota numer 8', 'Młody', 12.79, 'Mały', 'Samica', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(294, 10, 'Kot', 'Diva', 'kot294.jpg', 'Opis Kota numer 9', 'Szczeniak', 10.79, 'Duży', 'Samica', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(295, 10, 'Kot', 'Plamka', 'kot295.jpg', 'Opis Kota numer 10', 'Dorosły', 5.13, 'Średni', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(296, 10, 'Kot', 'Perła', 'kot296.jpg', 'Opis Kota numer 11', 'Senior', 5.20, 'Mały', 'Samica', 'Krótka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(297, 10, 'Kot', 'Koko', 'kot297.jpg', 'Opis Kota numer 12', 'Senior', 7.62, 'Średni', 'Samica', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(298, 10, 'Kot', 'Baśka', 'kot298.jpg', 'Opis Kota numer 13', 'Szczeniak', 12.68, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(299, 10, 'Kot', 'Ruda', 'kot299.jpg', 'Opis Kota numer 14', 'Szczeniak', 6.05, 'Mały', 'Samica', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(300, 10, 'Kot', 'Gruby', 'kot300.jpg', 'Opis Kota numer 15', 'Szczeniak', 11.76, 'Duży', 'Samiec', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(301, 1, 'Kot', 'Bruno', 'kot301.jpg', 'Opis Kota numer 3', 'Senior', 6.90, 'Mały', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(302, 1, 'Pies', 'Siwa', 'pies302.jpg', 'Opis Piesa numer 4', 'Młody', 18.38, 'Duży', 'Samica', 'Krótka', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(303, 1, 'Kot', 'Pela', 'kot303.jpg', 'Opis Kota numer 5', 'Młody', 14.70, 'Średni', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(304, 1, 'Pies', 'Bobik', 'pies304.jpg', 'Opis Piesa numer 6', 'Szczeniak', 26.64, 'Mały', 'Samiec', 'Szorstka', 'Biały', 'Labrador', NULL, NULL, NULL, 'Tak'),
(305, 1, 'Kot', 'Młotek', 'kot305.jpg', 'Opis Kota numer 7', 'Młody', 11.38, 'Średni', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(306, 1, 'Pies', 'Młotek', 'pies306.jpg', 'Opis Piesa numer 8', 'Młody', 6.98, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'Yorkshire Terrier', NULL, NULL, NULL, 'Tak'),
(307, 1, 'Pies', 'Bobik', 'pies307.jpg', 'Opis Piesa numer 9', 'Senior', 22.64, 'Średni', 'Samiec', 'Krótka', 'Czarny', 'Buldog', NULL, NULL, NULL, 'Nie'),
(308, 1, 'Pies', 'Blondie', 'pies308.jpg', 'Opis Piesa numer 10', 'Młody', 29.18, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Buldog', NULL, NULL, NULL, 'Tak'),
(309, 1, 'Kot', 'Blondie', 'kot309.jpg', 'Opis Kota numer 11', 'Senior', 6.11, 'Mały', 'Samica', 'Długa', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(310, 1, 'Kot', 'Beza', 'kot310.jpg', 'Opis Kota numer 12', 'Dorosły', 7.80, 'Mały', 'Samica', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(311, 1, 'Pies', 'Zuzia', 'pies311.jpg', 'Opis Piesa numer 13', 'Senior', 16.54, 'Mały', 'Samica', 'Jedwabista', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(312, 1, 'Kot', 'Śnieżka', 'kot312.jpg', 'Opis Kota numer 14', 'Szczeniak', 13.91, 'Średni', 'Samica', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(313, 1, 'Kot', 'Reksio', 'kot313.jpg', 'Opis Kota numer 15', 'Szczeniak', 10.65, 'Średni', 'Samiec', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(314, 2, 'Kot', 'Reksio', 'kot314.jpg', 'Opis Kota numer 1', 'Szczeniak', 9.44, 'Duży', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(315, 2, 'Kot', 'Max', 'kot315.jpg', 'Opis Kota numer 2', 'Szczeniak', 13.40, 'Mały', 'Samiec', 'Długa', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(316, 2, 'Kot', 'Łatka', 'kot316.jpg', 'Opis Kota numer 3', 'Senior', 14.82, 'Duży', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(317, 2, 'Pies', 'Pluton', 'pies317.jpg', 'Opis Piesa numer 4', 'Dorosły', 35.19, 'Duży', 'Samiec', 'Szorstka', 'Czarny', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(318, 2, 'Pies', 'Azor', 'pies318.jpg', 'Opis Piesa numer 5', 'Senior', 17.05, 'Średni', 'Samiec', 'Jedwabista', 'Czarny', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(319, 2, 'Kot', 'Pola', 'kot319.jpg', 'Opis Kota numer 6', 'Dorosły', 10.76, 'Mały', 'Samica', 'Krótka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak');
INSERT INTO `zwierzeta` (`ZwierzeId`, `SchroniskoId`, `Typ`, `Imie`, `ZdjecieURL`, `Opis`, `Wiek`, `Waga`, `Wielkosc`, `Plec`, `RodzajWlosia`, `Kolor`, `RasaPsa`, `RasaKota`, `CechyZachowania`, `PrzebyteChoroby`, `Kastrowany`) VALUES
(320, 2, 'Pies', 'Plamka', 'pies320.jpg', 'Opis Piesa numer 7', 'Młody', 35.96, 'Duży', 'Samica', 'Długa', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Nie'),
(321, 2, 'Pies', 'Śnieżka', 'pies321.jpg', 'Opis Piesa numer 8', 'Młody', 44.38, 'Mały', 'Samica', 'Krótka', 'Inny', 'Akita', NULL, NULL, NULL, 'Nie'),
(322, 2, 'Pies', 'Ruda', 'pies322.jpg', 'Opis Piesa numer 9', 'Dorosły', 18.70, 'Duży', 'Samica', 'Długa', 'Czarny', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(323, 2, 'Pies', 'Max', 'pies323.jpg', 'Opis Piesa numer 10', 'Szczeniak', 32.91, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', 'Akita', NULL, NULL, NULL, 'Nie'),
(324, 2, 'Pies', 'Władek', 'pies324.jpg', 'Opis Piesa numer 11', 'Szczeniak', 4.80, 'Duży', 'Samiec', 'Krótka', 'Brązowy', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(325, 2, 'Pies', 'Gruby', 'pies325.jpg', 'Opis Piesa numer 12', 'Dorosły', 5.95, 'Średni', 'Samiec', 'Jedwabista', 'Biały', 'Maltanczyk', NULL, NULL, NULL, 'Nie'),
(326, 2, 'Kot', 'Nikita', 'kot326.jpg', 'Opis Kota numer 13', 'Szczeniak', 10.80, 'Mały', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(327, 2, 'Pies', 'Śnieżka', 'pies327.jpg', 'Opis Piesa numer 14', 'Szczeniak', 11.19, 'Duży', 'Samica', 'Szorstka', 'Brązowy', 'Mieszaniec', NULL, NULL, NULL, 'Tak'),
(328, 2, 'Kot', 'Maks', 'kot328.jpg', 'Opis Kota numer 15', 'Młody', 14.73, 'Duży', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(329, 3, 'Pies', 'Frida', 'pies329.jpg', 'Opis Piesa numer 1', 'Dorosły', 34.61, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Husky', NULL, NULL, NULL, 'Nie'),
(330, 3, 'Pies', 'Poldek', 'pies330.jpg', 'Opis Piesa numer 2', 'Senior', 25.73, 'Duży', 'Samiec', 'Długa', 'Biały', 'Husky', NULL, NULL, NULL, 'Tak'),
(331, 3, 'Pies', 'Pela', 'pies331.jpg', 'Opis Piesa numer 3', 'Młody', 9.94, 'Średni', 'Samica', 'Jedwabista', 'Czarny', 'Jack Russell Terrier', NULL, NULL, NULL, 'Tak'),
(332, 3, 'Kot', 'Burek', 'kot332.jpg', 'Opis Kota numer 4', 'Młody', 10.31, 'Mały', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(333, 3, 'Kot', 'Kaszka', 'kot333.jpg', 'Opis Kota numer 5', 'Senior', 11.61, 'Średni', 'Samica', 'Jedwabista', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(334, 3, 'Pies', 'Koko', 'pies334.jpg', 'Opis Piesa numer 6', 'Szczeniak', 8.39, 'Średni', 'Samica', 'Długa', 'Biały', 'Fox Terrier', NULL, NULL, NULL, 'Nie'),
(335, 3, 'Pies', 'Czika', 'pies335.jpg', 'Opis Piesa numer 7', 'Senior', 30.64, 'Duży', 'Samica', 'Jedwabista', 'Inny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(336, 3, 'Pies', 'Młotek', 'pies336.jpg', 'Opis Piesa numer 8', 'Szczeniak', 5.30, 'Średni', 'Samiec', 'Krótka', 'Brązowy', 'Shih Tzu', NULL, NULL, NULL, 'Tak'),
(337, 3, 'Kot', 'Luna', 'kot337.jpg', 'Opis Kota numer 9', 'Dorosły', 7.83, 'Mały', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(338, 3, 'Kot', 'Szarik', 'kot338.jpg', 'Opis Kota numer 10', 'Dorosły', 11.91, 'Średni', 'Samiec', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(339, 3, 'Pies', 'Gruby', 'pies339.jpg', 'Opis Piesa numer 11', 'Szczeniak', 18.70, 'Duży', 'Samiec', 'Długa', 'Czarny', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(340, 3, 'Pies', 'Pyza', 'pies340.jpg', 'Opis Piesa numer 12', 'Szczeniak', 8.21, 'Mały', 'Samica', 'Długa', 'Czarny', 'Shih Tzu', NULL, NULL, NULL, 'Nie'),
(341, 3, 'Kot', 'Bryza', 'kot341.jpg', 'Opis Kota numer 13', 'Dorosły', 7.07, 'Średni', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(342, 3, 'Kot', 'Pluton', 'kot342.jpg', 'Opis Kota numer 14', 'Senior', 8.95, 'Duży', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(343, 3, 'Pies', 'Bianka', 'pies343.jpg', 'Opis Piesa numer 15', 'Senior', 5.32, 'Średni', 'Samica', 'Długa', 'Brązowy', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(344, 4, 'Pies', 'Fiodor', 'pies344.jpg', 'Opis Piesa numer 1', 'Szczeniak', 15.74, 'Mały', 'Samiec', 'Jedwabista', 'Inny', 'Beagle', NULL, NULL, NULL, 'Tak'),
(345, 4, 'Pies', 'Bianka', 'pies345.jpg', 'Opis Piesa numer 2', 'Szczeniak', 9.79, 'Duży', 'Samica', 'Długa', 'Brązowy', 'Fox Terrier', NULL, NULL, NULL, 'Nie'),
(346, 4, 'Kot', 'Władek', 'kot346.jpg', 'Opis Kota numer 3', 'Senior', 5.44, 'Mały', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(347, 4, 'Kot', 'Mokka', 'kot347.jpg', 'Opis Kota numer 4', 'Senior', 13.04, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(348, 4, 'Pies', 'Łatka', 'pies348.jpg', 'Opis Piesa numer 5', 'Szczeniak', 10.64, 'Duży', 'Samica', 'Krótka', 'Biały', 'West Highland White Terrier', NULL, NULL, NULL, 'Tak'),
(349, 4, 'Pies', 'Władek', 'pies349.jpg', 'Opis Piesa numer 6', 'Młody', 7.43, 'Mały', 'Samiec', 'Szorstka', 'Brązowy', 'Shih Tzu', NULL, NULL, NULL, 'Nie'),
(350, 4, 'Kot', 'Burek', 'kot350.jpg', 'Opis Kota numer 7', 'Senior', 10.41, 'Duży', 'Samiec', 'Jedwabista', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(351, 4, 'Pies', 'Bryza', 'pies351.jpg', 'Opis Piesa numer 8', 'Senior', 10.37, 'Duży', 'Samica', 'Długa', 'Inny', 'West Highland White Terrier', NULL, NULL, NULL, 'Tak'),
(352, 4, 'Pies', 'Pola', 'pies352.jpg', 'Opis Piesa numer 9', 'Dorosły', 20.02, 'Duży', 'Samica', 'Długa', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(353, 4, 'Pies', 'Szefu', 'pies353.jpg', 'Opis Piesa numer 10', 'Młody', 32.97, 'Średni', 'Samiec', 'Jedwabista', 'Czarny', 'Akita', NULL, NULL, NULL, 'Nie'),
(354, 4, 'Kot', 'Pyza', 'kot354.jpg', 'Opis Kota numer 11', 'Młody', 12.66, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(355, 4, 'Kot', 'Koko', 'kot355.jpg', 'Opis Kota numer 12', 'Senior', 5.25, 'Duży', 'Samica', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(356, 4, 'Pies', 'Burek', 'pies356.jpg', 'Opis Piesa numer 13', 'Szczeniak', 30.50, 'Średni', 'Samiec', 'Jedwabista', 'Inny', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(357, 4, 'Kot', 'Pyza', 'kot357.jpg', 'Opis Kota numer 14', 'Młody', 8.67, 'Mały', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(358, 4, 'Pies', 'Szarik', 'pies358.jpg', 'Opis Piesa numer 15', 'Szczeniak', 32.53, 'Średni', 'Samiec', 'Długa', 'Czarny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(359, 5, 'Kot', 'Mokka', 'kot359.jpg', 'Opis Kota numer 1', 'Młody', 13.11, 'Średni', 'Samica', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(360, 5, 'Kot', 'Bryza', 'kot360.jpg', 'Opis Kota numer 2', 'Szczeniak', 14.55, 'Średni', 'Samica', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(361, 5, 'Kot', 'Młotek', 'kot361.jpg', 'Opis Kota numer 3', 'Senior', 11.78, 'Średni', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(362, 5, 'Pies', 'Łatka', 'pies362.jpg', 'Opis Piesa numer 4', 'Dorosły', 6.72, 'Duży', 'Samica', 'Szorstka', 'Brązowy', 'Mieszaniec', NULL, NULL, NULL, 'Nie'),
(363, 5, 'Pies', 'Diva', 'pies363.jpg', 'Opis Piesa numer 5', 'Dorosły', 8.67, 'Średni', 'Samica', 'Krótka', 'Inny', 'Shih Tzu', NULL, NULL, NULL, 'Tak'),
(364, 5, 'Pies', 'Kaszka', 'pies364.jpg', 'Opis Piesa numer 6', 'Szczeniak', 32.10, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Husky', NULL, NULL, NULL, 'Tak'),
(365, 5, 'Kot', 'Filuś', 'kot365.jpg', 'Opis Kota numer 7', 'Dorosły', 14.26, 'Duży', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(366, 5, 'Pies', 'Milka', 'pies366.jpg', 'Opis Piesa numer 8', 'Dorosły', 6.70, 'Średni', 'Samica', 'Jedwabista', 'Inny', 'Maltanczyk', NULL, NULL, NULL, 'Nie'),
(367, 5, 'Kot', 'Kajtek', 'kot367.jpg', 'Opis Kota numer 9', 'Senior', 5.32, 'Średni', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(368, 5, 'Kot', 'Zygmunt', 'kot368.jpg', 'Opis Kota numer 10', 'Dorosły', 14.88, 'Średni', 'Samiec', 'Długa', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(369, 5, 'Pies', 'Władek', 'pies369.jpg', 'Opis Piesa numer 11', 'Szczeniak', 6.33, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(370, 5, 'Kot', 'Ruda', 'kot370.jpg', 'Opis Kota numer 12', 'Młody', 14.55, 'Mały', 'Samica', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(371, 5, 'Pies', 'Nikita', 'pies371.jpg', 'Opis Piesa numer 13', 'Dorosły', 9.39, 'Mały', 'Samica', 'Szorstka', 'Biały', 'Mieszaniec', NULL, NULL, NULL, 'Tak'),
(372, 5, 'Pies', 'Beza', 'pies372.jpg', 'Opis Piesa numer 14', 'Dorosły', 10.08, 'Duży', 'Samica', 'Krótka', 'Biały', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(373, 5, 'Kot', 'Śnieżka', 'kot373.jpg', 'Opis Kota numer 15', 'Szczeniak', 14.48, 'Średni', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(374, 6, 'Kot', 'Blondie', 'kot374.jpg', 'Opis Kota numer 1', 'Dorosły', 12.20, 'Średni', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(375, 6, 'Pies', 'Perła', 'pies375.jpg', 'Opis Piesa numer 2', 'Młody', 5.16, 'Średni', 'Samica', 'Krótka', 'Biały', 'Maltanczyk', NULL, NULL, NULL, 'Nie'),
(376, 6, 'Pies', 'Pela', 'pies376.jpg', 'Opis Piesa numer 3', 'Młody', 18.60, 'Duży', 'Samica', 'Krótka', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(377, 6, 'Pies', 'Zygmunt', 'pies377.jpg', 'Opis Piesa numer 4', 'Dorosły', 20.85, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(378, 6, 'Kot', 'Czarek', 'kot378.jpg', 'Opis Kota numer 5', 'Dorosły', 9.17, 'Średni', 'Samiec', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(379, 6, 'Kot', 'Rysiek', 'kot379.jpg', 'Opis Kota numer 6', 'Dorosły', 10.39, 'Mały', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(380, 6, 'Kot', 'Max', 'kot380.jpg', 'Opis Kota numer 7', 'Dorosły', 11.83, 'Mały', 'Samiec', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(381, 6, 'Pies', 'Kajtek', 'pies381.jpg', 'Opis Piesa numer 8', 'Szczeniak', 27.19, 'Duży', 'Samiec', 'Długa', 'Brązowy', 'Labrador', NULL, NULL, NULL, 'Tak'),
(382, 6, 'Pies', 'Pyza', 'pies382.jpg', 'Opis Piesa numer 9', 'Senior', 27.87, 'Duży', 'Samica', 'Jedwabista', 'Biały', 'Labrador', NULL, NULL, NULL, 'Tak'),
(383, 6, 'Kot', 'Kaszka', 'kot383.jpg', 'Opis Kota numer 10', 'Dorosły', 9.76, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(384, 6, 'Kot', 'Oreo', 'kot384.jpg', 'Opis Kota numer 11', 'Senior', 6.82, 'Średni', 'Samiec', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(385, 6, 'Kot', 'Czika', 'kot385.jpg', 'Opis Kota numer 12', 'Młody', 5.64, 'Średni', 'Samica', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(386, 6, 'Kot', 'Ruda', 'kot386.jpg', 'Opis Kota numer 13', 'Dorosły', 12.66, 'Mały', 'Samica', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(387, 6, 'Pies', 'Rita', 'pies387.jpg', 'Opis Piesa numer 14', 'Dorosły', 13.27, 'Średni', 'Samica', 'Szorstka', 'Inny', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(388, 6, 'Pies', 'Baśka', 'pies388.jpg', 'Opis Piesa numer 15', 'Dorosły', 14.10, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(389, 7, 'Kot', 'Cezar', 'kot389.jpg', 'Opis Kota numer 1', 'Szczeniak', 10.90, 'Średni', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(390, 7, 'Kot', 'Koko', 'kot390.jpg', 'Opis Kota numer 2', 'Senior', 5.47, 'Średni', 'Samica', 'Długa', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(391, 7, 'Kot', 'Zuzia', 'kot391.jpg', 'Opis Kota numer 3', 'Młody', 5.62, 'Średni', 'Samica', 'Jedwabista', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(392, 7, 'Pies', 'Cezar', 'pies392.jpg', 'Opis Piesa numer 4', 'Senior', 33.46, 'Średni', 'Samiec', 'Jedwabista', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(393, 7, 'Pies', 'Mokka', 'pies393.jpg', 'Opis Piesa numer 5', 'Młody', 25.39, 'Duży', 'Samica', 'Długa', 'Inny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(394, 7, 'Pies', 'Reksio', 'pies394.jpg', 'Opis Piesa numer 6', 'Młody', 32.55, 'Duży', 'Samiec', 'Krótka', 'Czarny', 'Husky', NULL, NULL, NULL, 'Tak'),
(395, 7, 'Pies', 'Doda', 'pies395.jpg', 'Opis Piesa numer 7', 'Senior', 19.86, 'Średni', 'Samica', 'Jedwabista', 'Brązowy', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(396, 7, 'Pies', 'Czarek', 'pies396.jpg', 'Opis Piesa numer 8', 'Senior', 12.35, 'Mały', 'Samiec', 'Jedwabista', 'Czarny', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(397, 7, 'Pies', 'Cezar', 'pies397.jpg', 'Opis Piesa numer 9', 'Senior', 33.58, 'Duży', 'Samiec', 'Jedwabista', 'Inny', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(398, 7, 'Kot', 'Pola', 'kot398.jpg', 'Opis Kota numer 10', 'Dorosły', 6.97, 'Duży', 'Samica', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(399, 7, 'Pies', 'Blondie', 'pies399.jpg', 'Opis Piesa numer 11', 'Senior', 6.02, 'Mały', 'Samica', 'Szorstka', 'Brązowy', 'Maltanczyk', NULL, NULL, NULL, 'Tak'),
(400, 7, 'Pies', 'Beza', 'pies400.jpg', 'Opis Piesa numer 12', 'Młody', 28.81, 'Mały', 'Samica', 'Długa', 'Czarny', 'Husky', NULL, NULL, NULL, 'Tak'),
(401, 7, 'Pies', 'Filuś', 'pies401.jpg', 'Opis Piesa numer 13', 'Młody', 37.55, 'Mały', 'Samiec', 'Krótka', 'Czarny', 'Akita', NULL, NULL, NULL, 'Nie'),
(402, 7, 'Kot', 'Cezar', 'kot402.jpg', 'Opis Kota numer 14', 'Senior', 5.27, 'Duży', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(403, 7, 'Kot', 'Ruda', 'kot403.jpg', 'Opis Kota numer 15', 'Dorosły', 5.43, 'Duży', 'Samica', 'Krótka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(404, 8, 'Pies', 'Młotek', 'pies404.jpg', 'Opis Piesa numer 1', 'Senior', 9.66, 'Mały', 'Samiec', 'Szorstka', 'Czarny', 'Jack Russell Terrier', NULL, NULL, NULL, 'Tak'),
(405, 8, 'Kot', 'Śnieżka', 'kot405.jpg', 'Opis Kota numer 2', 'Senior', 9.02, 'Mały', 'Samica', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(406, 8, 'Kot', 'Bimber', 'kot406.jpg', 'Opis Kota numer 3', 'Młody', 5.70, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(407, 8, 'Pies', 'Bambi', 'pies407.jpg', 'Opis Piesa numer 4', 'Szczeniak', 32.02, 'Mały', 'Samica', 'Krótka', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Nie'),
(408, 8, 'Kot', 'Pluton', 'kot408.jpg', 'Opis Kota numer 5', 'Młody', 9.51, 'Duży', 'Samiec', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(409, 8, 'Kot', 'Bryza', 'kot409.jpg', 'Opis Kota numer 6', 'Młody', 9.20, 'Średni', 'Samica', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(410, 8, 'Pies', 'Beza', 'pies410.jpg', 'Opis Piesa numer 7', 'Dorosły', 7.87, 'Mały', 'Samica', 'Szorstka', 'Brązowy', 'West Highland White Terrier', NULL, NULL, NULL, 'Nie'),
(411, 8, 'Pies', 'Azor', 'pies411.jpg', 'Opis Piesa numer 8', 'Senior', 36.17, 'Średni', 'Samiec', 'Krótka', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(412, 8, 'Kot', 'Zygmunt', 'kot412.jpg', 'Opis Kota numer 9', 'Dorosły', 14.63, 'Duży', 'Samiec', 'Długa', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(413, 8, 'Pies', 'Gruby', 'pies413.jpg', 'Opis Piesa numer 10', 'Senior', 32.47, 'Średni', 'Samiec', 'Długa', 'Brązowy', 'Labrador', NULL, NULL, NULL, 'Nie'),
(414, 8, 'Kot', 'Zuzia', 'kot414.jpg', 'Opis Kota numer 11', 'Młody', 7.80, 'Średni', 'Samica', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(415, 8, 'Pies', 'Nikita', 'pies415.jpg', 'Opis Piesa numer 12', 'Młody', 31.41, 'Średni', 'Samica', 'Szorstka', 'Inny', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(416, 8, 'Kot', 'Zygmunt', 'kot416.jpg', 'Opis Kota numer 13', 'Młody', 11.23, 'Średni', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(417, 8, 'Pies', 'Plamka', 'pies417.jpg', 'Opis Piesa numer 14', 'Dorosły', 7.06, 'Średni', 'Samica', 'Długa', 'Biały', 'Jack Russell Terrier', NULL, NULL, NULL, 'Tak'),
(418, 8, 'Kot', 'Fiodor', 'kot418.jpg', 'Opis Kota numer 15', 'Senior', 12.40, 'Duży', 'Samiec', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(419, 9, 'Kot', 'Oreo', 'kot419.jpg', 'Opis Kota numer 1', 'Szczeniak', 6.26, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(420, 9, 'Kot', 'Fiona', 'kot420.jpg', 'Opis Kota numer 2', 'Senior', 9.10, 'Duży', 'Samica', 'Szorstka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(421, 9, 'Pies', 'Łatka', 'pies421.jpg', 'Opis Piesa numer 3', 'Szczeniak', 22.26, 'Średni', 'Samica', 'Krótka', 'Biały', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(422, 9, 'Kot', 'Filuś', 'kot422.jpg', 'Opis Kota numer 4', 'Dorosły', 11.52, 'Średni', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(423, 9, 'Kot', 'Rita', 'kot423.jpg', 'Opis Kota numer 5', 'Senior', 8.78, 'Średni', 'Samica', 'Krótka', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(424, 9, 'Kot', 'Nikita', 'kot424.jpg', 'Opis Kota numer 6', 'Dorosły', 6.87, 'Duży', 'Samica', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(425, 9, 'Kot', 'Koko', 'kot425.jpg', 'Opis Kota numer 7', 'Młody', 8.89, 'Średni', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(426, 9, 'Kot', 'Nela', 'kot426.jpg', 'Opis Kota numer 8', 'Dorosły', 12.95, 'Mały', 'Samica', 'Jedwabista', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(427, 9, 'Kot', 'Szaman', 'kot427.jpg', 'Opis Kota numer 9', 'Dorosły', 9.60, 'Średni', 'Samiec', 'Szorstka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(428, 9, 'Kot', 'Kajtek', 'kot428.jpg', 'Opis Kota numer 10', 'Młody', 5.77, 'Średni', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(429, 9, 'Kot', 'Zygmunt', 'kot429.jpg', 'Opis Kota numer 11', 'Senior', 12.00, 'Mały', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(430, 9, 'Kot', 'Blondie', 'kot430.jpg', 'Opis Kota numer 12', 'Senior', 12.44, 'Duży', 'Samica', 'Krótka', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(431, 9, 'Kot', 'Baśka', 'kot431.jpg', 'Opis Kota numer 13', 'Szczeniak', 14.73, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(432, 9, 'Kot', 'Bimber', 'kot432.jpg', 'Opis Kota numer 14', 'Senior', 14.40, 'Średni', 'Samiec', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(433, 9, 'Pies', 'Ruda', 'pies433.jpg', 'Opis Piesa numer 15', 'Szczeniak', 37.66, 'Średni', 'Samica', 'Krótka', 'Brązowy', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(434, 10, 'Kot', 'Doda', 'kot434.jpg', 'Opis Kota numer 1', 'Szczeniak', 12.55, 'Duży', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(435, 10, 'Kot', 'Poldek', 'kot435.jpg', 'Opis Kota numer 2', 'Młody', 13.98, 'Duży', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(436, 10, 'Kot', 'Bobik', 'kot436.jpg', 'Opis Kota numer 3', 'Szczeniak', 11.16, 'Mały', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(437, 10, 'Kot', 'Doda', 'kot437.jpg', 'Opis Kota numer 4', 'Dorosły', 10.65, 'Duży', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(438, 10, 'Pies', 'Śnieżka', 'pies438.jpg', 'Opis Piesa numer 5', 'Szczeniak', 38.64, 'Mały', 'Samica', 'Krótka', 'Biały', 'Owczarek Niemiecki', NULL, NULL, NULL, 'Tak'),
(439, 10, 'Kot', 'Kukuś', 'kot439.jpg', 'Opis Kota numer 6', 'Dorosły', 5.52, 'Średni', 'Samiec', 'Jedwabista', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(440, 10, 'Kot', 'Pikuś', 'kot440.jpg', 'Opis Kota numer 7', 'Dorosły', 6.42, 'Średni', 'Samiec', 'Jedwabista', 'Inny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(441, 10, 'Kot', 'Baśka', 'kot441.jpg', 'Opis Kota numer 8', 'Młody', 12.79, 'Mały', 'Samica', 'Szorstka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(442, 10, 'Kot', 'Ruda', 'kot442.jpg', 'Opis Kota numer 9', 'Szczeniak', 10.79, 'Duży', 'Samica', 'Szorstka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(443, 10, 'Kot', 'Pyza', 'kot443.jpg', 'Opis Kota numer 10', 'Dorosły', 5.13, 'Średni', 'Samica', 'Długa', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(444, 10, 'Kot', 'Milka', 'kot444.jpg', 'Opis Kota numer 11', 'Senior', 5.20, 'Mały', 'Samica', 'Krótka', 'Inny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(445, 10, 'Kot', 'Beza', 'kot445.jpg', 'Opis Kota numer 12', 'Senior', 7.62, 'Średni', 'Samica', 'Szorstka', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(446, 10, 'Kot', 'Blondie', 'kot446.jpg', 'Opis Kota numer 13', 'Szczeniak', 12.68, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(447, 10, 'Kot', 'Zuzia', 'kot447.jpg', 'Opis Kota numer 14', 'Szczeniak', 6.05, 'Mały', 'Samica', 'Długa', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(448, 10, 'Kot', 'Szefu', 'kot448.jpg', 'Opis Kota numer 15', 'Szczeniak', 11.76, 'Duży', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(449, 1, 'Kot', 'Filuś', 'kot449.jpg', 'Opis Kota numer 3', 'Senior', 6.90, 'Mały', 'Samiec', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(450, 1, 'Pies', 'Luna', 'pies450.jpg', 'Opis Piesa numer 4', 'Młody', 18.38, 'Duży', 'Samica', 'Krótka', 'Brązowy', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(451, 1, 'Kot', 'Koko', 'kot451.jpg', 'Opis Kota numer 5', 'Młody', 14.70, 'Średni', 'Samica', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(452, 1, 'Pies', 'Szarik', 'pies452.jpg', 'Opis Piesa numer 6', 'Szczeniak', 26.64, 'Mały', 'Samiec', 'Szorstka', 'Inny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(453, 1, 'Kot', 'Młotek', 'kot453.jpg', 'Opis Kota numer 7', 'Młody', 11.38, 'Średni', 'Samiec', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(454, 1, 'Pies', 'Bruno', 'pies454.jpg', 'Opis Piesa numer 8', 'Młody', 6.98, 'Mały', 'Samiec', 'Krótka', 'Brązowy', 'Yorkshire Terrier', NULL, NULL, NULL, 'Tak'),
(455, 1, 'Pies', 'Zygmunt', 'pies455.jpg', 'Opis Piesa numer 9', 'Senior', 22.64, 'Średni', 'Samiec', 'Krótka', 'Biały', 'Buldog', NULL, NULL, NULL, 'Nie'),
(456, 1, 'Pies', 'Frida', 'pies456.jpg', 'Opis Piesa numer 10', 'Młody', 29.18, 'Mały', 'Samica', 'Długa', 'Brązowy', 'Buldog', NULL, NULL, NULL, 'Tak'),
(457, 1, 'Kot', 'Perła', 'kot457.jpg', 'Opis Kota numer 11', 'Senior', 6.11, 'Mały', 'Samica', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(458, 1, 'Kot', 'Śnieżka', 'kot458.jpg', 'Opis Kota numer 12', 'Dorosły', 7.80, 'Mały', 'Samica', 'Szorstka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(459, 1, 'Pies', 'Pela', 'pies459.jpg', 'Opis Piesa numer 13', 'Senior', 16.54, 'Mały', 'Samica', 'Jedwabista', 'Czarny', 'Cocker Spaniel', NULL, NULL, NULL, 'Nie'),
(460, 1, 'Kot', 'Perła', 'kot460.jpg', 'Opis Kota numer 14', 'Szczeniak', 13.91, 'Średni', 'Samica', 'Krótka', 'Biały', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(461, 1, 'Kot', 'Fiodor', 'kot461.jpg', 'Opis Kota numer 15', 'Szczeniak', 10.65, 'Średni', 'Samiec', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(462, 2, 'Kot', 'Rocky', 'kot462.jpg', 'Opis Kota numer 1', 'Szczeniak', 9.44, 'Duży', 'Samiec', 'Krótka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(463, 2, 'Kot', 'Bimber', 'kot463.jpg', 'Opis Kota numer 2', 'Szczeniak', 13.40, 'Mały', 'Samiec', 'Długa', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(464, 2, 'Kot', 'Milka', 'kot464.jpg', 'Opis Kota numer 3', 'Senior', 14.82, 'Duży', 'Samica', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(465, 2, 'Pies', 'Pluton', 'pies465.jpg', 'Opis Piesa numer 4', 'Dorosły', 35.19, 'Duży', 'Samiec', 'Szorstka', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Tak'),
(466, 2, 'Pies', 'Pluton', 'pies466.jpg', 'Opis Piesa numer 5', 'Senior', 17.05, 'Średni', 'Samiec', 'Jedwabista', 'Czarny', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(467, 2, 'Kot', 'Pola', 'kot467.jpg', 'Opis Kota numer 6', 'Dorosły', 10.76, 'Mały', 'Samica', 'Krótka', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(468, 2, 'Pies', 'Baśka', 'pies468.jpg', 'Opis Piesa numer 7', 'Młody', 35.96, 'Duży', 'Samica', 'Długa', 'Biały', 'Golden Retriever', NULL, NULL, NULL, 'Nie'),
(469, 2, 'Pies', 'Śnieżka', 'pies469.jpg', 'Opis Piesa numer 8', 'Młody', 44.38, 'Mały', 'Samica', 'Krótka', 'Inny', 'Akita', NULL, NULL, NULL, 'Nie'),
(470, 2, 'Pies', 'Nikita', 'pies470.jpg', 'Opis Piesa numer 9', 'Dorosły', 18.70, 'Duży', 'Samica', 'Długa', 'Biały', 'Cocker Spaniel', NULL, NULL, NULL, 'Tak'),
(471, 2, 'Pies', 'Reksio', 'pies471.jpg', 'Opis Piesa numer 10', 'Szczeniak', 32.91, 'Mały', 'Samiec', 'Jedwabista', 'Brązowy', 'Akita', NULL, NULL, NULL, 'Tak'),
(472, 2, 'Pies', 'Szefu', 'pies472.jpg', 'Opis Piesa numer 11', 'Szczeniak', 4.80, 'Duży', 'Samiec', 'Krótka', 'Biały', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(473, 2, 'Pies', 'Bobik', 'pies473.jpg', 'Opis Piesa numer 12', 'Dorosły', 5.95, 'Średni', 'Samiec', 'Jedwabista', 'Brązowy', 'Maltanczyk', NULL, NULL, NULL, 'Tak'),
(474, 2, 'Kot', 'Zuzia', 'kot474.jpg', 'Opis Kota numer 13', 'Szczeniak', 10.80, 'Mały', 'Samica', 'Długa', 'Brązowy', NULL, 'Dachowiec', NULL, NULL, 'Tak'),
(475, 2, 'Pies', 'Czika', 'pies475.jpg', 'Opis Piesa numer 14', 'Szczeniak', 11.19, 'Duży', 'Samica', 'Szorstka', 'Czarny', 'Mieszaniec', NULL, NULL, NULL, 'Tak'),
(476, 2, 'Kot', 'Poldek', 'kot476.jpg', 'Opis Kota numer 15', 'Młody', 14.73, 'Duży', 'Samiec', 'Szorstka', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(477, 3, 'Pies', 'Luna', 'pies477.jpg', 'Opis Piesa numer 1', 'Dorosły', 34.61, 'Średni', 'Samica', 'Jedwabista', 'Inny', 'Husky', NULL, NULL, NULL, 'Nie'),
(478, 3, 'Pies', 'Pluton', 'pies478.jpg', 'Opis Piesa numer 2', 'Senior', 25.73, 'Duży', 'Samiec', 'Długa', 'Biały', 'Husky', NULL, NULL, NULL, 'Tak'),
(479, 3, 'Pies', 'Fiona', 'pies479.jpg', 'Opis Piesa numer 3', 'Młody', 9.94, 'Średni', 'Samica', 'Jedwabista', 'Biały', 'Jack Russell Terrier', NULL, NULL, NULL, 'Nie'),
(480, 3, 'Kot', 'Bimber', 'kot480.jpg', 'Opis Kota numer 4', 'Młody', 10.31, 'Mały', 'Samiec', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(481, 3, 'Kot', 'Pola', 'kot481.jpg', 'Opis Kota numer 5', 'Senior', 11.61, 'Średni', 'Samica', 'Jedwabista', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(482, 3, 'Pies', 'Mokka', 'pies482.jpg', 'Opis Piesa numer 6', 'Szczeniak', 8.39, 'Średni', 'Samica', 'Długa', 'Czarny', 'Fox Terrier', NULL, NULL, NULL, 'Nie'),
(483, 3, 'Pies', 'Nikita', 'pies483.jpg', 'Opis Piesa numer 7', 'Senior', 30.64, 'Duży', 'Samica', 'Jedwabista', 'Inny', 'Labrador', NULL, NULL, NULL, 'Tak'),
(484, 3, 'Pies', 'Kajtek', 'pies484.jpg', 'Opis Piesa numer 8', 'Szczeniak', 5.30, 'Średni', 'Samiec', 'Krótka', 'Czarny', 'Shih Tzu', NULL, NULL, NULL, 'Tak'),
(485, 3, 'Kot', 'Bambi', 'kot485.jpg', 'Opis Kota numer 9', 'Dorosły', 7.83, 'Mały', 'Samica', 'Krótka', 'Czarny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(486, 3, 'Kot', 'Szaman', 'kot486.jpg', 'Opis Kota numer 10', 'Dorosły', 11.91, 'Średni', 'Samiec', 'Długa', 'Inny', NULL, 'Dachowiec', NULL, NULL, 'Nie'),
(487, 3, 'Pies', 'Bruno', 'pies487.jpg', 'Opis Piesa numer 11', 'Szczeniak', 18.70, 'Duży', 'Samiec', 'Długa', 'Czarny', 'Border Collie', NULL, NULL, NULL, 'Nie'),
(488, 3, 'Pies', 'Zuzia', 'pies488.jpg', 'Opis Piesa numer 12', 'Szczeniak', 8.21, 'Mały', 'Samica', 'Długa', 'Biały', 'Shih Tzu', NULL, NULL, NULL, 'Nie'),
(489, 3, 'Kot', 'Pyza', 'kot489.jpg', 'Opis Kota numer 13', 'Dorosły', 7.07, 'Średni', 'Samica', 'Jedwabista', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(490, 3, 'Kot', 'Bobik', 'kot490.jpg', 'Opis Kota numer 14', 'Senior', 8.95, 'Duży', 'Samiec', 'Szorstka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(491, 3, 'Pies', 'Śnieżka', 'pies491.jpg', 'Opis Piesa numer 15', 'Senior', 5.32, 'Średni', 'Samica', 'Długa', 'Brązowy', 'Yorkshire Terrier', NULL, NULL, NULL, 'Nie'),
(492, 4, 'Pies', 'Młotek', 'pies492.jpg', 'Opis Piesa numer 1', 'Szczeniak', 15.74, 'Mały', 'Samiec', 'Jedwabista', 'Inny', 'Beagle', NULL, NULL, NULL, 'Nie'),
(493, 4, 'Pies', 'Mokka', 'pies493.jpg', 'Opis Piesa numer 2', 'Szczeniak', 9.79, 'Duży', 'Samica', 'Długa', 'Czarny', 'Fox Terrier', NULL, NULL, NULL, 'Nie'),
(494, 4, 'Kot', 'Kasiek', 'kot494.jpg', 'Opis Kota numer 3', 'Senior', 5.44, 'Mały', 'Samiec', 'Jedwabista', 'Czarny', NULL, 'Rasowy', NULL, NULL, 'Tak'),
(495, 4, 'Kot', 'Łatka', 'kot495.jpg', 'Opis Kota numer 4', 'Senior', 13.04, 'Duży', 'Samica', 'Krótka', 'Biały', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(496, 4, 'Pies', 'Perła', 'pies496.jpg', 'Opis Piesa numer 5', 'Szczeniak', 10.64, 'Duży', 'Samica', 'Krótka', 'Czarny', 'West Highland White Terrier', NULL, NULL, NULL, 'Tak'),
(497, 4, 'Pies', 'Szarik', 'pies497.jpg', 'Opis Piesa numer 6', 'Młody', 7.43, 'Mały', 'Samiec', 'Szorstka', 'Czarny', 'Shih Tzu', NULL, NULL, NULL, 'Tak'),
(498, 4, 'Kot', 'Max', 'kot498.jpg', 'Opis Kota numer 7', 'Senior', 10.41, 'Duży', 'Samiec', 'Jedwabista', 'Brązowy', NULL, 'Rasowy', NULL, NULL, 'Nie'),
(499, 4, 'Pies', 'Łatka', 'pies499.jpg', 'Opis Piesa numer 8', 'Senior', 10.37, 'Duży', 'Samica', 'Długa', 'Brązowy', 'West Highland White Terrier', NULL, NULL, NULL, 'Tak'),
(500, 4, 'Pies', 'Milka', 'pies500.jpg', 'Opis Piesa numer 9', 'Dorosły', 20.02, 'Duży', 'Samica', 'Długa', 'Inny', 'Border Collie', NULL, NULL, NULL, 'Tak'),
(501, 4, 'Pies', 'Bimber', 'pies501.jpg', 'Opis Piesa numer 10', 'Młody', 32.97, 'Średni', 'Samiec', 'Jedwabista', 'Brązowy', 'Akita', NULL, NULL, NULL, 'Tak'),
(773, 13, 'Pies', 'Felek', 'pies773.jpg', 'Uwielbia wszystko co się odbija od ziemi.', 'Dorosły', 13.00, 'Mały', 'Samiec', 'Szorstka', 'Beżowy', 'Buldog', NULL, 'Nie lubi większych psów od siebie', 'Brak', 'Tak');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RolaId`),
  ADD UNIQUE KEY `NazwaRoli` (`NazwaRoli`);

--
-- Indeksy dla tabeli `schroniska`
--
ALTER TABLE `schroniska`
  ADD PRIMARY KEY (`SchroniskoId`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RolaID` (`RolaId`);

--
-- Indeksy dla tabeli `ulubione`
--
ALTER TABLE `ulubione`
  ADD PRIMARY KEY (`UzytkownikId`,`ZwierzeId`),
  ADD KEY `ZwierzeID` (`ZwierzeId`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`UzytkownikId`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RolaID` (`RolaId`);

--
-- Indeksy dla tabeli `zwierzeta`
--
ALTER TABLE `zwierzeta`
  ADD PRIMARY KEY (`ZwierzeId`),
  ADD KEY `SchroniskoID` (`SchroniskoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RolaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schroniska`
--
ALTER TABLE `schroniska`
  MODIFY `SchroniskoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `UzytkownikId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `zwierzeta`
--
ALTER TABLE `zwierzeta`
  MODIFY `ZwierzeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=774;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `schroniska`
--
ALTER TABLE `schroniska`
  ADD CONSTRAINT `schroniska_ibfk_1` FOREIGN KEY (`RolaId`) REFERENCES `role` (`RolaId`);

--
-- Constraints for table `ulubione`
--
ALTER TABLE `ulubione`
  ADD CONSTRAINT `ulubione_ibfk_1` FOREIGN KEY (`UzytkownikId`) REFERENCES `uzytkownicy` (`UzytkownikId`),
  ADD CONSTRAINT `ulubione_ibfk_2` FOREIGN KEY (`ZwierzeId`) REFERENCES `zwierzeta` (`ZwierzeId`);

--
-- Constraints for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD CONSTRAINT `uzytkownicy_ibfk_1` FOREIGN KEY (`RolaId`) REFERENCES `role` (`RolaId`);

--
-- Constraints for table `zwierzeta`
--
ALTER TABLE `zwierzeta`
  ADD CONSTRAINT `zwierzeta_ibfk_1` FOREIGN KEY (`SchroniskoId`) REFERENCES `schroniska` (`SchroniskoId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
