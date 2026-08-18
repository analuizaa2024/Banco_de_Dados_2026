-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/08/2026 às 15:09
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'Ana Luiza', 'ana.oliveira234@.com', '12345678-9'),
(2, 'Luiza', 'luiza.goncalves62@gmail.com', '876543211-9'),
(3, 'Claudia', 'claudia.oliveira12@gmail.com', '45675678-9'),
(4, 'laerte ', 'laerte.goncalves12@gmail.com', '52145378-9'),
(5, 'luiz ', 'luiz.silva12@gmail.com', '8521479678-9');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `idquarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `idcliente`, `idquarto`) VALUES
(1, '2026-08-04', NULL, '00:00:00', NULL, 0.00, 2, 1),
(2, '0000-00-00', '2026-08-03', '16:30:05', NULL, 0.00, 4, 6),
(3, '2026-08-03', NULL, '00:00:00', '16:21:33', 100.00, 3, 4),
(4, '2026-08-06', NULL, '16:15:33', NULL, 200.00, 1, 7),
(5, '2026-08-07', '2026-08-18', '10:00:00', '21:30:00', 0.00, 5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `idquarto` int(11) NOT NULL,
  `andar` varchar(255) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`idquarto`, `andar`, `quarto`, `tipo`) VALUES
(1, '1 andar', '11', 'individual'),
(2, '1 andar', '12', 'casal'),
(3, '1 andar', '13', 'Familia + cama solteiro'),
(4, '2 andar', '14', 'Familia + 2 cama solteiro'),
(5, '2 andar', '15', 'Familia + cama solteiro'),
(6, '2 andar', '16', 'mega familia'),
(7, '3 andar', '17', 'individual'),
(8, '3 andar', '11', 'Familia + cama solteiro'),
(9, '3 andar', '11', 'individual + geladeira');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `idservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`idservico`, `servico`, `valor`, `tipo`) VALUES
(1, 'Coca cola lata', 5.00, 'Bebida'),
(2, 'água', 10.00, 'mineral'),
(3, 'água', 2.00, 'cristal'),
(4, 'cerveja lata', 20.00, 'bhama'),
(5, 'cerveja lata', 20.00, 'itaipava'),
(7, 'fanta lata', 9.00, 'Bebida'),
(8, 'almoço simples', 100.00, 'buffet completo'),
(9, 'janta simples', 100.00, 'buffet completo'),
(10, 'sobremesa simples', 100.00, 'buffet completo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicohospedagem`
--

CREATE TABLE `servicohospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `datacompra` time NOT NULL,
  `horacompra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicohospedagem`
--

INSERT INTO `servicohospedagem` (`idhospedagem`, `idservico`, `datacompra`, `horacompra`) VALUES
(2, 8, '12:09:54', '2026-08-03'),
(2, 2, '12:09:54', '2026-08-03'),
(1, 1, '16:30:44', '2026-08-02'),
(1, 9, '16:31:44', '2026-08-02'),
(1, 4, '21:00:00', '2026-08-03'),
(2, 10, '21:15:00', '2026-08-09'),
(3, 8, '12:00:00', '2026-08-04'),
(3, 1, '12:30:00', '2026-08-04'),
(3, 10, '13:30:00', '2026-08-04'),
(4, 9, '21:30:00', '2026-08-11'),
(4, 3, '21:45:00', '2026-08-11'),
(4, 7, '15:55:00', '2026-08-06'),
(5, 8, '13:25:00', '2026-08-04'),
(5, NULL, '13:30:00', '2026-08-04'),
(5, 10, '13:50:00', '2026-08-04');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `idcliente` (`idcliente`),
  ADD KEY `idquarto` (`idquarto`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`idquarto`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`idservico`);

--
-- Índices de tabela `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD KEY `idhospedagem` (`idhospedagem`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `idquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `idservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`idquarto`) REFERENCES `quarto` (`idquarto`);

--
-- Restrições para tabelas `servicohospedagem`
--
ALTER TABLE `servicohospedagem`
  ADD CONSTRAINT `servicohospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicohospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`idservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
