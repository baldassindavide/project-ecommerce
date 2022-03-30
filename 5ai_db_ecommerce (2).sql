-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 30, 2022 alle 12:46
-- Versione del server: 10.4.6-MariaDB
-- Versione PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `5ai_db_ecommerce`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `price` float NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`ID`, `name`, `description`) VALUES
(1, 'Libri', 'Categoria contenente libri di ogni genere, illustrati e non.'),
(2, 'Vestiti', 'Vestiti di ogni tipo'),
(3, 'Oggetti', 'Oggetti per ogni utilizzo');

-- --------------------------------------------------------

--
-- Struttura della tabella `contains`
--

CREATE TABLE `contains` (
  `cart_ID` int(11) NOT NULL,
  `item_ID` int(11) NOT NULL,
  `amount` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `item`
--

CREATE TABLE `item` (
  `ID` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(254) NOT NULL,
  `price` float NOT NULL,
  `stock_amount` int(8) NOT NULL,
  `image` varchar(254) DEFAULT NULL,
  `category_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `item`
--

INSERT INTO `item` (`ID`, `name`, `description`, `price`, `stock_amount`, `image`, `category_ID`) VALUES
(2, 'Libro Geronimo Stilton', 'Libro illustrato del famosissimo scrittore topo Geronimo Stilton', 19.99, 10, 'libro-geronimo-stilton.jpg', 1),
(3, 'Libro Piccoli Brividi', 'Libro abbastanza spaventoso', 18.99, 15, 'libro-piccoli-brividi.jpg', 1),
(4, 'Vestito per gatti', 'che belo', 30, 5, 'vestito-per-gatti.jpg', 1),
(5, 'Illumina water', 'wow che bruto', 50, 5, 'illumina-water.jpg', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `review`
--

CREATE TABLE `review` (
  `ID` int(11) NOT NULL,
  `text` varchar(254) NOT NULL,
  `stars` int(1) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `item_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`ID`, `username`, `password`, `email`, `name`, `surname`, `birth_date`) VALUES
(1, 'bobo', '5f4dcc3b5aa765d61d8327deb882cf99', 'info.davidebaldassin@gmail.com', 'Davide', 'Baldassin', '2003-05-18'),
(5, 'bobo2', '5f4dcc3b5aa765d61d8327deb882cf99', 'info.davidebaldassin2@gmail.com', 'Davide', 'Baldassin', '2003-05-19');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_order`
--

CREATE TABLE `user_order` (
  `ID` int(11) NOT NULL,
  `delivery_type` enum('standard','fast') NOT NULL,
  `total_price` float NOT NULL,
  `order_date` timestamp NULL DEFAULT current_timestamp(),
  `cart_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `contains`
--
ALTER TABLE `contains`
  ADD PRIMARY KEY (`cart_ID`,`item_ID`),
  ADD KEY `item_ID` (`item_ID`);

--
-- Indici per le tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `category_ID` (`category_ID`);

--
-- Indici per le tabelle `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `review_user_ID` (`user_ID`),
  ADD KEY `review_item_ID` (`item_ID`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `order_cart_ID` (`cart_ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `item`
--
ALTER TABLE `item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `review`
--
ALTER TABLE `review`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `user_order`
--
ALTER TABLE `user_order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `user_ID` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`);

--
-- Limiti per la tabella `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `cart_ID` FOREIGN KEY (`cart_ID`) REFERENCES `cart` (`ID`),
  ADD CONSTRAINT `item_ID` FOREIGN KEY (`item_ID`) REFERENCES `item` (`ID`);

--
-- Limiti per la tabella `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `category_ID` FOREIGN KEY (`category_ID`) REFERENCES `category` (`ID`);

--
-- Limiti per la tabella `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_item_ID` FOREIGN KEY (`item_ID`) REFERENCES `item` (`ID`),
  ADD CONSTRAINT `review_user_ID` FOREIGN KEY (`user_ID`) REFERENCES `user` (`ID`);

--
-- Limiti per la tabella `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `order_cart_ID` FOREIGN KEY (`cart_ID`) REFERENCES `cart` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
