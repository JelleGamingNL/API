-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 16 nov 2022 om 09:38
-- Serverversie: 10.4.25-MariaDB
-- PHP-versie: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jacht`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `boot`
--

CREATE TABLE `boot` (
  `id` int(11) NOT NULL,
  `naam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `boot`
--

INSERT INTO `boot` (`id`, `naam`) VALUES
(1, 'titanic'),
(2, 'boot'),
(3, 'Hendrik');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `energie`
--

CREATE TABLE `energie` (
  `id` int(11) NOT NULL,
  `totaal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `kilometers`
--

CREATE TABLE `kilometers` (
  `id` int(11) NOT NULL,
  `totaal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `main`
--

CREATE TABLE `main` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `kilometers_id` int(11) NOT NULL,
  `energie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `accesstoken` varchar(255) DEFAULT NULL,
  `boot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `accesstoken`, `boot_id`) VALUES
(1, 'test', '$2y$10$FtTA9VOcSIbD9/EGGI92gOjpRVTGoFTw/3WppaZ3jHwaOkth1yvju', 'test', NULL, 1),
(5, 'yorrick', 'yorrick', '$2y$10$yvEXotntwbwOXsWuBPYI1OF/RP8leFWztImeWAeOf1iiZfrvCqHI2', NULL, 2),
(6, 'yorrick', 'bram', '$2y$10$g8IqOMPVYyQoG17lMNpj9uhQvXOsEkI5bDtdshutlm4LTKnsJYfYu', '5af9c27ec717c74a2b5fd2c9ad4470ef649af703231521c0ccd9855ded795345', 1),
(7, 'yorrick', 'djeno', '$2y$10$6/rnh8QPMwMoOLlne/ta3.jqYSXFPReE9tmpiFN0baCq/AlRvUTHW', NULL, 1);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `boot`
--
ALTER TABLE `boot`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `energie`
--
ALTER TABLE `energie`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `kilometers`
--
ALTER TABLE `kilometers`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`,`kilometers_id`,`energie_id`),
  ADD KEY `energie_id` (`energie_id`),
  ADD KEY `kilometers_id` (`kilometers_id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boot_id` (`boot_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `boot`
--
ALTER TABLE `boot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `energie`
--
ALTER TABLE `energie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `kilometers`
--
ALTER TABLE `kilometers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `main`
--
ALTER TABLE `main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `main`
--
ALTER TABLE `main`
  ADD CONSTRAINT `main_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `main_ibfk_2` FOREIGN KEY (`energie_id`) REFERENCES `energie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `main_ibfk_3` FOREIGN KEY (`kilometers_id`) REFERENCES `kilometers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`boot_id`) REFERENCES `boot` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
