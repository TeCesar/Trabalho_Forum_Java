-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Dez-2018 às 21:23
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
  `acao_dataAcao` timestamp NULL DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `acoes`
--

INSERT INTO `acoes` (`acao_id`, `acao_acao`, `acao_tipo`, `acao_dataAcao`, `usuario_id`) VALUES
(681, 'relatorio', 'acoes', '2018-12-06 02:27:16', 1),
(682, 'listarTickets', 'todos', '2018-12-06 02:27:20', 1),
(683, 'topico', 'listarTopicos', '2018-12-06 02:27:22', 1),
(684, 'listar', 'clientes', '2018-12-06 02:27:24', 1),
(685, 'listar', 'empresas', '2018-12-06 02:27:25', 1),
(686, 'listar', 'usuarios', '2018-12-06 02:27:26', 1),
(687, 'relatorio', 'acoes', '2018-12-06 02:27:28', 1),
(688, 'login', 'logoff', '2018-12-06 02:27:40', 1),
(689, 'login', NULL, '2018-12-06 02:27:43', 2),
(690, 'relatorio', 'clienteEmpresa', '2018-12-06 02:27:46', 2),
(691, 'listarTickets', 'todos', '2018-12-06 02:27:47', 2),
(692, 'topico', 'listarTopicos', '2018-12-06 02:27:47', 2),
(693, 'cadastroEmpresa', NULL, '2018-12-06 02:27:49', 2),
(694, 'cadastroEmpresa', NULL, '2018-12-06 02:27:58', 2),
(695, 'cadastroCliente', NULL, '2018-12-06 02:28:00', 2),
(696, 'relatorio', 'clienteEmpresa', '2018-12-06 02:28:02', 2),
(697, 'listarTickets', 'Aberto', '2018-12-06 02:28:03', 2),
(698, 'listar', 'empresas', '2018-12-06 02:28:05', 2),
(699, 'listar', 'usuarios', '2018-12-06 02:28:06', 2),
(700, 'cadastroCliente', NULL, '2018-12-06 02:28:08', 2),
(701, 'relatorio', 'clienteEmpresa', '2018-12-06 02:29:15', 2),
(702, 'cadastro', 'cliente', '2018-12-06 02:29:16', 2),
(703, 'cadastro', 'empresa', '2018-12-06 02:29:18', 2),
(704, 'login', 'logoff', '2018-12-06 02:29:20', 2),
(705, 'login', NULL, '2018-12-06 02:29:23', 1),
(706, 'relatorio', 'logAcesso', '2018-12-06 02:29:26', 1),
(707, 'relatorio', 'acoes', '2018-12-06 02:29:34', 1),
(708, 'login', NULL, '2018-12-06 02:32:58', 1),
(709, 'relatorio', 'logAcesso', '2018-12-06 02:33:00', 1),
(710, 'relatorio', 'acoes', '2018-12-06 02:33:03', 1),
(711, 'relatorio', 'acoes', '2018-12-06 02:33:20', 1),
(712, 'relatorio', 'logAcesso', '2018-12-06 02:33:22', 1),
(713, 'relatorio', 'logAcesso', '2018-12-06 02:33:32', 1),
(714, 'relatorio', 'acoes', '2018-12-06 02:33:35', 1),
(715, 'listarTickets', 'todos', '2018-12-06 02:33:39', 1),
(716, 'topico', 'listarTopicos', '2018-12-06 02:33:40', 1),
(717, 'listar', 'clientes', '2018-12-06 02:33:41', 1),
(718, 'topico', 'listarTopicos', '2018-12-06 02:33:42', 1),
(719, 'listar', 'usuariosBloqueados', '2018-12-06 02:33:43', 1),
(720, 'listar', 'usuarios', '2018-12-06 02:33:44', 1),
(721, 'listarTickets', 'Aberto', '2018-12-06 02:33:45', 1),
(722, 'relatorio', 'logAcesso', '2018-12-06 02:33:46', 1),
(723, 'relatorio', 'acoes', '2018-12-06 02:33:49', 1),
(724, 'login', NULL, '2018-12-06 02:44:23', 14),
(725, 'topico', 'criaTopico', '2018-12-06 02:44:26', 14),
(726, 'topico', 'finalizaTopico', '2018-12-06 02:44:46', 14),
(727, 'login', NULL, '2018-12-06 03:40:36', 1),
(728, 'relatorio', 'duracaoTT', '2018-12-06 03:40:39', 1),
(729, 'relatorio', 'duracaoTT', '2018-12-06 03:41:39', 1),
(730, 'relatorio', 'acoes', '2018-12-06 03:41:41', 1),
(731, 'relatorio', 'duracaoTT', '2018-12-06 03:41:45', 1),
(732, 'login', NULL, '2018-12-06 03:44:28', 1),
(733, 'relatorio', 'duracaoTT', '2018-12-06 03:44:31', 1),
(734, 'login', NULL, '2018-12-06 03:47:42', 1),
(735, 'relatorio', 'duracaoTT', '2018-12-06 03:47:44', 1),
(736, 'login', NULL, '2018-12-06 03:48:40', 1),
(737, 'relatorio', 'duracaoTT', '2018-12-06 03:48:41', 1),
(738, 'relatorio', 'duracaoTT', '2018-12-06 03:49:49', 1),
(739, 'relatorio', 'duracaoTT', '2018-12-06 03:50:06', 1),
(740, 'relatorio', 'duracaoTT', '2018-12-06 03:50:24', 1),
(741, 'topico', 'listarTopicos', '2018-12-06 03:50:37', 1),
(742, 'relatorio', 'duracaoTT', '2018-12-06 03:50:47', 1),
(743, 'topico', 'listarTopicos', '2018-12-06 03:51:11', 1),
(744, 'relatorio', 'duracaoTT', '2018-12-06 03:52:19', 1),
(745, 'login', NULL, '2018-12-06 04:02:48', 1),
(746, 'relatorio', 'duracaoTT', '2018-12-06 04:02:51', 1),
(747, 'relatorio', 'duracaoTT', '2018-12-06 04:03:39', 1),
(748, 'relatorio', 'duracaoTT', '2018-12-06 04:03:42', 1),
(749, 'login', NULL, '2018-12-06 04:04:43', 1),
(750, 'relatorio', 'duracaoTT', '2018-12-06 04:04:45', 1),
(751, 'login', NULL, '2018-12-06 04:05:45', 1),
(752, 'relatorio', 'duracaoTT', '2018-12-06 04:05:50', 1),
(753, 'listar', 'usuariosBloqueados', '2018-12-06 04:07:29', 1),
(754, 'login', 'logoff', '2018-12-06 04:07:47', 1),
(755, 'login', NULL, '2018-12-06 04:07:51', 2),
(756, 'listar', 'usuarios', '2018-12-06 04:07:53', 2),
(757, 'login', 'logoff', '2018-12-06 04:07:58', 2),
(758, 'login', NULL, '2018-12-06 04:08:01', 1),
(759, 'listar', 'usuariosBloqueados', '2018-12-06 04:08:02', 1),
(760, 'listar', 'usuarios', '2018-12-06 04:08:04', 1),
(761, 'usuario', 'bloquearUsuario', '2018-12-06 04:08:08', 1),
(762, 'listar', 'usuariosBloqueados', '2018-12-06 04:08:10', 1),
(763, 'login', NULL, '2018-12-06 04:20:54', 1),
(764, 'relatorio', 'errosLoginTckResolvido', '2018-12-06 04:20:58', 1),
(765, 'relatorio', 'errosLoginTckResolvido', '2018-12-06 04:21:47', 1),
(766, 'relatorio', 'errosLoginTckResolvido', '2018-12-06 04:22:24', 1),
(767, 'login', 'logoff', '2018-12-06 04:22:28', 1),
(768, 'login', NULL, '2018-12-06 04:22:33', 9),
(769, 'listar', 'clientes', '2018-12-06 04:22:38', 9),
(770, 'login', 'logoff', '2018-12-06 04:22:39', 9),
(771, 'login', NULL, '2018-12-06 04:22:42', 1),
(772, 'relatorio', 'errosLoginTckResolvido', '2018-12-06 04:22:44', 1),
(773, 'login', NULL, '2018-12-06 04:29:07', 1),
(774, 'login', 'logoff', '2018-12-06 04:29:15', 1),
(775, 'login', NULL, '2018-12-06 04:29:17', 2),
(776, 'listarTickets', 'todos', '2018-12-06 04:29:19', 2),
(777, 'ticket', 'mostrarTicket', '2018-12-06 04:29:21', 2),
(778, 'login', 'logoff', '2018-12-06 04:29:26', 2),
(779, 'login', NULL, '2018-12-06 04:29:28', 2),
(780, 'listarTickets', 'todos', '2018-12-06 04:29:29', 2),
(781, 'ticket', 'mostrarTicket', '2018-12-06 04:29:31', 2),
(782, 'listarTickets', 'todos', '2018-12-06 04:29:33', 2),
(783, 'ticket', 'mostrarTicket', '2018-12-06 04:29:34', 2),
(784, 'listarTickets', 'todos', '2018-12-06 04:29:39', 2),
(785, 'ticket', 'mostrarTicket', '2018-12-06 04:29:40', 2),
(786, 'listarTickets', 'todos', '2018-12-06 04:30:17', 2),
(787, 'ticket', 'mostrarTicket', '2018-12-06 04:30:18', 2),
(788, 'listarTickets', 'todos', '2018-12-06 04:30:21', 2),
(789, 'ticket', 'mostrarTicket', '2018-12-06 04:30:22', 2),
(790, 'login', 'logoff', '2018-12-06 04:30:28', 2),
(791, 'login', NULL, '2018-12-06 04:30:31', 1),
(792, 'listarTickets', 'todos', '2018-12-06 04:30:34', 1),
(793, 'ticket', 'mostrarTicket', '2018-12-06 04:30:35', 1),
(794, 'listarTickets', 'todos', '2018-12-06 04:30:40', 1),
(795, 'ticket', 'mostrarTicket', '2018-12-06 04:30:41', 1),
(796, 'thread', 'editaMensagemOperador', '2018-12-06 04:30:44', 1),
(797, 'thread', 'alterarMensagem', '2018-12-06 04:30:48', 1),
(798, 'login', NULL, '2018-12-06 04:30:52', 1),
(799, 'login', NULL, '2018-12-06 04:30:52', 2),
(800, 'listarTickets', 'todos', '2018-12-06 04:30:53', 2),
(801, 'ticket', 'mostrarTicket', '2018-12-06 04:30:55', 2),
(802, 'ticket', 'mostrarTicket', '2018-12-06 04:30:57', 2),
(803, 'ticket', 'mostrarTicket', '2018-12-06 04:31:00', 2),
(804, 'ticket', 'mostrarTicket', '2018-12-06 04:31:02', 2),
(805, 'ticket', 'mostrarTicket', '2018-12-06 04:31:04', 2),
(806, 'listarTickets', 'todos', '2018-12-06 04:32:52', 2),
(807, 'ticket', 'mostrarTicket', '2018-12-06 04:32:53', 2),
(808, 'listarTickets', 'todos', '2018-12-06 04:32:56', 2),
(809, 'ticket', 'mostrarTicket', '2018-12-06 04:32:57', 2),
(810, 'listarTickets', 'todos', '2018-12-06 04:33:00', 2),
(811, 'ticket', 'mostrarTicket', '2018-12-06 04:33:02', 2),
(812, 'listarTickets', 'todos', '2018-12-06 04:33:04', 2),
(813, 'ticket', 'mostrarTicket', '2018-12-06 04:33:05', 2),
(814, 'listarTickets', 'todos', '2018-12-06 04:33:12', 2),
(815, 'ticket', 'mostrarTicket', '2018-12-06 04:33:14', 2),
(816, 'listarTickets', 'todos', '2018-12-06 04:33:16', 2),
(817, 'ticket', 'mostrarTicket', '2018-12-06 04:33:17', 2),
(818, 'login', NULL, '2018-12-06 04:42:29', 1),
(819, 'listarTickets', 'todos', '2018-12-06 04:42:32', 1),
(820, 'ticket', 'mostrarTicket', '2018-12-06 04:42:34', 1),
(821, 'thread', 'editaMensagemOperador', '2018-12-06 04:42:40', 1),
(822, 'thread', 'alterarMensagem', '2018-12-06 04:42:45', 1),
(823, 'login', 'logoff', '2018-12-06 04:42:53', 1),
(824, 'login', NULL, '2018-12-06 04:56:30', 18),
(825, 'novaSenha', NULL, '2018-12-06 04:56:37', 18),
(826, 'login', 'logoff', '2018-12-06 04:57:29', 18),
(827, 'login', NULL, '2018-12-06 11:16:24', 2),
(828, 'listarTickets', 'Fechado', '2018-12-06 11:16:29', 2),
(829, 'listarTickets', 'Aberto', '2018-12-06 11:16:32', 2),
(830, 'listarTickets', 'Aberto', '2018-12-06 11:17:13', 2),
(831, 'listarTickets', 'Fechado', '2018-12-06 11:17:15', 2),
(832, 'listarTickets', 'todos', '2018-12-06 11:17:17', 2),
(833, 'listarTickets', 'Fechado', '2018-12-06 11:21:28', 2),
(834, 'listarTickets', 'Aberto', '2018-12-06 11:21:39', 2),
(835, 'listarTickets', 'todos', '2018-12-06 11:21:40', 2),
(836, 'login', NULL, '2018-12-06 11:24:51', 2),
(837, 'relatorio', 'ticketsClienteSemResposta', '2018-12-06 11:24:55', 2),
(838, 'relatorio', 'ticketSemResp', '2018-12-06 11:25:32', 2),
(839, 'login', NULL, '2018-12-06 11:26:51', 2),
(840, 'relatorio', 'ticketSemResp', '2018-12-06 11:26:56', 2),
(841, 'login', NULL, '2018-12-06 11:29:28', 2),
(842, 'relatorio', 'ticketSemResp', '2018-12-06 11:29:32', 2),
(843, 'login', NULL, '2018-12-06 11:32:08', 2),
(844, 'relatorio', 'ticketsClienteSemResposta', '2018-12-06 11:32:12', 2),
(846, 'login', NULL, '2018-12-06 11:34:10', 2),
(847, 'relatorio', 'ticketSemResp', '2018-12-06 11:34:13', 2),
(848, 'ticket', 'mostrarTicket', '2018-12-06 11:34:40', 2),
(849, 'login', NULL, '2018-12-06 11:35:21', 2),
(850, 'relatorio', 'listaUsuarios', '2018-12-06 11:35:23', 2),
(851, 'relatorio', 'clienteEmpresa', '2018-12-06 11:35:45', 2),
(852, 'relatorio', 'listaUsuarios', '2018-12-06 11:38:59', 2),
(853, 'relatorio', 'ticketsClienteSemResposta', '2018-12-06 11:39:01', 2),
(854, 'relatorio', 'ticketSemResp', '2018-12-06 11:39:05', 2),
(855, 'listarTickets', 'todos', '2018-12-06 11:39:42', 2),
(856, 'topico', 'listarTopicos', '2018-12-06 11:39:44', 2),
(857, 'topico', 'mostrarTopico', '2018-12-06 11:39:55', 2),
(858, 'listar', 'clientes', '2018-12-06 11:40:07', 2),
(859, 'listar', 'empresas', '2018-12-06 11:40:21', 2),
(860, 'listar', 'usuarios', '2018-12-06 11:40:29', 2),
(861, 'login', NULL, '2018-12-06 15:54:03', 2),
(862, 'listarTickets', 'Aberto', '2018-12-06 15:54:07', 2),
(863, 'ticket', 'mostrarTicket', '2018-12-06 15:54:42', 2),
(864, 'responderThread', NULL, '2018-12-06 15:54:46', 2),
(865, 'respostaPostagemThread', 'ticket', '2018-12-06 15:54:52', 2),
(866, 'login', NULL, '2018-12-06 15:58:22', 2),
(867, 'listarTickets', 'todos', '2018-12-06 15:58:26', 2),
(868, 'ticket', 'mostrarTicket', '2018-12-06 15:58:34', 2),
(869, 'responderThread', NULL, '2018-12-06 15:58:37', 2),
(870, 'login', NULL, '2018-12-06 15:59:42', 2),
(871, 'login', NULL, '2018-12-06 16:00:07', 2),
(872, 'login', NULL, '2018-12-06 16:00:45', 2),
(873, 'listarTickets', 'todos', '2018-12-06 16:00:48', 2),
(874, 'ticket', 'mostrarTicket', '2018-12-06 16:00:55', 2),
(875, 'responderThread', NULL, '2018-12-06 16:00:57', 2),
(876, 'login', NULL, '2018-12-06 16:02:09', 2),
(877, 'listarTickets', 'todos', '2018-12-06 16:02:11', 2),
(878, 'ticket', 'mostrarTicket', '2018-12-06 16:02:19', 2),
(879, 'responderThread', NULL, '2018-12-06 16:02:20', 2),
(880, 'respostaPostagemThread', 'ticket', '2018-12-06 16:02:25', 2),
(881, 'login', NULL, '2018-12-06 16:05:45', 2),
(882, 'listarTickets', 'todos', '2018-12-06 16:05:47', 2),
(883, 'ticket', 'mostrarTicket', '2018-12-06 16:05:53', 2),
(884, 'responderThread', NULL, '2018-12-06 16:05:55', 2),
(885, 'respostaPostagemThread', 'ticket', '2018-12-06 16:05:58', 2),
(886, 'login', NULL, '2018-12-06 16:07:38', 2),
(887, 'listarTickets', 'todos', '2018-12-06 16:07:42', 2),
(888, 'ticket', 'mostrarTicket', '2018-12-06 16:07:48', 2),
(889, 'responderThread', NULL, '2018-12-06 16:07:51', 2),
(890, 'respostaPostagemThread', 'ticket', '2018-12-06 16:07:54', 2),
(891, 'login', NULL, '2018-12-06 16:09:57', 2),
(892, 'listarTickets', 'todos', '2018-12-06 16:10:00', 2),
(893, 'ticket', 'mostrarTicket', '2018-12-06 16:10:13', 2),
(894, 'responderPostagemThread', NULL, '2018-12-06 16:10:14', 2),
(895, 'responderThread', NULL, '2018-12-06 16:10:16', 2),
(896, 'respostaPostagemThread', 'ticket', '2018-12-06 16:10:19', 2),
(897, 'login', NULL, '2018-12-06 16:11:31', 2),
(898, 'listarTickets', 'todos', '2018-12-06 16:11:33', 2),
(899, 'ticket', 'mostrarTicket', '2018-12-06 16:11:38', 2),
(900, 'responderThread', NULL, '2018-12-06 16:11:40', 2),
(901, 'respostaPostagemThread', 'ticket', '2018-12-06 16:11:43', 2),
(902, 'login', NULL, '2018-12-06 16:14:35', 2),
(903, 'listarTickets', 'todos', '2018-12-06 16:14:38', 2),
(904, 'ticket', 'mostrarTicket', '2018-12-06 16:14:46', 2),
(905, 'responderThread', NULL, '2018-12-06 16:14:48', 2),
(906, 'respostaPostagemThread', 'ticket', '2018-12-06 16:14:50', 2),
(907, 'login', NULL, '2018-12-06 16:15:30', 2),
(908, 'listarTickets', 'todos', '2018-12-06 16:15:32', 2),
(909, 'ticket', 'mostrarTicket', '2018-12-06 16:15:40', 2),
(910, 'responderThread', NULL, '2018-12-06 16:15:42', 2),
(911, 'respostaPostagemThread', 'ticket', '2018-12-06 16:15:45', 2),
(912, 'login', NULL, '2018-12-06 16:17:42', 2),
(913, 'listarTickets', 'todos', '2018-12-06 16:17:44', 2),
(914, 'ticket', 'mostrarTicket', '2018-12-06 16:17:50', 2),
(915, 'responderThread', NULL, '2018-12-06 16:17:52', 2),
(916, 'login', NULL, '2018-12-06 16:22:18', 2),
(917, 'listarTickets', 'todos', '2018-12-06 16:22:20', 2),
(918, 'ticket', 'mostrarTicket', '2018-12-06 16:22:26', 2),
(919, 'responderThread', NULL, '2018-12-06 16:22:29', 2),
(920, 'respostaPostagemThread', 'ticket', '2018-12-06 16:22:33', 2),
(921, 'login', NULL, '2018-12-06 16:27:20', 2),
(922, 'listarTickets', 'todos', '2018-12-06 16:27:23', 2),
(923, 'ticket', 'mostrarTicket', '2018-12-06 16:27:29', 2),
(924, 'responderThread', NULL, '2018-12-06 16:27:31', 2),
(925, 'respostaPostagemThread', 'ticket', '2018-12-06 16:27:37', 2),
(926, 'login', NULL, '2018-12-06 16:42:05', 2),
(927, 'listarTickets', 'todos', '2018-12-06 16:42:09', 2),
(928, 'ticket', 'mostrarTicket', '2018-12-06 16:42:12', 2),
(929, 'relatorio', 'clienteEmpresa', '2018-12-06 16:42:31', 2),
(930, 'relatorio', 'listaUsuarios', '2018-12-06 16:42:37', 2),
(931, 'relatorio', 'ticketSemResp', '2018-12-06 16:42:39', 2),
(932, 'relatorio', 'qtdTicketsCliente', '2018-12-06 16:42:44', 2),
(933, 'login', NULL, '2018-12-06 19:38:39', 2),
(934, 'relatorio', 'ticketsClienteSemResposta', '2018-12-06 19:38:42', 2),
(935, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:38:45', 2),
(936, 'login', NULL, '2018-12-06 19:50:02', 2),
(937, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:50:03', 2),
(938, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 19:50:07', 2),
(939, 'relatorio', 'ticketSemResp', '2018-12-06 19:50:28', 2),
(940, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:50:30', 2),
(941, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 19:50:32', 2),
(942, 'login', NULL, '2018-12-06 19:54:50', 2),
(943, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:54:52', 2),
(944, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 19:54:55', 2),
(945, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:54:57', 2),
(946, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 19:55:10', 2),
(947, 'relatorio', 'ticketSemResp', '2018-12-06 19:55:18', 2),
(948, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:55:20', 2),
(949, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 19:56:13', 2),
(950, 'login', NULL, '2018-12-06 19:56:54', 2),
(951, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:56:57', 2),
(952, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 19:57:09', 2),
(953, 'login', NULL, '2018-12-06 19:57:52', 2),
(954, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:57:56', 2),
(955, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 19:58:10', 2),
(956, 'login', 'logoff', '2018-12-06 19:58:32', 2),
(957, 'login', NULL, '2018-12-06 19:59:00', 15),
(958, 'listarTickets', 'user', '2018-12-06 19:59:03', 15),
(959, 'ticket', 'mostrarTicket', '2018-12-06 19:59:05', 15),
(960, 'thread', 'reabrir', '2018-12-06 19:59:07', 15),
(961, 'login', 'logoff', '2018-12-06 19:59:09', 15),
(962, 'login', NULL, '2018-12-06 19:59:11', 2),
(963, 'relatorio', 'qtdTicketsCliente', '2018-12-06 19:59:13', 2),
(964, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 19:59:16', 2),
(965, 'login', NULL, '2018-12-06 20:00:11', 2),
(966, 'relatorio', 'qtdTicketsCliente', '2018-12-06 20:00:16', 2),
(967, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 20:00:19', 2),
(968, 'relatorio', 'pesquisaClienteQtd', '2018-12-06 20:00:22', 2),
(969, 'login', NULL, '2018-12-06 20:12:57', 15),
(970, 'listarTickets', 'user', '2018-12-06 20:12:59', 15),
(971, 'ticket', 'mostrarTicket', '2018-12-06 20:13:01', 15),
(972, 'thread', 'reabrir', '2018-12-06 20:13:04', 15),
(973, 'login', NULL, '2018-12-06 20:15:50', 15),
(974, 'listarTickets', 'user', '2018-12-06 20:15:52', 15),
(975, 'ticket', 'mostrarTicket', '2018-12-06 20:15:53', 15),
(976, 'ticket', 'ticketRespondido', '2018-12-06 20:15:55', 15),
(977, 'ticket', 'mostrarTicket', '2018-12-06 20:15:56', 15),
(978, 'ticket', 'ticketRespondido', '2018-12-06 20:15:58', 15),
(979, 'ticket', 'mostrarTicket', '2018-12-06 20:15:59', 15),
(980, 'thread', 'reabrir', '2018-12-06 20:16:00', 15),
(981, 'ticket', 'mostrarTicket', '2018-12-06 20:16:01', 15),
(982, 'thread', 'reabrir', '2018-12-06 20:16:02', 15),
(983, 'ticket', 'mostrarTicket', '2018-12-06 20:16:17', 15),
(984, 'ticket', 'ticketRespondido', '2018-12-06 20:16:18', 15),
(985, 'ticket', 'mostrarTicket', '2018-12-06 20:16:20', 15),
(986, 'thread', 'reabrir', '2018-12-06 20:16:21', 15),
(987, 'login', NULL, '2018-12-06 20:19:08', 15),
(988, 'listarTickets', 'user', '2018-12-06 20:19:10', 15),
(989, 'ticket', 'mostrarTicket', '2018-12-06 20:19:15', 15),
(990, 'ticket', 'ticketRespondido', '2018-12-06 20:19:17', 15),
(991, 'ticket', 'mostrarTicket', '2018-12-06 20:19:18', 15),
(992, 'ticket', 'ticketRespondido', '2018-12-06 20:19:20', 15),
(993, 'ticket', 'mostrarTicket', '2018-12-06 20:19:21', 15),
(994, 'thread', 'reabrir', '2018-12-06 20:19:23', 15),
(995, 'ticket', 'mostrarTicket', '2018-12-06 20:19:24', 15),
(996, 'thread', 'reabrir', '2018-12-06 20:19:25', 15),
(997, 'login', 'logoff', '2018-12-06 20:20:19', 15),
(998, 'login', NULL, '2018-12-06 20:20:22', 2),
(999, 'relatorio', 'ticketsClienteSemResposta', '2018-12-06 20:20:24', 2);

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
  `thread_dataAlteracao` timestamp NULL DEFAULT NULL,
  `thread_usuarioEdicao` varchar(100) DEFAULT NULL,
  `topico_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `threads`
--

INSERT INTO `threads` (`thread_id`, `thread_mensagem`, `thread_autor`, `thread_autorPergunta`, `thread_dataPostagem`, `thread_dataAlteracao`, `thread_usuarioEdicao`, `topico_id`, `ticket_id`, `usuario_id`) VALUES
(29, 'from the other side', 'memo', 1, '2018-12-04 12:42:00', NULL, NULL, NULL, 11, 11),
(30, 'aqui estou testando tudo', 'memo', 1, '2018-12-04 12:44:00', NULL, NULL, 16, NULL, 11),
(31, 'esse Ã© um superteste', 'oioi', 1, '2018-12-04 12:47:00', NULL, NULL, 17, NULL, 15),
(32, 'esse Ã© um superteste', 'memo', 1, '2018-12-04 12:47:00', NULL, NULL, 18, NULL, 11),
(40, 'teste', 'memo', 1, '2018-12-04 13:59:51', NULL, NULL, 18, NULL, 11),
(41, 'teste', 'operador', 0, '2018-12-04 14:01:18', NULL, NULL, NULL, 11, 2),
(42, '@memo oi testeee', 'operador', 0, '2018-12-04 14:01:24', '2018-12-06 04:30:48', 'admin', NULL, 11, 2),
(43, '@memo oqweqweqweq', 'operador', 0, '2018-12-04 14:06:17', '2018-12-06 04:42:45', 'admin', NULL, 11, 2),
(44, '@operador teste', 'operador', 0, '2018-12-04 21:30:51', NULL, NULL, NULL, 11, 2),
(45, 'teste', 'memo', 1, '2018-12-04 21:33:48', NULL, NULL, 18, NULL, 11),
(46, '@memo oi', 'operador', 0, '2018-12-04 21:36:19', NULL, NULL, 18, NULL, 2),
(47, 'teste', 'operador', 0, '2018-12-04 21:37:35', NULL, NULL, NULL, 11, 2),
(48, '@operador qqqq', 'operador', 0, '2018-12-04 21:40:47', NULL, NULL, NULL, 11, 2),
(49, '', 'usuarioTeste', 1, '2018-12-04 21:44:00', NULL, NULL, 22, NULL, 14),
(50, '@usuarioTeste', 'usuarioTeste', 1, '2018-12-04 21:44:28', NULL, NULL, 22, NULL, 14),
(51, 'teste', 'operador', 0, '2018-12-04 22:56:39', NULL, NULL, 22, NULL, 2),
(52, 'qqqqqq', 'operador', 0, '2018-12-04 22:57:31', NULL, NULL, 22, NULL, 2),
(54, '@operador qq', 'operador', 0, '2018-12-04 22:57:47', NULL, NULL, 22, NULL, 2),
(55, '@operador qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 22:58:29', NULL, NULL, 22, NULL, 2),
(56, 'qq', 'operador', 0, '2018-12-04 22:58:47', NULL, NULL, 22, NULL, 2),
(57, 'qqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 22:59:25', NULL, NULL, 18, NULL, 2),
(58, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:01:31', NULL, NULL, 16, NULL, 2),
(59, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:03:57', NULL, NULL, 16, NULL, 2),
(60, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:06:26', NULL, NULL, 16, NULL, 2),
(61, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:06:30', NULL, NULL, 16, NULL, 2),
(62, '@operador qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 'operador', 0, '2018-12-04 23:06:37', NULL, NULL, 16, NULL, 2),
(63, 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 'operador', 0, '2018-12-04 23:06:41', NULL, NULL, 16, NULL, 2),
(64, 'aa', 'admin', 0, '2018-12-05 01:55:17', NULL, NULL, NULL, 11, 1),
(65, 'eoq', 'operadorTeste', 0, '2018-12-05 01:59:48', NULL, NULL, NULL, 11, 17),
(66, 'wwwwwwwwww', 'oioi', 1, '2018-12-05 02:16:00', NULL, NULL, NULL, 13, 15),
(67, '@oioi teste', 'oioi', 1, '2018-12-05 02:16:52', NULL, NULL, NULL, 13, 15),
(68, '@oioi q foi', 'operador', 0, '2018-12-05 02:17:07', NULL, NULL, NULL, 13, 2),
(69, 'ausdhaisrhweifgqcf2gefkqehqiedcqd', 'oioi', 1, '2018-12-05 03:04:00', NULL, NULL, NULL, 14, 15),
(70, '@oioi rwarw', 'operadorTeste', 0, '2018-12-05 03:05:14', '2018-12-05 20:31:16', 'admin', NULL, 14, 17),
(71, '@memo essa e a resposta', 'operadorTeste', 0, '2018-12-05 03:58:40', NULL, NULL, NULL, 11, 17),
(72, '@memo oioi', 'admin', 0, '2018-12-05 18:30:42', NULL, NULL, NULL, 11, 1),
(73, 'qwerty', 'admin', 0, '2018-12-05 18:31:06', NULL, NULL, NULL, 11, 1),
(74, 'asudhauisdhausd', 'memo', 1, '2018-12-05 21:44:00', NULL, NULL, NULL, 15, 11),
(75, '@memo teste admin', 'operador', 0, '2018-12-05 21:46:16', '2018-12-05 23:32:42', 'admin', NULL, 15, 2),
(76, '@operador oi', 'usuarioTeste', 1, '2018-12-05 21:53:24', NULL, NULL, 22, NULL, 14),
(77, 'oi', 'usuarioTeste', 1, '2018-12-05 21:53:33', NULL, NULL, 22, NULL, 14),
(78, 'aqui estou testando tudo', 'usuarioTeste', 1, '2018-12-05 22:05:00', NULL, NULL, 24, NULL, 14),
(79, 'aasdatetea', 'usuarioTeste', 1, '2018-12-05 22:05:00', NULL, NULL, 25, NULL, 14),
(80, 'asdasd', 'memo', 1, '2018-12-05 22:08:00', NULL, NULL, NULL, 16, 11),
(81, '234123123', 'memo', 1, '2018-12-05 22:17:00', NULL, NULL, NULL, 17, 11),
(82, 'lalallalalaa', 'usuarioTeste', 1, '2018-12-06 02:44:00', NULL, NULL, 26, NULL, 14),
(83, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 15:58:03', NULL, NULL, NULL, 15, 2),
(84, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 16:04:00', NULL, NULL, NULL, 15, 2),
(85, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 16:07:18', NULL, NULL, NULL, 15, 2),
(86, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 16:08:02', NULL, NULL, NULL, 15, 2),
(87, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 16:10:32', NULL, NULL, NULL, 15, 2),
(88, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 16:11:50', NULL, NULL, NULL, 15, 2),
(89, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 16:15:09', NULL, NULL, NULL, 15, 2),
(90, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 16:16:04', NULL, NULL, NULL, 15, 2),
(91, 'Ã¡Ã©Ã­Ã³Ãº', 'operador', 0, '2018-12-06 16:22:53', NULL, NULL, NULL, 15, 2),
(92, 'Ã©Ã­Ã³ÃºÃ¡', 'operador', 0, '2018-12-06 16:28:14', NULL, NULL, NULL, 15, 2);

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
(13, 'qqqqqqqqq', 'Completo', '2018-12-05 02:16:34', '2018-12-05 02:16:34', 'Aberto', 'Nao', 15),
(14, 'segundo teste', 'Completo', '2018-12-05 03:04:34', '2018-12-05 03:04:34', 'Aberto', 'Nao', 15),
(15, 'qualquer coisa', 'Completo', '2018-12-05 21:44:27', '2018-12-05 21:44:27', 'Aberto', 'Nao', 11),
(16, 'sdasdasd', 'Completo', '2018-12-05 22:07:47', '2018-12-05 22:07:47', 'Aberto', 'Nao', 11),
(17, 'teste', 'Completo', '2018-12-02 22:10:52', '2018-12-05 22:17:44', 'Aberto', 'Nao', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `topicos`
--

CREATE TABLE `topicos` (
  `topico_id` int(11) NOT NULL,
  `topico_titulo` varchar(50) DEFAULT NULL,
  `topico_status` varchar(20) NOT NULL,
  `topico_dataCriacao` timestamp NULL DEFAULT NULL,
  `topico_dataTermino` timestamp NULL DEFAULT NULL,
  `topico_situacao` varchar(50) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `topicos`
--

INSERT INTO `topicos` (`topico_id`, `topico_titulo`, `topico_status`, `topico_dataCriacao`, `topico_dataTermino`, `topico_situacao`, `usuario_id`) VALUES
(14, NULL, 'Incompleto', '2018-12-04 02:00:00', NULL, NULL, 11),
(15, NULL, 'Incompleto', '2018-12-04 02:00:00', NULL, NULL, 11),
(16, 'olaaa', 'Completo', '2018-12-04 02:00:00', '2018-12-04 02:00:00', 'Aberto', 11),
(17, 'olaaa', 'Completo', '2018-12-04 02:00:00', '2018-12-04 02:00:00', 'Fechado', 15),
(18, 'teste usuario', 'Completo', '2018-12-04 02:00:00', '2018-12-04 02:00:00', 'Fechado', 11),
(19, NULL, 'Incompleto', '2018-12-04 02:00:00', NULL, NULL, 11),
(20, NULL, 'Incompleto', '2018-12-04 02:00:00', NULL, NULL, 14),
(21, NULL, 'Incompleto', '2018-12-04 02:00:00', NULL, NULL, 14),
(22, '', 'Completo', '2018-12-04 02:00:00', '2018-12-04 02:00:00', 'Aberto', 14),
(23, NULL, 'Incompleto', '2018-12-05 02:00:00', NULL, NULL, 11),
(24, 'olaaa', 'Completo', '2018-12-05 02:00:00', '2018-12-05 02:00:00', 'Aberto', 14),
(25, 'tesaetaet', 'Completo', '2018-12-05 02:00:00', '2018-12-05 02:00:00', 'Aberto', 14),
(26, 'lallalalal', 'Completo', '2018-12-06 02:44:26', '2018-12-06 02:44:46', 'Aberto', 14);

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
  `usuario_ticketsReabertos` int(11) DEFAULT '0',
  `usuario_bloqueado` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_nomeConta`, `usuario_senha`, `usuario_tipoAcesso`, `usuario_dataDeCadastro`, `usuario_dataDeAlteracao`, `usuario_apelido`, `usuario_errosLogin`, `usuario_ticketResolvidos`, `usuario_ticketsReabertos`, `usuario_bloqueado`) VALUES
(1, 'admin', '123', 'Administrador', '1996-11-18', NULL, NULL, 3, 0, 0, 0),
(2, 'operador', '123', 'Operador', '1996-11-18', NULL, NULL, 3, 9, 0, 0),
(9, 'TesteTeste', '123', 'Operador', '2018-10-30', NULL, NULL, 0, 10, 0, 0),
(10, 'OiOiOi', '123', 'Cliente', '2018-10-30', '2018-11-05', NULL, 0, 0, 0, 0),
(11, 'memo', '123', 'Cliente', '2018-10-30', NULL, NULL, 2, 0, 0, 0),
(14, 'usuarioTeste', '123', 'Usuario', '2018-10-30', '2018-11-04', NULL, 0, 0, 0, 0),
(15, 'oioi', '123', 'Cliente', '2018-11-05', '2018-12-04', NULL, 6, 0, 3, 0),
(16, 'CidadeDeDeus', '123', 'Cliente', '2018-12-03', '2018-12-04', NULL, 1, 0, 0, 1),
(17, 'operadorTeste', '123', 'Operador', '2018-12-04', NULL, NULL, 1, 5, 0, 0),
(18, 'testedoteste', '123456789@', 'Usuario', '2018-12-06', NULL, NULL, 0, 0, 0, 0);

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
  MODIFY `acao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;

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
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `topicos`
--
ALTER TABLE `topicos`
  MODIFY `topico_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ufs`
--
ALTER TABLE `ufs`
  MODIFY `uf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
