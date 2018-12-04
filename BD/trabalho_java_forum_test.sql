-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 04-Dez-2018 às 23:00
-- Versão do servidor: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trabalho_java_forum_test`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acoes`
--

CREATE TABLE `acoes` (
  `acao_id` int(11) NOT NULL,
  `acao_acao` varchar(50) DEFAULT NULL,
  `acao_tipo` varchar(50) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `acoes`
--

INSERT INTO `acoes` (`acao_id`, `acao_acao`, `acao_tipo`, `usuario_id`) VALUES
(1, '[Ljava.lang.String;@62eeba2f', NULL, 2),
(2, '[Ljava.lang.String;@48125a6', NULL, 2),
(3, '[Ljava.lang.String;@64787852', NULL, 2),
(4, '[Ljava.lang.String;@16b232a9', NULL, 2),
(5, NULL, NULL, 2),
(6, NULL, NULL, 2),
(7, '[Ljava.lang.String;@6675eb78', NULL, 2),
(8, '[Ljava.lang.String;@3b5f8ac4', '[Ljava.lang.String;@596ba82e', 11),
(15, '[Ljava.lang.String;@454d22a2', '[Ljava.lang.String;@4b8ad47b', 2),
(16, '[Ljava.lang.String;@5400f501', '[Ljava.lang.String;@5ac701f1', 2),
(17, '[Ljava.lang.String;@7782bc83', '[Ljava.lang.String;@1ae8cbad', 2),
(18, '[Ljava.lang.String;@7844db91', '[Ljava.lang.String;@1f182885', 2),
(19, '[Ljava.lang.String;@7cc59a3c', '[Ljava.lang.String;@56c72ede', 2),
(20, '[Ljava.lang.String;@25206cdb', '[Ljava.lang.String;@2be7860f', 2),
(21, '[Ljava.lang.String;@a99feb8', '[Ljava.lang.String;@45e019b', 2),
(22, '[Ljava.lang.String;@62cbe481', '[Ljava.lang.String;@6c0c06a8', 2),
(23, '[Ljava.lang.String;@5fc9e44d', '[Ljava.lang.String;@510e01c4', 2),
(24, '[Ljava.lang.String;@72f74481', '[Ljava.lang.String;@2dddafb7', 2),
(25, '[Ljava.lang.String;@5d4b05d0', '[Ljava.lang.String;@538ce009', 2),
(26, '[Ljava.lang.String;@47c2f478', '[Ljava.lang.String;@490512f0', 2),
(27, '[Ljava.lang.String;@5cfdcd19', '[Ljava.lang.String;@523a28f6', 2),
(28, '[Ljava.lang.String;@5c7ffc1e', '[Ljava.lang.String;@52b809e1', 2),
(29, '[Ljava.lang.String;@61fbbe25', '[Ljava.lang.String;@6f3c4c6a', 2),
(30, '[Ljava.lang.String;@135117dc', '[Ljava.lang.String;@3358f8f9', 2),
(31, '[Ljava.lang.String;@4440366', '[Ljava.lang.String;@2c7cef53', 2),
(32, '[Ljava.lang.String;@7fd8ab93', '[Ljava.lang.String;@37aabb5', 2),
(33, '[Ljava.lang.String;@373186fb', '[Ljava.lang.String;@39f66e6d', 2),
(35, '[Ljava.lang.String;@4d3079a0', '[Ljava.lang.String;@c01d1a0', 1),
(36, NULL, NULL, 1),
(37, NULL, NULL, 1),
(38, '[Ljava.lang.String;@4589a227', NULL, 1),
(39, '[Ljava.lang.String;@3870392c', '[Ljava.lang.String;@6c78f385', 2),
(40, '[Ljava.lang.String;@66108383', '[Ljava.lang.String;@68d77131', 2),
(41, '[Ljava.lang.String;@15524f67', '[Ljava.lang.String;@1b95a3bd', 2),
(42, '[Ljava.lang.String;@4e4576c0', NULL, 2),
(43, '[Ljava.lang.String;@3d40fcc5', '[Ljava.lang.String;@39960621', 2),
(44, '[Ljava.lang.String;@6ec00061', '[Ljava.lang.String;@6007f3c9', 2),
(45, '[Ljava.lang.String;@25323a2b', '[Ljava.lang.String;@374c3605', 2),
(46, '[Ljava.lang.String;@22f971fe', NULL, 2),
(47, '[Ljava.lang.String;@61f1942', '[Ljava.lang.String;@6237ece2', 2),
(48, '[Ljava.lang.String;@14142dea', '[Ljava.lang.String;@4f570801', 2),
(49, '[Ljava.lang.String;@20c9bc28', NULL, 2),
(50, '[Ljava.lang.String;@1119ea3c', NULL, 2),
(51, '[Ljava.lang.String;@1fd38e38', NULL, 2),
(52, '[Ljava.lang.String;@3907a7f', '[Ljava.lang.String;@7060efe6', 2),
(53, '[Ljava.lang.String;@4a4e7d6a', NULL, 2),
(54, '[Ljava.lang.String;@66b586d8', NULL, 2),
(55, '[Ljava.lang.String;@5e464254', '[Ljava.lang.String;@5081a7ec', 11),
(56, '[Ljava.lang.String;@2499542', '[Ljava.lang.String;@c8e6b7b', 11),
(57, '[Ljava.lang.String;@2ebe0126', NULL, 11),
(58, '[Ljava.lang.String;@65f1f9c7', '[Ljava.lang.String;@10a3b444', 11),
(59, '[Ljava.lang.String;@35bde4d1', '[Ljava.lang.String;@6196580f', 11),
(60, '[Ljava.lang.String;@6bc49468', '[Ljava.lang.String;@65036760', 2),
(61, '[Ljava.lang.String;@1ff72ded', '[Ljava.lang.String;@d3236f4', 2),
(62, '[Ljava.lang.String;@2aca6a38', NULL, 2),
(63, '[Ljava.lang.String;@719cf4d9', '[Ljava.lang.String;@2fbfede8', 2),
(64, '[Ljava.lang.String;@614637af', '[Ljava.lang.String;@5dba5fc3', 2),
(65, '[Ljava.lang.String;@2b829969', '[Ljava.lang.String;@25457269', 2),
(66, '[Ljava.lang.String;@432fec6e', NULL, 2),
(67, '[Ljava.lang.String;@63001c05', '[Ljava.lang.String;@3cc43329', 2),
(68, '[Ljava.lang.String;@3fa86e3b', '[Ljava.lang.String;@68996a66', 2),
(69, '[Ljava.lang.String;@50f2a14e', '[Ljava.lang.String;@5e355520', 2),
(70, '[Ljava.lang.String;@165a96e5', '[Ljava.lang.String;@1c4819e0', 2),
(71, '[Ljava.lang.String;@4429f434', NULL, 2),
(72, '[Ljava.lang.String;@3f95ced2', '[Ljava.lang.String;@334a013e', 2),
(73, NULL, NULL, 2),
(74, NULL, NULL, 2),
(75, '[Ljava.lang.String;@39e76ea7', NULL, 2),
(76, '[Ljava.lang.String;@62cbe481', '[Ljava.lang.String;@6c0c06a8', 14),
(77, NULL, NULL, 14),
(78, '[Ljava.lang.String;@47c2f478', '[Ljava.lang.String;@490512f0', 14),
(79, '[Ljava.lang.String;@3c570989', '[Ljava.lang.String;@34e77e3d', 14),
(80, '[Ljava.lang.String;@523a28f6', '[Ljava.lang.String;@5605a669', 14),
(81, '[Ljava.lang.String;@36d2764c', '[Ljava.lang.String;@38158ee6', 14),
(82, '[Ljava.lang.String;@6f3c4c6a', '[Ljava.lang.String;@6b03d555', 14),
(83, '[Ljava.lang.String;@4d7892c4', '[Ljava.lang.String;@263b8008', 14),
(84, '[Ljava.lang.String;@21a9622e', NULL, 14),
(85, '[Ljava.lang.String;@37725e4d', '[Ljava.lang.String;@5c3b4b98', 14),
(86, '[Ljava.lang.String;@43f633ea', '[Ljava.lang.String;@49f9b8ff', 14),
(87, '[Ljava.lang.String;@7831fcc6', '[Ljava.lang.String;@2d9cfd8a', 14),
(88, '[Ljava.lang.String;@1b8308dd', '[Ljava.lang.String;@519b7bf9', 14),
(89, NULL, NULL, 14),
(90, NULL, NULL, 14),
(91, '[Ljava.lang.String;@139f4e48', NULL, 14),
(92, '[Ljava.lang.String;@47a4cfd1', '[Ljava.lang.String;@2c2b81e6', 2),
(93, '[Ljava.lang.String;@452b0fa0', '[Ljava.lang.String;@479cd252', 2),
(94, '[Ljava.lang.String;@421e5e70', '[Ljava.lang.String;@4cd9b843', 2),
(95, '[Ljava.lang.String;@37d59967', '[Ljava.lang.String;@376d46ef', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `cliente_nome` varchar(50) NOT NULL,
  `cliente_sobrenome` varchar(50) NOT NULL,
  `cliente_dtNascimento` date NOT NULL,
  `cliente_sexo` varchar(1) NOT NULL,
  `endereco_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cliente_nome`, `cliente_sobrenome`, `cliente_dtNascimento`, `cliente_sexo`, `endereco_id`, `empresa_id`, `usuario_id`) VALUES
(9, 'SegundoTeste4', 'TesteSegundo4', '2010-10-10', 'M', 8, 9, 9),
(11, 'titeste', 'testeti', '1997-12-19', 'M', 15, 9, 15),
(15, 'Meu', 'Teste', '1990-10-19', 'M', 16, 9, 16);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nomeFantasia` varchar(50) NOT NULL,
  `empresa_cnpj` varchar(50) NOT NULL,
  `empresa_razaoSocial` varchar(50) NOT NULL,
  `endereco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `empresas`
--

INSERT INTO `empresas` (`empresa_id`, `empresa_nomeFantasia`, `empresa_cnpj`, `empresa_razaoSocial`, `endereco_id`) VALUES
(6, 'N/A', '0', 'N/A', 11),
(9, 'TesteTeste', '12342', 'Teste', 12),
(11, 'Empresa Teste', '19284920', 'Minha', 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `endereco_id` int(11) NOT NULL,
  `endereco_rua` varchar(50) NOT NULL,
  `endereco_numero` varchar(10) NOT NULL,
  `endereco_bairro` varchar(50) NOT NULL,
  `endereco_cidade` varchar(50) NOT NULL,
  `uf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `enderecos`
--

INSERT INTO `enderecos` (`endereco_id`, `endereco_rua`, `endereco_numero`, `endereco_bairro`, `endereco_cidade`, `uf_id`) VALUES
(7, 'Rua Positivo', '432', 'Bairro Alienware', 'Cidade Acer', 8),
(8, 'Teste da Rua4', '1234', 'Teste do Bairro4', 'Teste da Cidade4', 12),
(9, 'TesteOi3', '3213', 'OiTeste3', 'OiTesteOi3', 24),
(10, 'd555', 'a1555', 'a555', 'a555', 15),
(11, 'N/A', '0', 'N/A', 'N/A', 30),
(12, 'Rua do Teste', '123', 'Bairro do Teste', 'Cidade do Teste', 1),
(13, 'Rua do Teste2', '1232', 'Bairro do Teste2', 'Cidade do Teste2', 14),
(14, 'oioiteste', 'oioiteste2', 'oioiteste3', 'oioiteste4', 2),
(15, 'ruatesteti', '1324', 'bairrotesteti', 'cidadetesteti', 2),
(16, 'Essa rua do teste', '999', 'Biarrando do Teste', 'Cidade de Deus', 1),
(17, 'Rua de deussss', '999', 'Bairro de deus', 'Cidade de deus', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `threads`
--

CREATE TABLE `threads` (
  `thread_id` int(11) NOT NULL,
  `thread_mensagem` varchar(50) NOT NULL,
  `thread_autor` varchar(50) NOT NULL,
  `thread_autorPergunta` int(2) NOT NULL,
  `thread_dataPostagem` timestamp NULL DEFAULT NULL,
  `topico_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `threads`
--

INSERT INTO `threads` (`thread_id`, `thread_mensagem`, `thread_autor`, `thread_autorPergunta`, `thread_dataPostagem`, `topico_id`, `ticket_id`, `usuario_id`) VALUES
(29, 'from the other side', 'memo', 1, '2018-12-04 12:42:00', NULL, 11, 11),
(30, 'aqui estou testando tudo', 'memo', 1, '2018-12-04 12:44:00', 16, NULL, 11),
(31, 'esse Ã© um superteste', 'oioi', 1, '2018-12-04 12:47:00', 17, NULL, 15),
(32, 'esse Ã© um superteste', 'memo', 1, '2018-12-04 12:47:00', 18, NULL, 11),
(40, 'teste', 'memo', 1, '2018-12-04 13:59:51', 18, NULL, 11),
(41, 'teste', 'operador', 0, '2018-12-04 14:01:18', NULL, 11, 2),
(42, '@memo oi', 'operador', 0, '2018-12-04 14:01:24', NULL, 11, 2),
(43, '@memo oi', 'operador', 0, '2018-12-04 14:06:17', NULL, 11, 2),
(44, '@operador teste', 'operador', 0, '2018-12-04 21:30:51', NULL, 11, 2),
(45, 'teste', 'memo', 1, '2018-12-04 21:33:48', 18, NULL, 11),
(46, '@memo oi', 'operador', 0, '2018-12-04 21:36:19', 18, NULL, 2),
(47, 'teste', 'operador', 0, '2018-12-04 21:37:35', NULL, 11, 2),
(48, '@operador qqqq', 'operador', 0, '2018-12-04 21:40:47', NULL, 11, 2),
(49, '', 'usuarioTeste', 1, '2018-12-04 21:44:00', 22, NULL, 14),
(50, '@usuarioTeste', 'usuarioTeste', 1, '2018-12-04 21:44:28', 22, NULL, 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `ticket_titulo` varchar(100) DEFAULT NULL,
  `ticket_status` varchar(20) NOT NULL,
  `ticket_tempoInicio` timestamp NULL DEFAULT NULL,
  `ticket_tempoFim` timestamp NULL DEFAULT NULL,
  `ticket_situacao` varchar(15) DEFAULT NULL,
  `ticket_respondido` varchar(20) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `ticket_titulo`, `ticket_status`, `ticket_tempoInicio`, `ticket_tempoFim`, `ticket_situacao`, `ticket_respondido`, `usuario_id`) VALUES
(11, 'teste', 'Completo', '2018-12-04 12:42:34', '2018-12-04 12:42:34', 'Aberto', 'Nao', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `topicos`
--

CREATE TABLE `topicos` (
  `topico_id` int(11) NOT NULL,
  `topico_titulo` varchar(50) DEFAULT NULL,
  `topico_status` varchar(20) NOT NULL,
  `topico_dataCriacao` date NOT NULL,
  `topico_dataTermino` date DEFAULT NULL,
  `topico_situacao` varchar(50) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `topicos`
--

INSERT INTO `topicos` (`topico_id`, `topico_titulo`, `topico_status`, `topico_dataCriacao`, `topico_dataTermino`, `topico_situacao`, `usuario_id`) VALUES
(14, NULL, 'Incompleto', '2018-12-04', NULL, NULL, 11),
(15, NULL, 'Incompleto', '2018-12-04', NULL, NULL, 11),
(16, 'olaaa', 'Completo', '2018-12-04', '2018-12-04', 'Aberto', 11),
(17, 'olaaa', 'Completo', '2018-12-04', '2018-12-04', 'Aberto', 15),
(18, 'teste usuario', 'Completo', '2018-12-04', '2018-12-04', 'Aberto', 11),
(19, NULL, 'Incompleto', '2018-12-04', NULL, NULL, 11),
(20, NULL, 'Incompleto', '2018-12-04', NULL, NULL, 14),
(21, NULL, 'Incompleto', '2018-12-04', NULL, NULL, 14),
(22, '', 'Completo', '2018-12-04', '2018-12-04', 'Aberto', 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ufs`
--

CREATE TABLE `ufs` (
  `uf_id` int(11) NOT NULL,
  `uf_sigla` varchar(3) NOT NULL,
  `uf_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ufs`
--

INSERT INTO `ufs` (`uf_id`, `uf_sigla`, `uf_nome`) VALUES
(1, 'PR', 'Paraná'),
(2, 'SC', 'Santa Catarina'),
(5, 'MS', 'Mato Grosso do Sul'),
(7, 'RJ', 'Rio de janeiro'),
(8, 'AC', 'Acre'),
(9, 'AL', 'Alagoas'),
(10, 'AP', 'Amapa'),
(11, 'AM', 'Amazonas'),
(12, 'BA', 'Bahia'),
(13, 'CE', 'Ceara'),
(14, 'DF', 'Distrito Federal'),
(15, 'ES', 'Espirito Santo'),
(16, 'GO', 'Goias'),
(17, 'MA', 'Maranhao'),
(18, 'MT', 'Mato Grosso'),
(19, 'MG', 'Minas Gerais'),
(20, 'PA', 'Para'),
(21, 'PB', 'Paraiba'),
(22, 'PE', 'Pernambuco'),
(23, 'PI', 'Piaui'),
(24, 'RN', 'Rio Grande do Norte'),
(25, 'RS', 'Rio Grande do Sul'),
(26, 'RO', 'Rondonia'),
(27, 'SP', 'Sao Paulo'),
(28, 'SE', 'Sergipe'),
(29, 'TO', 'Tocantins'),
(30, 'N/A', 'N/A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nomeConta` varchar(50) NOT NULL,
  `usuario_senha` varchar(50) NOT NULL,
  `usuario_tipoAcesso` varchar(50) NOT NULL,
  `usuario_dataDeCadastro` date NOT NULL,
  `usuario_dataDeAlteracao` date DEFAULT NULL,
  `usuario_apelido` varchar(50) DEFAULT NULL,
  `usuario_errosLogin` int(4) NOT NULL,
  `usuario_ticketResolvidos` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_nomeConta`, `usuario_senha`, `usuario_tipoAcesso`, `usuario_dataDeCadastro`, `usuario_dataDeAlteracao`, `usuario_apelido`, `usuario_errosLogin`, `usuario_ticketResolvidos`) VALUES
(1, 'admin', '123', 'Administrador', '1996-11-18', NULL, 'Master', 2, 0),
(2, 'operador', '123', 'Operador', '1996-11-18', NULL, 'oi', 3, 0),
(9, 'TesteTeste', '123456789@', 'Cliente', '2018-10-30', NULL, NULL, 0, 0),
(10, 'OiOiOi', '12345', 'Cliente', '2018-10-30', '2018-11-05', NULL, 0, 0),
(11, 'memo', '123', 'Cliente', '2018-10-30', NULL, NULL, 1, 0),
(14, 'usuarioTeste', '123', 'Usuario', '2018-10-30', '2018-11-04', NULL, 0, 0),
(15, 'oioi', '', 'Cliente', '2018-11-05', '2018-12-04', NULL, 0, 0),
(16, 'CidadeDeDeus', '12345', 'Cliente', '2018-12-03', '2018-12-04', NULL, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acoes`
--
ALTER TABLE `acoes`
  ADD PRIMARY KEY (`acao_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD KEY `endereco_id` (`endereco_id`),
  ADD KEY `empresa_id` (`empresa_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`empresa_id`),
  ADD UNIQUE KEY `empresa_cnpj` (`empresa_cnpj`),
  ADD KEY `endereco_id` (`endereco_id`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`endereco_id`),
  ADD KEY `uf_id` (`uf_id`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `topico_id` (`topico_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `topicos`
--
ALTER TABLE `topicos`
  ADD PRIMARY KEY (`topico_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `ufs`
--
ALTER TABLE `ufs`
  ADD PRIMARY KEY (`uf_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acoes`
--
ALTER TABLE `acoes`
  MODIFY `acao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `empresas`
--
ALTER TABLE `empresas`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `endereco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `topicos`
--
ALTER TABLE `topicos`
  MODIFY `topico_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `ufs`
--
ALTER TABLE `ufs`
  MODIFY `uf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `acoes`
--
ALTER TABLE `acoes`
  ADD CONSTRAINT `acoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`endereco_id`),
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`empresa_id`),
  ADD CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Limitadores para a tabela `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`endereco_id`);

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`uf_id`) REFERENCES `ufs` (`uf_id`);

--
-- Limitadores para a tabela `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threads_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`),
  ADD CONSTRAINT `threads_ibfk_2` FOREIGN KEY (`topico_id`) REFERENCES `topicos` (`topico_id`),
  ADD CONSTRAINT `threads_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Limitadores para a tabela `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Limitadores para a tabela `topicos`
--
ALTER TABLE `topicos`
  ADD CONSTRAINT `topicos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
