-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/01/2025 às 14:33
-- Versão do servidor: 5.7.35-log
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cineveredas`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ddd` char(2) NOT NULL,
  `numero` varchar(9) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`cpf`, `nome`, `ddd`, `numero`, `email`) VALUES
('11040002706', 'Enzo Cavalcanti', '32', '961475521', 'enzo.cavalcanti@gmail.com'),
('12488138630', 'Davi Gomes', '32', '994355233', 'davi.gomes@gmail.com'),
('43670456333', 'Giovanna Oliveira', '32', '984669700', 'giovanna.oliveira@gmail.com'),
('86220258452', 'Nicole Lima', '32', '993829212', 'nicole.lima@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filmes`
--

CREATE TABLE `filmes` (
  `codigo` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `duracao` int(11) NOT NULL,
  `diretor` varchar(150) NOT NULL,
  `classificacaoindicativa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `filmes`
--

INSERT INTO `filmes` (`codigo`, `titulo`, `duracao`, `diretor`, `classificacaoindicativa`) VALUES
(1, 'Deadpool & Wolverine', 127, 'Shawn Levy', '18 anos'),
(2, 'Wicked', 160, 'Jon M. Chu', '10 anos'),
(3, '13 Sentimentos', 100, 'Daniel Ribeiro', '16 anos'),
(4, 'The Forge', 125, 'Zachary Leffew', 'Livre'),
(5, 'Sonic 3', 110, 'Jeff Fowler', '10 anos'),
(6, 'O Rei Leão', 118, 'Barry Jenkins', '10 anos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `turnotrabalho` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`codigo`, `nome`, `cargo`, `salario`, `turnotrabalho`) VALUES
(1, 'Brenda Rodrigues', 'Atendente', 1650.00, 'Tarde e Noite'),
(2, 'Fábio Fernandes', 'Segurança', 1780.00, 'Noite'),
(3, 'Murilo Rocha', 'Auxiliar', 1825.00, 'Tarde e Noite'),
(4, 'Renata da Silva', 'Auxiliar', 1825.00, 'Noite');

-- --------------------------------------------------------

--
-- Estrutura para tabela `generofilme`
--

CREATE TABLE `generofilme` (
  `codfilme` int(11) NOT NULL,
  `codgenero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `generofilme`
--

INSERT INTO `generofilme` (`codfilme`, `codgenero`) VALUES
(1, 1),
(5, 2),
(6, 2),
(5, 3),
(6, 3),
(1, 4),
(4, 6),
(2, 7),
(2, 9),
(3, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `generos`
--

CREATE TABLE `generos` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `generos`
--

INSERT INTO `generos` (`codigo`, `descricao`) VALUES
(1, 'Ação'),
(2, 'Animação'),
(3, 'Aventura'),
(4, 'Comédia'),
(5, 'Documentário'),
(6, 'Drama'),
(7, 'Fantasia'),
(8, 'Ficção científica'),
(9, 'Musical'),
(10, 'Romance'),
(11, 'Terror');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingressos`
--

CREATE TABLE `ingressos` (
  `codigo` int(11) NOT NULL,
  `assentoreservado` int(11) NOT NULL,
  `valorpago` decimal(10,2) NOT NULL,
  `codsessao` int(11) NOT NULL,
  `cpfcliente` varchar(11) NOT NULL,
  `codvendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `ingressos`
--

INSERT INTO `ingressos` (`codigo`, `assentoreservado`, `valorpago`, `codsessao`, `cpfcliente`, `codvendedor`) VALUES
(1, 22, 10.00, 1, '86220258452', 1),
(2, 31, 20.00, 1, '43670456333', 1),
(3, 32, 20.00, 1, '11040002706', 1),
(4, 18, 40.00, 4, '12488138630', 3),
(5, 26, 20.00, 4, '86220258452', 3),
(6, 32, 20.00, 5, '43670456333', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenspedidos`
--

CREATE TABLE `itenspedidos` (
  `codigo` int(11) NOT NULL,
  `codproduto` int(11) NOT NULL,
  `codpedido` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `precovenda` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `itenspedidos`
--

INSERT INTO `itenspedidos` (`codigo`, `codproduto`, `codpedido`, `quantidade`, `precovenda`) VALUES
(1, 4, 1, 1, 25.00),
(2, 5, 1, 1, 10.00),
(3, 4, 2, 1, 30.00),
(4, 5, 2, 2, 12.00),
(5, 3, 2, 2, 8.00),
(6, 4, 3, 1, 30.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `codigo` int(11) NOT NULL,
  `data` date NOT NULL,
  `formapgto` varchar(60) NOT NULL,
  `cpfcliente` varchar(11) NOT NULL,
  `codvendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`codigo`, `data`, `formapgto`, `cpfcliente`, `codvendedor`) VALUES
(1, '2025-02-07', 'PIX', '86220258452', 4),
(2, '2025-02-07', 'Cartão de Crédito', '11040002706', 4),
(3, '2025-02-08', 'Dinheiro', '12488138630', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `precounitario` decimal(10,2) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`codigo`, `nome`, `precounitario`, `categoria`) VALUES
(1, 'Pipoca Média', 20.00, 'Alimento'),
(2, 'Refrigerante Lata', 8.00, 'Bebida'),
(3, 'Chocolate', 8.00, 'Alimento'),
(4, 'Pipoca Grande', 30.00, 'Alimento'),
(5, 'Refrigerante 600ml', 12.00, 'Bebida'),
(6, 'Pão de Queijo', 10.00, 'Alimento');

-- --------------------------------------------------------

--
-- Estrutura para tabela `salas`
--

CREATE TABLE `salas` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `salas`
--

INSERT INTO `salas` (`codigo`, `nome`, `capacidade`, `tipo`) VALUES
(1, 'Sala VIP', 120, '3D'),
(2, 'Sala Júnior', 100, '2D'),
(3, 'Sala Premium', 400, 'IMAX'),
(4, 'Sala Especial', 40, '3D');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessoes`
--

CREATE TABLE `sessoes` (
  `codigo` int(11) NOT NULL,
  `data` date NOT NULL,
  `horario` time NOT NULL,
  `idioma` varchar(30) NOT NULL,
  `precobase` decimal(10,2) NOT NULL,
  `codfilme` int(11) NOT NULL,
  `codsala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `sessoes`
--

INSERT INTO `sessoes` (`codigo`, `data`, `horario`, `idioma`, `precobase`, `codfilme`, `codsala`) VALUES
(1, '2025-02-07', '17:00:00', 'Dublado', 20.00, 5, 2),
(2, '2025-02-07', '20:00:00', 'Legendado', 30.00, 4, 4),
(3, '2025-02-08', '17:00:00', 'Dublado', 25.00, 6, 2),
(4, '2025-02-08', '20:00:00', 'Legendado', 40.00, 1, 3),
(5, '2025-02-09', '17:00:00', 'Dublado', 20.00, 2, 4),
(6, '2025-02-09', '20:00:00', 'Legendado', 30.00, 1, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `filmes`
--
ALTER TABLE `filmes`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `generofilme`
--
ALTER TABLE `generofilme`
  ADD PRIMARY KEY (`codfilme`,`codgenero`),
  ADD KEY `codgenero` (`codgenero`);

--
-- Índices de tabela `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `ingressos`
--
ALTER TABLE `ingressos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codsessao` (`codsessao`),
  ADD KEY `codvendedor` (`codvendedor`),
  ADD KEY `cpfcliente` (`cpfcliente`);

--
-- Índices de tabela `itenspedidos`
--
ALTER TABLE `itenspedidos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codpedido` (`codpedido`),
  ADD KEY `codproduto` (`codproduto`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codfvendedor2` (`codvendedor`),
  ADD KEY `cpfcliente2` (`cpfcliente`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codflime2` (`codfilme`),
  ADD KEY `codsala` (`codsala`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filmes`
--
ALTER TABLE `filmes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `ingressos`
--
ALTER TABLE `ingressos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `itenspedidos`
--
ALTER TABLE `itenspedidos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `salas`
--
ALTER TABLE `salas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `generofilme`
--
ALTER TABLE `generofilme`
  ADD CONSTRAINT `codfilme` FOREIGN KEY (`codfilme`) REFERENCES `filmes` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `codgenero` FOREIGN KEY (`codgenero`) REFERENCES `generos` (`codigo`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `ingressos`
--
ALTER TABLE `ingressos`
  ADD CONSTRAINT `codsessao` FOREIGN KEY (`codsessao`) REFERENCES `sessoes` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `codvendedor` FOREIGN KEY (`codvendedor`) REFERENCES `funcionarios` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cpfcliente` FOREIGN KEY (`cpfcliente`) REFERENCES `clientes` (`cpf`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `itenspedidos`
--
ALTER TABLE `itenspedidos`
  ADD CONSTRAINT `codpedido` FOREIGN KEY (`codpedido`) REFERENCES `pedidos` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `codproduto` FOREIGN KEY (`codproduto`) REFERENCES `produtos` (`codigo`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `codfvendedor2` FOREIGN KEY (`codvendedor`) REFERENCES `funcionarios` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cpfcliente2` FOREIGN KEY (`cpfcliente`) REFERENCES `clientes` (`cpf`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `sessoes`
--
ALTER TABLE `sessoes`
  ADD CONSTRAINT `codflime2` FOREIGN KEY (`codfilme`) REFERENCES `filmes` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `codsala` FOREIGN KEY (`codsala`) REFERENCES `salas` (`codigo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
