-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 14. Apr 2023 um 20:55
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `BE18_CR6_bigEventsChristineWeidhofer`
--
CREATE DATABASE IF NOT EXISTS `BE18_CR6_bigEventsChristineWeidhofer` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `BE18_CR6_bigEventsChristineWeidhofer`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`id`, `street`, `zip`, `city`) VALUES
(1, 'Arthur-Schnitzler-Platz 1', 1070, 'Wien'),
(2, 'Opernring 2', 1010, 'Wien'),
(3, 'Museumsplatz 1', 1070, 'Wien'),
(4, 'Burgring', 1010, 'Wien'),
(5, 'Burggasse 119', 1070, 'Wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230414075218', '2023-04-14 07:52:46', 56);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `descr` varchar(500) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `cap` int(11) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  `phone` varchar(55) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `fk_type_id` int(11) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`id`, `name`, `date`, `descr`, `image`, `cap`, `location`, `email`, `phone`, `url`, `fk_type_id`, `fk_address_id`) VALUES
(2, 'Literaturfestival O-Töne', '2023-07-14 10:00:00', 'Ein Angriffskrieg mitten in Europa. Eine Pandemie, die uns in Atem hält. Eine Klimakrise, die die Bewohnbarkeit des Planeten in Frage stellt. Wie reagiert die Literatur auf solche Krisen?', 'otoene.jpeg', 150, 'Museumsquartier', 'office@o-toene.at', '+43 664 85 65 809', 'o-toene.at/', 4, 3),
(3, 'Carmen', '2023-04-19 19:00:00', 'Opéra comique in vier Akten, Musikalische Leitung Alexander Soddy, Inszenierung Calixto Bieito. Mit Eve-Maud Hubeaux, David Butt Philip, Erwin Schrott, Anna Bondarenko', 'oper.jpg', 1709, 'Staatsoper', 'oper@wien.at', '9876543', 'wiener-staatsoper.at', 1, 2),
(4, 'Ophelia\'s Got Talent', '2023-04-19 19:30:00', 'In Florentina Holzingers neuer Arbeit vollzieht das multidisziplinäre Ensemble aus mehreren Generationen eine physische Studie zur Psychologie des Wassers im 21. Jahrhundert.', 'ophelia.jpg', 830, 'Volkstheater', 'kartenservice@volkstheater.at', '+43 1 52 111-400', 'volkstheater.at', 2, 1),
(5, 'Szenen Einer Ehe', '2023-04-14 20:00:00', 'Kaum jemand hat so gut wie Ingmar Bergman die Tragik der modernen Ehe verstanden, die nur durch eben die Leidenschaft am Leben erhalten werden kann, die sie gleichzeitig zu zerstören droht.', 'szenen.jpg', 830, 'Volkstheater', 'kartenservice@volkstheater.at', '+43 1 52 111-400', 'volkstheater.at', 2, 1),
(6, 'Graduation Party', '2018-04-27 20:00:00', 'Hungrig gefeiert? In der Säulenhalle gibt’s deine Lieblingspizza bis spät in die Nacht. Wir sehen uns beim Pizza-Ofen 🍕', 'party.jpg', 1700, 'Volksgarten', 'lostandfound@volksgarten.at', '5753892', 'volksgarten.at', 1, 4),
(7, 'Feminism WTF', '2023-04-28 20:00:00', 'Und obwohl feministische Debatten wie #metoo in der Mitte der Gesellschaft angekommen sind, hat der Begriff „Feminist*in“ immer noch einen negativen Unterton.', 'fwtf.webp', 81, 'Admiralkino', 'reservierung@admiralkino.at', '+43 1 523 37 59', 'admiralkino.at', 3, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `type` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'Music'),
(2, 'Theater'),
(3, 'Film'),
(4, 'Literature');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3BAE0AA73563B1BF` (`fk_type_id`),
  ADD KEY `IDX_3BAE0AA75D965E6` (`fk_address_id`);

--
-- Indizes für die Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indizes für die Tabelle `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_3BAE0AA73563B1BF` FOREIGN KEY (`fk_type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `FK_3BAE0AA75D965E6` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
