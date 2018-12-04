-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 04-Dez-2018 às 19:14
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
(8, '[Ljava.lang.String;@3b5f8ac4', '[Ljava.lang.String;@596ba82e', 11);

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
(43, '@memo oi', 'operador', 0, '2018-12-04 14:06:17', NULL, 11, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `ticket_titulo` varchar(100) DEFAULT NULL,
  `ticket_status` varchar(20) NOT NULL,
  `ticket_tempoInicio` timestamp NULL DEFAULT NULL,
  `ticket_tempoFim` timestamp NULL DEFAULT '0000-00-00 00:00:00',
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
(19, NULL, 'Incompleto', '2018-12-04', NULL, NULL, 11);

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
(1, 'admin', '12345', 'Administrador', '1996-11-18', NULL, 'Master', 1, 0),
(2, 'operador', '123', 'Operador', '1996-11-18', NULL, 'oi', 0, 0),
(9, 'TesteTeste', '123456789@', 'Cliente', '2018-10-30', NULL, NULL, 0, 0),
(10, 'OiOiOi', '12345', 'Cliente', '2018-10-30', '2018-11-05', NULL, 0, 0),
(11, 'memo', '123', 'Cliente', '2018-10-30', NULL, NULL, 0, 0),
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
  MODIFY `acao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `topicos`
--
ALTER TABLE `topicos`
  MODIFY `topico_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
