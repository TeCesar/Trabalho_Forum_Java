-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05-Dez-2018 às 05:01
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
(95, '[Ljava.lang.String;@37d59967', '[Ljava.lang.String;@376d46ef', 2),
(96, '[Ljava.lang.String;@6a327ac0', '[Ljava.lang.String;@5d4e1c81', 2),
(97, '[Ljava.lang.String;@775da7e0', '[Ljava.lang.String;@740147de', 2),
(98, '[Ljava.lang.String;@6985d45d', '[Ljava.lang.String;@704d1243', 2),
(99, '[Ljava.lang.String;@4b7ee573', '[Ljava.lang.String;@3f005c40', 2),
(100, '[Ljava.lang.String;@16b555df', '[Ljava.lang.String;@18382acc', 2),
(101, '[Ljava.lang.String;@c35c545', '[Ljava.lang.String;@51287f8', 2),
(102, '[Ljava.lang.String;@21f613cd', '[Ljava.lang.String;@678d6f86', 2),
(103, '[Ljava.lang.String;@2b041885', '[Ljava.lang.String;@25c3e395', 1),
(104, '[Ljava.lang.String;@7c4711c6', '[Ljava.lang.String;@4d954ec4', 1),
(105, '[Ljava.lang.String;@58432731', '[Ljava.lang.String;@1d41a25d', 1),
(106, '[Ljava.lang.String;@454d22a2', '[Ljava.lang.String;@4b8ad47b', 1),
(107, '[Ljava.lang.String;@7e76e1d9', NULL, 1),
(108, '[Ljava.lang.String;@5d2429e2', NULL, 1),
(109, '[Ljava.lang.String;@54fcc798', '[Ljava.lang.String;@7c8e19fe', 1),
(110, '[Ljava.lang.String;@13ce2ac5', '[Ljava.lang.String;@1d09c6cc', 1),
(111, NULL, NULL, 1),
(112, NULL, NULL, 1),
(113, '[Ljava.lang.String;@381695a1', NULL, 1),
(115, '[Ljava.lang.String;@373186fb', NULL, 15),
(116, '[Ljava.lang.String;@ae81db6', NULL, 15),
(117, '[Ljava.lang.String;@12ec3b72', NULL, 15),
(119, '[Ljava.lang.String;@12565f36', '[Ljava.lang.String;@62c90148', 2),
(120, '[Ljava.lang.String;@78040b0a', '[Ljava.lang.String;@307f7a73', 2),
(121, '[Ljava.lang.String;@30a12ad5', NULL, 2),
(122, '[Ljava.lang.String;@3c8cbd57', '[Ljava.lang.String;@576ab2b0', 2),
(123, '[Ljava.lang.String;@a4aaf7f', NULL, 2),
(124, '[Ljava.lang.String;@5175362f', NULL, 2),
(125, '[Ljava.lang.String;@2f295f6c', NULL, 2),
(126, '[Ljava.lang.String;@6d03a582', '[Ljava.lang.String;@41133415', 2),
(127, '[Ljava.lang.String;@2cbcdeb0', '[Ljava.lang.String;@69be4543', 2),
(128, '[Ljava.lang.String;@1eaa24bd', NULL, 2),
(129, '[Ljava.lang.String;@605ef271', '[Ljava.lang.String;@333086e2', 2),
(130, '[Ljava.lang.String;@7483db48', NULL, 2),
(131, '[Ljava.lang.String;@78188884', NULL, 2),
(132, '[Ljava.lang.String;@16292e32', '[Ljava.lang.String;@18eed287', 2),
(133, '[Ljava.lang.String;@6106fd1b', '[Ljava.lang.String;@6fc10f4b', 2),
(134, '[Ljava.lang.String;@35d7371', '[Ljava.lang.String;@24b64f8e', 2),
(135, '[Ljava.lang.String;@62642d00', NULL, 2),
(136, '[Ljava.lang.String;@4cfbc24f', '[Ljava.lang.String;@4603a93f', 2),
(137, '[Ljava.lang.String;@6a8b24b', NULL, 2),
(138, '[Ljava.lang.String;@2ba426b4', NULL, 2),
(139, '[Ljava.lang.String;@6406d5eb', '[Ljava.lang.String;@f11defe', 2),
(140, '[Ljava.lang.String;@29249bf3', '[Ljava.lang.String;@6d76a367', 2),
(141, '[Ljava.lang.String;@6bde1d1a', NULL, 2),
(142, '[Ljava.lang.String;@4495e152', '[Ljava.lang.String;@7bff6e26', 2),
(143, '[Ljava.lang.String;@3200fef', NULL, 2),
(144, '[Ljava.lang.String;@15a7b99e', NULL, 2),
(145, '[Ljava.lang.String;@4a9dc055', '[Ljava.lang.String;@73f08d21', 2),
(146, '[Ljava.lang.String;@1808ab6f', '[Ljava.lang.String;@4113253f', 2),
(147, '[Ljava.lang.String;@20a85ce4', NULL, 2),
(148, '[Ljava.lang.String;@269a4069', '[Ljava.lang.String;@4855dbb0', 2),
(149, '[Ljava.lang.String;@1bcc288d', '[Ljava.lang.String;@533fc2df', 2),
(150, '[Ljava.lang.String;@249322db', '[Ljava.lang.String;@684a08ba', 2),
(151, '[Ljava.lang.String;@7bd01454', NULL, 2),
(152, '[Ljava.lang.String;@7e1fc0d1', '[Ljava.lang.String;@7f136f5b', 2),
(153, '[Ljava.lang.String;@17c793f3', NULL, 2),
(154, '[Ljava.lang.String;@4aa0b548', NULL, 2),
(155, '[Ljava.lang.String;@624d2751', '[Ljava.lang.String;@6c8ac568', 2),
(156, '[Ljava.lang.String;@24466a56', '[Ljava.lang.String;@2a8180ae', 2),
(157, '[Ljava.lang.String;@669a56c9', NULL, 2),
(158, '[Ljava.lang.String;@15da4a63', '[Ljava.lang.String;@3bafe00c', 2),
(159, '[Ljava.lang.String;@18307870', NULL, 2),
(160, '[Ljava.lang.String;@62917ed9', NULL, 2),
(161, '[Ljava.lang.String;@4c9460af', '[Ljava.lang.String;@4253974d', 2),
(162, '[Ljava.lang.String;@7d7dd62d', '[Ljava.lang.String;@73ba27f2', 2),
(163, '[Ljava.lang.String;@4853d21b', NULL, 2),
(164, '[Ljava.lang.String;@1faa2417', '[Ljava.lang.String;@5d86fcc3', 2),
(165, '[Ljava.lang.String;@5490e170', NULL, 2),
(166, '[Ljava.lang.String;@d04d16b', '[Ljava.lang.String;@7fcba1b', 2),
(167, '[Ljava.lang.String;@1f76a46a', '[Ljava.lang.String;@11b149f4', 2),
(168, '[Ljava.lang.String;@4d3079a0', '[Ljava.lang.String;@c01d1a0', 2),
(169, '[Ljava.lang.String;@4fc2488e', NULL, 2),
(170, '[Ljava.lang.String;@1c4a59d9', '[Ljava.lang.String;@16b232a9', 2),
(171, '[Ljava.lang.String;@7c29a20', NULL, 2),
(172, '[Ljava.lang.String;@cab793b', '[Ljava.lang.String;@653124b', 2),
(173, '[Ljava.lang.String;@3559aae0', NULL, 2),
(174, '[Ljava.lang.String;@4c80c707', '[Ljava.lang.String;@1d7d1010', 2),
(175, '[Ljava.lang.String;@5f65a138', NULL, 2),
(176, '[Ljava.lang.String;@2b51095e', '[Ljava.lang.String;@48125a6', 2),
(177, '[Ljava.lang.String;@4f2847e9', '[Ljava.lang.String;@41efa07c', 1),
(178, '[Ljava.lang.String;@62923533', '[Ljava.lang.String;@6523b1b', 1),
(179, '[Ljava.lang.String;@787f7424', '[Ljava.lang.String;@76b8855b', 1),
(180, '[Ljava.lang.String;@69da3a3d', '[Ljava.lang.String;@73f6f75b', 1),
(181, NULL, NULL, 1),
(182, NULL, NULL, 1),
(183, '[Ljava.lang.String;@51e19223', NULL, 1),
(184, '[Ljava.lang.String;@19466aa3', NULL, 16),
(185, '[Ljava.lang.String;@722e55e7', NULL, 16),
(186, '[Ljava.lang.String;@28c523ab', '[Ljava.lang.String;@2602d8c3', 1),
(187, '[Ljava.lang.String;@63401fc', '[Ljava.lang.String;@4c8e647d', 1),
(188, NULL, NULL, 1),
(189, NULL, NULL, 1),
(190, '[Ljava.lang.String;@4512e8a0', NULL, 1),
(191, '[Ljava.lang.String;@5c4ff2f3', NULL, 16),
(192, NULL, NULL, 16),
(193, NULL, NULL, 16),
(194, '[Ljava.lang.String;@72c4c03a', NULL, 16),
(195, '[Ljava.lang.String;@59423963', '[Ljava.lang.String;@5785dc3b', 1),
(196, '[Ljava.lang.String;@104e5ed9', '[Ljava.lang.String;@61d14420', 1),
(197, NULL, NULL, 1),
(198, NULL, NULL, 1),
(199, '[Ljava.lang.String;@5e4a47c9', NULL, 1),
(201, '[Ljava.lang.String;@1d98ac25', NULL, 16),
(202, '[Ljava.lang.String;@11ab948d', '[Ljava.lang.String;@7cdaa206', 2),
(203, NULL, NULL, 2),
(204, NULL, NULL, 2),
(205, '[Ljava.lang.String;@52496a28', NULL, 2),
(206, '[Ljava.lang.String;@a5e0347', '[Ljava.lang.String;@124c7ab8', 1),
(207, '[Ljava.lang.String;@757150e5', '[Ljava.lang.String;@18b3db35', 1),
(208, '[Ljava.lang.String;@15524f67', '[Ljava.lang.String;@1b95a3bd', 1),
(209, '[Ljava.lang.String;@454d22a2', '[Ljava.lang.String;@4b8ad47b', 2),
(211, '[Ljava.lang.String;@1547bb01', '[Ljava.lang.String;@1b8047d9', 1),
(212, '[Ljava.lang.String;@692c159c', '[Ljava.lang.String;@a8f901e', 1),
(213, '[Ljava.lang.String;@66b70ded', '[Ljava.lang.String;@779618e3', 1),
(214, '[Ljava.lang.String;@15524f67', '[Ljava.lang.String;@1b95a3bd', 1),
(215, '[Ljava.lang.String;@d7f3bac', '[Ljava.lang.String;@3dc770c5', 1),
(216, '[Ljava.lang.String;@4c3a7300', '[Ljava.lang.String;@5bfa4376', 1),
(217, '[Ljava.lang.String;@2b9c6b0c', '[Ljava.lang.String;@6e9ee01b', 1),
(218, '[Ljava.lang.String;@7e152b79', '[Ljava.lang.String;@2b445fe4', 1),
(219, NULL, NULL, 1),
(220, '[Ljava.lang.String;@5ef89e71', NULL, 1),
(221, '[Ljava.lang.String;@16292e32', NULL, 17),
(222, '[Ljava.lang.String;@300aad00', '[Ljava.lang.String;@ed6b017', 17),
(223, NULL, NULL, 17),
(224, '[Ljava.lang.String;@4142e753', NULL, 17),
(225, NULL, NULL, 1),
(226, '[Ljava.lang.String;@a99feb8', NULL, 1),
(228, '[Ljava.lang.String;@1efb369a', '[Ljava.lang.String;@51c7e470', 1),
(229, '[Ljava.lang.String;@11fac163', '[Ljava.lang.String;@4365b37', 1),
(230, NULL, NULL, 1),
(231, '[Ljava.lang.String;@15054866', NULL, 1),
(232, '[Ljava.lang.String;@454d22a2', NULL, 17),
(233, '[Ljava.lang.String;@7449fef5', '[Ljava.lang.String;@2ba9d1bf', 1),
(234, '[Ljava.lang.String;@2e6bdaec', '[Ljava.lang.String;@759d963e', 1),
(235, '[Ljava.lang.String;@7d34bb77', '[Ljava.lang.String;@7e6427b9', 1),
(236, '[Ljava.lang.String;@7855b7a6', '[Ljava.lang.String;@769246dc', 1),
(237, '[Ljava.lang.String;@4f5327bf', '[Ljava.lang.String;@4194c025', 1),
(238, '[Ljava.lang.String;@7de3f745', '[Ljava.lang.String;@73240689', 1),
(239, '[Ljava.lang.String;@606f6f20', '[Ljava.lang.String;@f27a1aa', 1),
(240, '[Ljava.lang.String;@331a91ac', '[Ljava.lang.String;@3ddd79bf', 1),
(241, '[Ljava.lang.String;@6c13a505', '[Ljava.lang.String;@62d446f7', 1),
(242, '[Ljava.lang.String;@7855b7a6', '[Ljava.lang.String;@769246dc', 1),
(243, '[Ljava.lang.String;@6ab775d4', '[Ljava.lang.String;@647086f2', 1),
(244, '[Ljava.lang.String;@661fa1d7', '[Ljava.lang.String;@4915d1fd', 1),
(245, '[Ljava.lang.String;@730e96c2', '[Ljava.lang.String;@42247cad', 1),
(246, '[Ljava.lang.String;@7966f25', '[Ljava.lang.String;@7e79b98e', 1),
(247, '[Ljava.lang.String;@688fa5ab', '[Ljava.lang.String;@5adeb6db', 1),
(248, '[Ljava.lang.String;@346686cf', '[Ljava.lang.String;@44b54638', 1),
(249, '[Ljava.lang.String;@6f332426', '[Ljava.lang.String;@f9b411b', 1),
(250, '[Ljava.lang.String;@6d286609', '[Ljava.lang.String;@9d2f61e', 1),
(251, '[Ljava.lang.String;@361e6f9a', '[Ljava.lang.String;@5a7e19c5', 1),
(252, '[Ljava.lang.String;@1aa3dedf', '[Ljava.lang.String;@5fa143ef', 1),
(253, '[Ljava.lang.String;@c69edc2', '[Ljava.lang.String;@3269bab3', 1),
(254, '[Ljava.lang.String;@6153ca28', '[Ljava.lang.String;@6025ed7e', 1),
(255, '[Ljava.lang.String;@1b1a0117', '[Ljava.lang.String;@1fe45bc2', 1),
(256, '[Ljava.lang.String;@323e4322', '[Ljava.lang.String;@301c1573', 1),
(257, '[Ljava.lang.String;@3768031e', '[Ljava.lang.String;@283b046d', 1),
(258, '[Ljava.lang.String;@ac41a97', '[Ljava.lang.String;@3bd8850', 1),
(259, '[Ljava.lang.String;@37d82083', '[Ljava.lang.String;@6c3de3c0', 1),
(260, '[Ljava.lang.String;@233bdcbb', '[Ljava.lang.String;@4cffa918', 1),
(261, '[Ljava.lang.String;@5c7333e4', '[Ljava.lang.String;@4023e9ff', 1),
(262, '[Ljava.lang.String;@73aeb33e', '[Ljava.lang.String;@1f8eb974', 1),
(263, '[Ljava.lang.String;@60f72611', '[Ljava.lang.String;@2a2ffa64', 1),
(264, '[Ljava.lang.String;@40068215', '[Ljava.lang.String;@2464d97b', 1),
(265, '[Ljava.lang.String;@3f4ba485', '[Ljava.lang.String;@1791329f', 1),
(266, '[Ljava.lang.String;@1aeffe9', '[Ljava.lang.String;@22b71484', 1),
(267, '[Ljava.lang.String;@42813d8a', NULL, 1),
(268, '[Ljava.lang.String;@4e805db9', '[Ljava.lang.String;@683d4e3c', 1),
(269, NULL, NULL, 1),
(270, '[Ljava.lang.String;@16d535e2', NULL, 1),
(271, '[Ljava.lang.String;@392287ba', '[Ljava.lang.String;@78d88141', 11),
(272, '[Ljava.lang.String;@15a330b2', '[Ljava.lang.String;@3e3cb384', 11),
(273, '[Ljava.lang.String;@769429be', '[Ljava.lang.String;@33e61b5', 11),
(274, '[Ljava.lang.String;@10c06552', '[Ljava.lang.String;@1c950ad3', 11),
(275, '[Ljava.lang.String;@25f8525b', '[Ljava.lang.String;@2d59c3d', 11),
(276, '[Ljava.lang.String;@417dc945', '[Ljava.lang.String;@4a2ec80a', 11),
(277, NULL, NULL, 11),
(278, '[Ljava.lang.String;@1c207e0e', NULL, 11),
(279, '[Ljava.lang.String;@144db0e9', '[Ljava.lang.String;@e80b0cf', 17),
(280, '[Ljava.lang.String;@37f1a2b7', '[Ljava.lang.String;@5a5b928a', 17),
(281, '[Ljava.lang.String;@4fe1b584', NULL, 17),
(282, '[Ljava.lang.String;@23702545', '[Ljava.lang.String;@67d627b2', 17),
(283, '[Ljava.lang.String;@6c13a505', '[Ljava.lang.String;@62d446f7', 2),
(284, '[Ljava.lang.String;@7916728b', '[Ljava.lang.String;@354dabc8', 2),
(285, NULL, NULL, 2),
(286, '[Ljava.lang.String;@3c679e9d', NULL, 2),
(287, '[Ljava.lang.String;@7855b7a6', '[Ljava.lang.String;@769246dc', 11),
(288, '[Ljava.lang.String;@4f5327bf', '[Ljava.lang.String;@4194c025', 11),
(289, NULL, NULL, 11),
(290, '[Ljava.lang.String;@2f3df54c', NULL, 11),
(291, '[Ljava.lang.String;@2f4497a7', '[Ljava.lang.String;@25f8525b', 15),
(292, '[Ljava.lang.String;@7fd2cc75', '[Ljava.lang.String;@3d78f276', 15),
(293, '[Ljava.lang.String;@1a791ca8', '[Ljava.lang.String;@59f9f6f3', 15),
(294, '[Ljava.lang.String;@7e2098a4', '[Ljava.lang.String;@1c313dda', 15),
(295, '[Ljava.lang.String;@18366ac2', NULL, 15),
(296, '[Ljava.lang.String;@49349c22', '[Ljava.lang.String;@144db0e9', 15),
(297, NULL, NULL, 15),
(298, '[Ljava.lang.String;@6383e0f8', NULL, 15),
(299, '[Ljava.lang.String;@2f86292a', '[Ljava.lang.String;@5a626266', 2),
(300, '[Ljava.lang.String;@331a91ac', '[Ljava.lang.String;@3ddd79bf', 2),
(301, '[Ljava.lang.String;@683d4e3c', NULL, 2),
(302, '[Ljava.lang.String;@20eb9fc5', '[Ljava.lang.String;@1b8c68ff', 2),
(303, NULL, NULL, 2),
(304, '[Ljava.lang.String;@74855461', NULL, 2),
(305, '[Ljava.lang.String;@2ab0b945', '[Ljava.lang.String;@6fb427d9', 15),
(306, '[Ljava.lang.String;@504e818', '[Ljava.lang.String;@148468b', 15),
(307, '[Ljava.lang.String;@293b78a2', '[Ljava.lang.String;@58ba8338', 15),
(308, '[Ljava.lang.String;@13ce2ac5', '[Ljava.lang.String;@1d09c6cc', 11),
(309, '[Ljava.lang.String;@7033fdb3', '[Ljava.lang.String;@7ef40dc5', 11),
(310, '[Ljava.lang.String;@2fd807ab', '[Ljava.lang.String;@6ada8c34', 11),
(311, NULL, NULL, 11),
(312, '[Ljava.lang.String;@1e59996b', NULL, 11),
(313, '[Ljava.lang.String;@4f898644', '[Ljava.lang.String;@6ca97143', 15),
(314, '[Ljava.lang.String;@42cc0cc', '[Ljava.lang.String;@4341143e', 15),
(315, '[Ljava.lang.String;@2a2b1531', '[Ljava.lang.String;@303a0d13', 15),
(316, '[Ljava.lang.String;@5ad05b29', '[Ljava.lang.String;@7dd44da9', 15),
(317, '[Ljava.lang.String;@21dcecb6', '[Ljava.lang.String;@6432a6a7', 15),
(318, '[Ljava.lang.String;@26c3a586', '[Ljava.lang.String;@3b779429', 15),
(319, '[Ljava.lang.String;@7e76e1d9', '[Ljava.lang.String;@70b10067', 15),
(320, '[Ljava.lang.String;@2164007c', '[Ljava.lang.String;@2fa3ea20', 15),
(321, '[Ljava.lang.String;@39c083e7', NULL, 15),
(322, '[Ljava.lang.String;@345ac8df', '[Ljava.lang.String;@59ce391d', 15),
(323, '[Ljava.lang.String;@7756ac5a', '[Ljava.lang.String;@7d759e0d', 15),
(324, '[Ljava.lang.String;@64e67e0', '[Ljava.lang.String;@383d8f9d', 15),
(325, '[Ljava.lang.String;@6c0d3c25', '[Ljava.lang.String;@384d3173', 15),
(326, '[Ljava.lang.String;@3c66347e', '[Ljava.lang.String;@4268cadd', 15),
(327, '[Ljava.lang.String;@713e5443', '[Ljava.lang.String;@73527543', 15),
(328, '[Ljava.lang.String;@5add7bc3', '[Ljava.lang.String;@541a9ee8', 15),
(329, '[Ljava.lang.String;@2fffc27e', '[Ljava.lang.String;@570e1c7e', 15),
(330, NULL, NULL, 15),
(331, '[Ljava.lang.String;@2e6d9a03', NULL, 15),
(332, '[Ljava.lang.String;@2d89837c', '[Ljava.lang.String;@4c57b050', 17),
(333, '[Ljava.lang.String;@1cdcb730', '[Ljava.lang.String;@291f74ca', 17),
(334, '[Ljava.lang.String;@1c8c9e43', NULL, 17),
(335, '[Ljava.lang.String;@20e2aec4', '[Ljava.lang.String;@56447588', 17),
(336, NULL, NULL, 17),
(337, '[Ljava.lang.String;@6c28114e', NULL, 17),
(338, '[Ljava.lang.String;@7fe4a8d7', '[Ljava.lang.String;@2491447d', 15),
(339, '[Ljava.lang.String;@1a671f96', '[Ljava.lang.String;@f6c6233', 15),
(340, '[Ljava.lang.String;@6b611966', '[Ljava.lang.String;@62cca3ce', 15),
(341, '[Ljava.lang.String;@559c16d7', '[Ljava.lang.String;@37aec1d4', 15),
(342, NULL, NULL, 15),
(343, '[Ljava.lang.String;@4a05b21e', NULL, 15),
(344, '[Ljava.lang.String;@2993c326', '[Ljava.lang.String;@42e2e89d', 1),
(345, '[Ljava.lang.String;@669a5298', '[Ljava.lang.String;@1ec11a67', 1),
(346, NULL, NULL, 1),
(347, '[Ljava.lang.String;@264d18', NULL, 1),
(348, '[Ljava.lang.String;@4081d130', '[Ljava.lang.String;@274f62b3', 15),
(349, '[Ljava.lang.String;@6e13291e', '[Ljava.lang.String;@5dbb5bd4', 15),
(350, '[Ljava.lang.String;@4be57c75', '[Ljava.lang.String;@692fbd80', 15),
(351, NULL, NULL, 15),
(352, '[Ljava.lang.String;@2543a71b', NULL, 15),
(353, '[Ljava.lang.String;@5110301f', '[Ljava.lang.String;@6a6ab369', 1),
(354, '[Ljava.lang.String;@43449568', '[Ljava.lang.String;@4d836370', 11),
(355, '[Ljava.lang.String;@1860dba1', '[Ljava.lang.String;@16a736dd', 11),
(356, '[Ljava.lang.String;@3d3e78bd', '[Ljava.lang.String;@329ecf70', 11),
(357, '[Ljava.lang.String;@557ad5e3', '[Ljava.lang.String;@5bbd213c', 11),
(358, '[Ljava.lang.String;@179b4943', '[Ljava.lang.String;@195ca5c0', 11),
(359, '[Ljava.lang.String;@74001535', '[Ljava.lang.String;@7ac7e5c5', 11),
(360, '[Ljava.lang.String;@7dfe20df', '[Ljava.lang.String;@7339d110', 11),
(361, '[Ljava.lang.String;@6551f957', '[Ljava.lang.String;@6b960b8d', 11),
(362, '[Ljava.lang.String;@4420c578', '[Ljava.lang.String;@4ae7238c', 11),
(363, '[Ljava.lang.String;@79abadb6', '[Ljava.lang.String;@3ca93ce7', 11),
(364, '[Ljava.lang.String;@5b0544e2', '[Ljava.lang.String;@5f3acb5a', 11),
(365, '[Ljava.lang.String;@4e41e302', '[Ljava.lang.String;@7afca997', 11),
(366, '[Ljava.lang.String;@4276964b', '[Ljava.lang.String;@2c8d66cd', 11),
(367, '[Ljava.lang.String;@7eda83cd', '[Ljava.lang.String;@2740a3ae', 11),
(368, '[Ljava.lang.String;@44d4e7e5', '[Ljava.lang.String;@3707d248', 11),
(369, '[Ljava.lang.String;@43449568', '[Ljava.lang.String;@4d836370', 11),
(370, '[Ljava.lang.String;@335d75ef', '[Ljava.lang.String;@3d9a8df4', 11),
(371, '[Ljava.lang.String;@513c2188', '[Ljava.lang.String;@5503af77', 11),
(372, '[Ljava.lang.String;@a88c60f', '[Ljava.lang.String;@1930295', 11),
(373, '[Ljava.lang.String;@a13f3eb', '[Ljava.lang.String;@4d41cd9', 11),
(374, '[Ljava.lang.String;@7e41eb72', '[Ljava.lang.String;@15e043d2', 11),
(375, '[Ljava.lang.String;@d48b2bb', '[Ljava.lang.String;@31980f2e', 11),
(376, '[Ljava.lang.String;@4e7ce663', '[Ljava.lang.String;@1886baba', 11),
(377, '[Ljava.lang.String;@48f4bc37', '[Ljava.lang.String;@4ccb31f1', 11),
(378, '[Ljava.lang.String;@88d6743', '[Ljava.lang.String;@64a9822', 11),
(379, '[Ljava.lang.String;@c30a420', '[Ljava.lang.String;@5428a545', 11),
(380, '[Ljava.lang.String;@218830ca', '[Ljava.lang.String;@290961ec', 11),
(381, '[Ljava.lang.String;@6befddfc', '[Ljava.lang.String;@6b445f9e', 11),
(382, '[Ljava.lang.String;@231636b7', '[Ljava.lang.String;@2471e41f', 11),
(383, NULL, NULL, 11),
(384, '[Ljava.lang.String;@10f43c9b', NULL, 11),
(385, '[Ljava.lang.String;@5844f345', '[Ljava.lang.String;@32718107', 15),
(386, '[Ljava.lang.String;@76f957fb', '[Ljava.lang.String;@4a33457d', 15),
(387, '[Ljava.lang.String;@6a63342f', '[Ljava.lang.String;@5440e5ff', 15),
(388, '[Ljava.lang.String;@e1c7466', '[Ljava.lang.String;@63236601', 15),
(389, '[Ljava.lang.String;@32bfe9b1', '[Ljava.lang.String;@489747d7', 15),
(390, '[Ljava.lang.String;@7456aaed', '[Ljava.lang.String;@5d5ef4bd', 15),
(391, '[Ljava.lang.String;@6f806ea4', '[Ljava.lang.String;@53706ba8', 15),
(392, '[Ljava.lang.String;@710ca68e', '[Ljava.lang.String;@60ed5f66', 15),
(393, '[Ljava.lang.String;@579a3ce6', '[Ljava.lang.String;@49b95867', 15),
(394, '[Ljava.lang.String;@72e6a093', '[Ljava.lang.String;@30ed0b02', 15),
(395, '[Ljava.lang.String;@e226775', '[Ljava.lang.String;@4d87d341', 15),
(396, '[Ljava.lang.String;@2f66fbf0', '[Ljava.lang.String;@33261247', 15),
(397, '[Ljava.lang.String;@13ce2ac5', '[Ljava.lang.String;@1d09c6cc', 14),
(398, '[Ljava.lang.String;@7033fdb3', '[Ljava.lang.String;@7ef40dc5', 14),
(399, '[Ljava.lang.String;@4c3a7300', '[Ljava.lang.String;@5bfa4376', 14),
(400, '[Ljava.lang.String;@454d22a2', '[Ljava.lang.String;@4b8ad47b', 14),
(401, '[Ljava.lang.String;@7e76e1d9', '[Ljava.lang.String;@70b10067', 14),
(402, NULL, NULL, 14),
(403, '[Ljava.lang.String;@2dc0d752', NULL, 14),
(404, '[Ljava.lang.String;@6195c8', '[Ljava.lang.String;@45630ba0', 11),
(405, '[Ljava.lang.String;@236e9792', '[Ljava.lang.String;@42cc0cc', 11),
(406, '[Ljava.lang.String;@7a2e6916', '[Ljava.lang.String;@275bf41', 11),
(407, '[Ljava.lang.String;@2b041885', '[Ljava.lang.String;@25c3e395', 11),
(408, '[Ljava.lang.String;@6e9ee01b', '[Ljava.lang.String;@6f786a54', 11),
(409, '[Ljava.lang.String;@d7f3bac', '[Ljava.lang.String;@3dc770c5', 11),
(410, '[Ljava.lang.String;@61e94a24', '[Ljava.lang.String;@17827cba', 11),
(411, '[Ljava.lang.String;@52708921', '[Ljava.lang.String;@30868333', 11),
(412, '[Ljava.lang.String;@59ac332b', '[Ljava.lang.String;@1d174217', 11),
(413, '[Ljava.lang.String;@744c161e', '[Ljava.lang.String;@49ea25bd', 11),
(414, '[Ljava.lang.String;@4b28e9fd', '[Ljava.lang.String;@7b73d5a8', 11),
(415, '[Ljava.lang.String;@112a6161', '[Ljava.lang.String;@412392e', 11),
(416, '[Ljava.lang.String;@1a5b80e6', '[Ljava.lang.String;@7b5eab7d', 11),
(417, '[Ljava.lang.String;@240a3417', '[Ljava.lang.String;@7f7afdab', 11),
(418, '[Ljava.lang.String;@4c58f7a4', '[Ljava.lang.String;@6eb2bec5', 11),
(419, '[Ljava.lang.String;@3c3e3763', '[Ljava.lang.String;@29a209f0', 11),
(420, '[Ljava.lang.String;@36a32649', '[Ljava.lang.String;@21585dac', 11),
(421, NULL, NULL, 11),
(422, '[Ljava.lang.String;@5cfe433f', NULL, 11),
(424, '[Ljava.lang.String;@14ddd75f', '[Ljava.lang.String;@55a65a14', 11),
(425, '[Ljava.lang.String;@2ca4599d', '[Ljava.lang.String;@5a41bf36', 11),
(426, '[Ljava.lang.String;@24c2850c', '[Ljava.lang.String;@5cafdceb', 11),
(427, NULL, NULL, 11),
(428, '[Ljava.lang.String;@2b39f7aa', NULL, 11),
(429, '[Ljava.lang.String;@231cfec7', '[Ljava.lang.String;@9cbc1b2', 17),
(430, '[Ljava.lang.String;@5e90e5fd', '[Ljava.lang.String;@39c19386', 17),
(431, '[Ljava.lang.String;@570e1c7e', NULL, 17),
(432, '[Ljava.lang.String;@7f775d04', '[Ljava.lang.String;@6b611966', 17),
(433, NULL, NULL, 17),
(434, '[Ljava.lang.String;@13657b2e', NULL, 17),
(435, '[Ljava.lang.String;@54bf7629', '[Ljava.lang.String;@51d6848f', 11),
(436, '[Ljava.lang.String;@4957afa2', '[Ljava.lang.String;@61f753ab', 11),
(437, '[Ljava.lang.String;@1e773f11', '[Ljava.lang.String;@f773940', 11),
(438, '[Ljava.lang.String;@230f5f46', '[Ljava.lang.String;@36ab0572', 11),
(439, '[Ljava.lang.String;@7488824b', '[Ljava.lang.String;@448d00b7', 11),
(440, '[Ljava.lang.String;@2993c326', '[Ljava.lang.String;@42e2e89d', 11),
(441, '[Ljava.lang.String;@5bdc2d1', '[Ljava.lang.String;@6bb4960f', 11),
(442, '[Ljava.lang.String;@263b7754', '[Ljava.lang.String;@7e4b8979', 11),
(443, '[Ljava.lang.String;@24de83ca', '[Ljava.lang.String;@54cc31cb', 11),
(444, '[Ljava.lang.String;@793d387d', '[Ljava.lang.String;@7cf04460', 11),
(445, '[Ljava.lang.String;@89a2e4c', '[Ljava.lang.String;@2821b432', 11),
(446, '[Ljava.lang.String;@578dcd38', '[Ljava.lang.String;@49cd8bdf', 11),
(447, '[Ljava.lang.String;@43c58d92', '[Ljava.lang.String;@234de2df', 11),
(448, '[Ljava.lang.String;@470f6630', '[Ljava.lang.String;@18468999', 11),
(449, '[Ljava.lang.String;@725fdfc6', '[Ljava.lang.String;@2152fa82', 11),
(450, '[Ljava.lang.String;@106dfc5a', '[Ljava.lang.String;@79ecd805', 11),
(451, '[Ljava.lang.String;@6cd768d7', '[Ljava.lang.String;@220670a1', 11);

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
  `thread_mensagem` varchar(500) NOT NULL,
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
(50, '@usuarioTeste', 'usuarioTeste', 1, '2018-12-04 21:44:28', 22, NULL, 14),
(51, 'teste', 'operador', 0, '2018-12-04 22:56:39', 22, NULL, 2),
(52, 'qqqqqq', 'operador', 0, '2018-12-04 22:57:31', 22, NULL, 2),
(54, '@operador qq', 'operador', 0, '2018-12-04 22:57:47', 22, NULL, 2),
(55, '@operador qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 22:58:29', 22, NULL, 2),
(56, 'qq', 'operador', 0, '2018-12-04 22:58:47', 22, NULL, 2),
(57, 'qqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 22:59:25', 18, NULL, 2),
(58, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:01:31', 16, NULL, 2),
(59, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:03:57', 16, NULL, 2),
(60, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:06:26', 16, NULL, 2),
(61, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:06:30', 16, NULL, 2),
(62, '@operador qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:06:37', 16, NULL, 2),
(63, 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 'operador', 0, '2018-12-04 23:06:41', 16, NULL, 2),
(64, 'aa', 'admin', 0, '2018-12-05 01:55:17', NULL, 11, 1),
(65, 'eoq', 'operadorTeste', 0, '2018-12-05 01:59:48', NULL, 11, 17),
(66, 'wwwwwwwwww', 'oioi', 1, '2018-12-05 02:16:00', NULL, 13, 15),
(67, '@oioi teste', 'oioi', 1, '2018-12-05 02:16:52', NULL, 13, 15),
(68, '@oioi q foi', 'operador', 0, '2018-12-05 02:17:07', NULL, 13, 2),
(69, 'ausdhaisrhweifgqcf2gefkqehqiedcqd', 'oioi', 1, '2018-12-05 03:04:00', NULL, 14, 15),
(70, '@oioi falae', 'operadorTeste', 0, '2018-12-05 03:05:14', NULL, 14, 17),
(71, '@memo essa e a resposta', 'operadorTeste', 0, '2018-12-05 03:58:40', NULL, 11, 17);

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
(11, 'teste', 'Completo', '2018-12-04 12:42:34', '2018-12-04 12:42:34', 'Fechado', 'Nao', 11),
(13, 'qqqqqqqqq', 'Completo', '2018-12-05 02:16:34', '2018-12-05 02:16:34', 'Fechado', 'Nao', 15),
(14, 'segundo teste', 'Completo', '2018-12-05 03:04:34', '2018-12-05 03:04:34', 'Fechado', 'Nao', 15);

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
(17, 'olaaa', 'Completo', '2018-12-04', '2018-12-04', 'Fechado', 15),
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
  `usuario_errosLogin` int(4) NOT NULL DEFAULT '0',
  `usuario_ticketResolvidos` int(4) NOT NULL DEFAULT '0',
  `usuario_bloqueado` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_nomeConta`, `usuario_senha`, `usuario_tipoAcesso`, `usuario_dataDeCadastro`, `usuario_dataDeAlteracao`, `usuario_apelido`, `usuario_errosLogin`, `usuario_ticketResolvidos`, `usuario_bloqueado`) VALUES
(1, 'admin', '123', 'Administrador', '1996-11-18', NULL, NULL, 2, 0, 0),
(2, 'operador', '123', 'Operador', '1996-11-18', NULL, NULL, 3, 5, 0),
(9, 'TesteTeste', '123', 'Cliente', '2018-10-30', NULL, NULL, 0, 0, 0),
(10, 'OiOiOi', '123', 'Cliente', '2018-10-30', '2018-11-05', NULL, 0, 0, 0),
(11, 'memo', '123', 'Cliente', '2018-10-30', NULL, NULL, 2, 0, 0),
(14, 'usuarioTeste', '123', 'Usuario', '2018-10-30', '2018-11-04', NULL, 0, 0, 0),
(15, 'oioi', '123', 'Cliente', '2018-11-05', '2018-12-04', NULL, 6, 0, 0),
(16, 'CidadeDeDeus', '123', 'Cliente', '2018-12-03', '2018-12-04', NULL, 1, 0, 0),
(17, 'operadorTeste', '123', 'Operador', '2018-12-04', NULL, NULL, 1, 3, 0);

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
  MODIFY `acao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

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
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
