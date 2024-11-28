-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/11/2024 às 15:52
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `livia`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`BREID`@`%` PROCEDURE `PesquisaParaGerarRelatorio` ()   BEGIN
        SELECT   
            e.nome AS evento,  
            COUNT(DISTINCT i.participante_id) AS total_participantes,  
            COUNT(c.id) AS total_certificados  
        FROM eventos e  
        LEFT JOIN inscricoes i ON e.id = i.evento_id  
        LEFT JOIN atividades a ON e.id = a.evento_id  
        LEFT JOIN certificados c ON a.id = c.atividade_id  
        GROUP BY e.id;  
    END$$

CREATE DEFINER=`BREID`@`%` PROCEDURE `Procedurecertificado` ()   BEGIN
        SELECT   
            e.nome AS evento,  
            COUNT(DISTINCT i.participante_id) AS total_participantes,  
            COUNT(c.id) AS total_certificados  
        FROM eventos e  
        LEFT JOIN inscricoes i ON e.id = i.evento_id  
        LEFT JOIN atividades a ON e.id = a.evento_id  
        LEFT JOIN certificados c ON a.id = c.atividade_id  
        GROUP BY e.id;  
    END$$

CREATE DEFINER=`BREID`@`%` PROCEDURE `proceOpa` ()   BEGIN
        SELECT   
            e.nome AS evento,  
            COUNT(DISTINCT i.participante_id) AS total_participantes,  
            COUNT(c.id) AS total_certificados  
        FROM eventos e  
        LEFT JOIN inscricoes i ON e.id = i.evento_id  
        LEFT JOIN atividades a ON e.id = a.evento_id  
        LEFT JOIN certificados c ON a.id = c.atividade_id  
        GROUP BY e.id;  
    END$$

CREATE DEFINER=`BREID`@`%` PROCEDURE `ProcePesquisa` ()   BEGIN
        SELECT   
            e.nome AS evento,  
            COUNT(DISTINCT i.participante_id) AS total_participantes,  
            COUNT(c.id) AS total_certificados  
        FROM eventos e  
        LEFT JOIN inscricoes i ON e.id = i.evento_id  
        LEFT JOIN atividades a ON e.id = a.evento_id  
        LEFT JOIN certificados c ON a.id = c.atividade_id  
        GROUP BY e.id;  
    END$$

CREATE DEFINER=`BREID`@`%` PROCEDURE `ProcePesquisaFresca` ()   BEGIN
        SELECT   
            e.nome AS evento,  
            COUNT(DISTINCT i.participante_id) AS total_participantes,  
            COUNT(c.id) AS total_certificados  
        FROM eventos e  
        LEFT JOIN inscricoes i ON e.id = i.evento_id  
        LEFT JOIN atividades a ON e.id = a.evento_id  
        LEFT JOIN certificados c ON a.id = c.atividade_id  
        GROUP BY e.id;  
    END$$

CREATE DEFINER=`BREID`@`%` PROCEDURE `ProcepesquiTri` ()   BEGIN
        SELECT   
            e.nome AS evento,  
            COUNT(DISTINCT i.participante_id) AS total_participantes,  
            COUNT(c.id) AS total_certificados  
        FROM eventos e  
        LEFT JOIN inscricoes i ON e.id = i.evento_id  
        LEFT JOIN atividades a ON e.id = a.evento_id  
        LEFT JOIN certificados c ON a.id = c.atividade_id  
        GROUP BY e.id;  
    END$$

CREATE DEFINER=`BREID`@`%` PROCEDURE `RelatorioConsolidadoParticipantesCertificados5` ()   BEGIN
        SELECT   
            e.nome AS evento,  
            COUNT(DISTINCT i.participante_id) AS total_participantes,  
            COUNT(c.id) AS total_certificados  
        FROM eventos e  
        LEFT JOIN inscricoes i ON e.id = i.evento_id  
        LEFT JOIN certificados c ON i.evento_id = c.evento_id  
        GROUP BY e.id;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividades`
--

CREATE TABLE `atividades` (
  `id` int(11) NOT NULL,
  `evento_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `horario_inicio` time NOT NULL,
  `horario_fim` time NOT NULL,
  `max_participantes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atividades`
--

INSERT INTO `atividades` (`id`, `evento_id`, `titulo`, `descricao`, `tipo_id`, `data`, `horario_inicio`, `horario_fim`, `max_participantes`) VALUES
(1, 1, 'Show de Abertura', 'Show de abertura com bandas locais.', 9, '2024-05-01', '10:00:00', '12:00:00', 500),
(2, 1, 'Keynote sobre IA', 'Palestra sobre inteligência artificial.', 1, '2024-06-15', '09:00:00', '10:30:00', 200),
(3, 1, 'Aula de Culinária', 'Aprenda a fazer pratos tradicionais.', 6, '2024-07-20', '14:00:00', '16:00:00', 30),
(4, 4, 'Palestra sobre Saúde Mental', 'Discussão sobre saúde mental.', 1, '2024-08-10', '10:00:00', '11:30:00', 100),
(5, 5, 'Oficina de Empreendedorismo', 'Como abrir seu próprio negócio.', 2, '2024-09-05', '09:00:00', '12:00:00', 50),
(6, 6, 'Exposição de Arte Moderna', 'Exposição de obras de arte moderna.', 5, '2024-10-12', '10:00:00', '20:00:00', 100),
(7, 7, 'Debate sobre Sustentabilidade', 'Debate sobre práticas sustentáveis.', 3, '2024-11-02', '14:00:00', '16:00:00', 80),
(8, 8, 'Competição de Futebol', 'Torneio entre equipes amadoras.', 9, '2024-12-01', '09:00:00', '18:00:00', 200),
(9, 9, 'Exibição de Curtas', 'Mostra de curtas-metragens.', 4, '2024-11-15', '19:00:00', '21:00:00', 150),
(10, 10, 'Workshop de Educação Inclusiva', 'Oficina sobre inclusão na educação.', 2, '2024-11-25', '08:00:00', '12:00:00', 40);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(8, 'Ciência'),
(1, 'Cultura'),
(2, 'Educação'),
(7, 'Entretenimento'),
(5, 'Esportes'),
(9, 'Gastronomia'),
(6, 'Negócios'),
(4, 'Saúde'),
(10, 'Sustentabilidade'),
(3, 'Tecnologia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `certificados`
--

CREATE TABLE `certificados` (
  `id` int(11) NOT NULL,
  `participante_id` int(11) NOT NULL,
  `atividade_id` int(11) NOT NULL,
  `data_emissao` datetime NOT NULL,
  `codigo_validade` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `certificados`
--

INSERT INTO `certificados` (`id`, `participante_id`, `atividade_id`, `data_emissao`, `codigo_validade`, `status`) VALUES
(1, 5, 1, '2024-11-10 00:00:00', 'A1B2C3D4E5', 'concluída'),
(2, 12, 2, '2024-11-11 00:00:00', 'F6G7H8I9J0', NULL),
(3, 18, 2, '2024-11-12 00:00:00', 'K1L2M3N4O5', NULL),
(4, 20, 4, '2024-11-13 00:00:00', 'P6Q7R8S9T0', NULL),
(5, 25, 1, '2024-11-14 00:00:00', 'U1V2W3X4Y5', NULL),
(6, 30, 5, '2024-11-15 00:00:00', 'Z6A7B8C9D0', NULL),
(7, 8, 6, '2024-11-16 00:00:00', 'E1F2G3H4I5', NULL),
(8, 15, 1, '2024-11-17 00:00:00', 'J6K7L8M9N0', NULL),
(9, 28, 4, '2024-11-18 00:00:00', 'O1P2Q3R4S5', NULL),
(10, 33, 2, '2024-11-19 00:00:00', 'T6U7V8W9X0', NULL),
(11, 9, 3, '2024-11-20 00:00:00', 'Y1Z2A3B4C5', NULL),
(12, 22, 7, '2024-11-21 00:00:00', 'D6E7F8G9H0', NULL),
(13, 35, 4, '2024-11-22 00:00:00', 'I1J2K3L4M5', NULL),
(14, 11, 1, '2024-11-23 00:00:00', 'N6O7P8Q9R0', NULL),
(15, 19, 5, '2024-11-24 00:00:00', 'S1T2U3V4W5', NULL),
(16, 23, 3, '2024-11-25 00:00:00', 'X6Y7Z8A9B0', NULL),
(17, 40, 3, '2024-11-26 00:00:00', 'C1D2E3F4G5', NULL),
(18, 31, 1, '2024-11-27 00:00:00', 'H6I7J8K9L0', NULL),
(19, 7, 1, '2024-11-28 00:00:00', 'M1N2O3P4Q5', NULL),
(20, 14, 2, '2024-11-29 00:00:00', 'R6S7T8U9V0', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `local` varchar(255) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `total_participantes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `eventos`
--

INSERT INTO `eventos` (`id`, `nome`, `descricao`, `data_inicio`, `data_fim`, `local`, `categoria_id`, `total_participantes`) VALUES
(1, 'Festival de Música', 'Um festival de música ao ar livre.', '2024-05-01 10:00:00', '2024-05-01 22:00:00', 'Parque Central', 1, 0),
(2, 'Seminário de Tecnologia', 'Discussões sobre as últimas tendências em tecnologia.', '2024-06-15 09:00:00', '2024-06-15 17:00:00', 'Centro de Convenções', 3, 30),
(3, 'Workshop de Culinária', 'Aprenda a cozinhar pratos típicos.', '2024-07-20 14:00:00', '2024-07-20 18:00:00', 'Escola de Culinária', 9, 0),
(4, 'Conferência de Saúde', 'Palestras sobre saúde e bem-estar.', '2024-08-10 08:00:00', '2024-08-10 16:00:00', 'Auditório Principal', 4, 0),
(5, 'Maratona de Negócios', 'Networking para empreendedores.', '2024-09-05 08:00:00', '2024-09-05 20:00:00', 'Hotel Lux', 6, 0),
(6, 'Exposição de Arte', 'Exposição de artistas locais.', '2024-10-12 10:00:00', '2024-10-12 20:00:00', 'Galeria de Arte', 1, 0),
(7, 'Fórum de Sustentabilidade', 'Debates sobre práticas sustentáveis.', '2024-11-02 09:00:00', '2024-11-02 17:00:00', 'Universidade Verde', 10, 0),
(8, 'Copa de Futebol', 'Torneio de futebol amador.', '2024-12-01 09:00:00', '2024-12-01 18:00:00', 'Estádio Municipal', 5, 13),
(9, 'Festival de Cinema', 'Mostra de curtas e longas-metragens.', '2024-11-15 19:00:00', '2024-11-15 23:00:00', 'Cine Teatro', 1, 0),
(10, 'Congresso de Educação', 'Discussão sobre inovações na educação.', '2024-11-25 08:00:00', '2024-11-25 18:00:00', 'Centro Educacional', 2, 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `inscricoes`
--

CREATE TABLE `inscricoes` (
  `id` int(11) NOT NULL,
  `participante_id` int(11) NOT NULL,
  `evento_id` int(11) NOT NULL,
  `data_inscricao` datetime NOT NULL,
  `status_pagamento` enum('pago','pendente','isento') NOT NULL,
  `forma_pagamento` enum('cartão','boleto','outro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `inscricoes`
--

INSERT INTO `inscricoes` (`id`, `participante_id`, `evento_id`, `data_inscricao`, `status_pagamento`, `forma_pagamento`) VALUES
(16, 39, 1, '0000-00-00 00:00:00', 'pago', ''),
(17, 39, 2, '0000-00-00 00:00:00', 'pago', ''),
(18, 39, 5, '0000-00-00 00:00:00', 'pago', ''),
(19, 39, 6, '0000-00-00 00:00:00', 'pago', ''),
(20, 38, 1, '0000-00-00 00:00:00', 'pago', ''),
(21, 38, 2, '0000-00-00 00:00:00', 'pago', ''),
(22, 38, 5, '0000-00-00 00:00:00', 'pago', ''),
(23, 38, 6, '0000-00-00 00:00:00', 'pago', ''),
(24, 37, 1, '0000-00-00 00:00:00', 'pago', ''),
(25, 36, 1, '0000-00-00 00:00:00', 'pago', ''),
(26, 35, 1, '0000-00-00 00:00:00', 'pago', ''),
(27, 34, 1, '0000-00-00 00:00:00', 'pago', ''),
(28, 33, 1, '0000-00-00 00:00:00', 'pago', ''),
(29, 32, 1, '0000-00-00 00:00:00', 'pago', ''),
(30, 31, 1, '0000-00-00 00:00:00', 'pago', ''),
(31, 30, 1, '0000-00-00 00:00:00', 'pago', ''),
(32, 29, 1, '0000-00-00 00:00:00', 'pago', ''),
(33, 28, 1, '0000-00-00 00:00:00', 'pago', ''),
(34, 27, 1, '0000-00-00 00:00:00', 'pago', ''),
(35, 26, 1, '0000-00-00 00:00:00', 'pago', ''),
(36, 25, 1, '0000-00-00 00:00:00', 'pago', ''),
(37, 24, 1, '0000-00-00 00:00:00', 'pago', ''),
(38, 23, 1, '0000-00-00 00:00:00', 'pago', ''),
(39, 22, 1, '0000-00-00 00:00:00', 'pago', ''),
(40, 21, 1, '0000-00-00 00:00:00', 'pago', ''),
(41, 20, 1, '0000-00-00 00:00:00', 'pago', ''),
(42, 19, 1, '0000-00-00 00:00:00', 'pago', ''),
(43, 18, 1, '0000-00-00 00:00:00', 'pago', ''),
(44, 17, 1, '0000-00-00 00:00:00', 'pago', ''),
(45, 16, 1, '0000-00-00 00:00:00', 'pago', ''),
(46, 14, 1, '0000-00-00 00:00:00', 'pago', ''),
(47, 15, 1, '0000-00-00 00:00:00', 'pago', ''),
(48, 13, 1, '0000-00-00 00:00:00', 'pago', ''),
(49, 12, 1, '0000-00-00 00:00:00', 'pago', ''),
(50, 11, 1, '0000-00-00 00:00:00', 'pago', ''),
(51, 37, 2, '0000-00-00 00:00:00', 'pago', ''),
(52, 36, 4, '0000-00-00 00:00:00', 'pago', ''),
(53, 35, 2, '0000-00-00 00:00:00', 'pago', ''),
(54, 34, 3, '0000-00-00 00:00:00', 'pago', ''),
(55, 33, 2, '0000-00-00 00:00:00', 'pago', ''),
(56, 32, 4, '0000-00-00 00:00:00', 'pago', ''),
(57, 31, 5, '0000-00-00 00:00:00', 'pago', ''),
(58, 30, 6, '0000-00-00 00:00:00', 'pago', ''),
(59, 29, 2, '0000-00-00 00:00:00', 'pago', ''),
(60, 28, 9, '0000-00-00 00:00:00', 'pago', ''),
(61, 27, 2, '0000-00-00 00:00:00', 'pago', ''),
(62, 26, 2, '0000-00-00 00:00:00', 'pago', ''),
(63, 25, 2, '0000-00-00 00:00:00', 'pago', ''),
(64, 24, 2, '0000-00-00 00:00:00', 'pago', ''),
(65, 23, 4, '0000-00-00 00:00:00', 'pago', ''),
(66, 22, 2, '0000-00-00 00:00:00', 'pago', ''),
(67, 21, 2, '0000-00-00 00:00:00', 'pago', ''),
(68, 20, 3, '0000-00-00 00:00:00', 'pago', ''),
(69, 19, 4, '0000-00-00 00:00:00', 'pago', ''),
(70, 18, 5, '0000-00-00 00:00:00', 'pago', ''),
(71, 17, 6, '0000-00-00 00:00:00', 'pago', ''),
(72, 16, 8, '0000-00-00 00:00:00', 'pago', ''),
(73, 14, 7, '0000-00-00 00:00:00', 'pago', ''),
(74, 15, 10, '0000-00-00 00:00:00', 'pago', ''),
(75, 13, 9, '0000-00-00 00:00:00', 'pago', ''),
(76, 12, 4, '0000-00-00 00:00:00', 'pago', ''),
(77, 11, 5, '0000-00-00 00:00:00', 'pago', ''),
(83, 40, 8, '2024-11-22 00:00:00', 'pago', 'boleto'),
(84, 26, 2, '2024-01-10 00:00:00', 'pago', ''),
(85, 26, 2, '2024-01-10 00:00:00', 'pago', ''),
(86, 26, 2, '2024-01-10 00:00:00', 'pago', ''),
(87, 26, 2, '2024-01-10 00:00:00', 'pago', ''),
(89, 39, 8, '2024-11-25 00:00:00', 'pago', 'boleto'),
(90, 39, 10, '2024-11-25 00:00:00', 'pago', 'boleto');

--
-- Acionadores `inscricoes`
--
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN  
        UPDATE eventos  
        SET total_participantes = total_participantes + 1  
        WHERE id = NEW.evento_id;  
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes1` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes2` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes4` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes5` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes6` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes7` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes8` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AtualizaContagemParticipantes9` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PesquisaAtual` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PesquisaAtualTri` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PesquisaAtualtrig` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aa` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `opa` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigerrr` AFTER INSERT ON `inscricoes` FOR EACH ROW BEGIN
        UPDATE eventos
        SET total_participantes = total_participantes + 1
        WHERE id = NEW.evento_id;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `palestrantes`
--

CREATE TABLE `palestrantes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `biografia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `palestrantes`
--

INSERT INTO `palestrantes` (`id`, `nome`, `email`, `telefone`, `biografia`) VALUES
(1, 'João Silva', 'joao.silva@email.com', '123456789', 'Especialista em música e cultura.'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', '987654321', 'Professora e palestrante sobre tecnologia.'),
(3, 'Carlos Pereira', 'carlos.pereira@email.com', '456789123', 'Chef renomado e autor de livros de culinária.'),
(4, 'Ana Costa', 'ana.costa@email.com', '321654987', 'Psicóloga com foco em saúde mental.'),
(5, 'Ricardo Santos', 'ricardo.santos@email.com', '654321789', 'Empreendedor e mentor de startups.'),
(6, 'Fernanda Lima', 'fernanda.lima@email.com', '789123456', 'Artista plástica e curadora de exposições.'),
(7, 'Lucas Almeida', 'lucas.almeida@email.com', '159753486', 'Especialista em sustentabilidade e meio ambiente.'),
(8, 'Patrícia Gomes', 'patricia.gomes@email.com', '753159486', 'Jogadora profissional de futebol.'),
(9, 'Juliana Rocha', 'juliana.rocha@email.com', '951753486', 'Cineasta e produtora de eventos culturais.'),
(10, 'Eduardo Martins', 'eduardo.martins@email.com', '852963147', 'Educador e palestrante sobre inclusão na educação.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `palestrantes_atividades`
--

CREATE TABLE `palestrantes_atividades` (
  `palestrante_id` int(11) NOT NULL,
  `atividade_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `palestrantes_atividades`
--

INSERT INTO `palestrantes_atividades` (`palestrante_id`, `atividade_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(7, 8),
(7, 9),
(7, 10),
(8, 9),
(8, 10),
(9, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `participantes`
--

CREATE TABLE `participantes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `instituicao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `participantes`
--

INSERT INTO `participantes` (`id`, `nome`, `email`, `telefone`, `instituicao`) VALUES
(1, 'João Silva', 'joao.silva@email.com', '1234-5678', 'Instituto A'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', '2345-6789', 'Instituto B'),
(3, 'Carlos Pereira', 'carlos.pereira@email.com', '3456-7890', 'Instituto C'),
(4, 'Ana Costa', 'ana.costa@email.com', '4567-8901', 'Instituto D'),
(5, 'Lucas Santos', 'lucas.santos@email.com', '5678-9012', 'Instituto E'),
(6, 'Fernanda Almeida', 'fernanda.almeida@email.com', '6789-0123', 'Instituto F'),
(7, 'Pedro Lima', 'pedro.lima@email.com', '7890-1234', 'Instituto G'),
(8, 'Juliana Ribeiro', 'juliana.ribeiro@email.com', '8901-2345', 'Instituto H'),
(9, 'Ricardo Martins', 'ricardo.martins@email.com', '9012-3456', 'Instituto I'),
(10, 'Tatiane Silva', 'tatiane.silva@email.com', '0123-4567', 'Instituto J'),
(11, 'Thiago Gomes', 'thiago.gomes@email.com', '1345-6789', 'Instituto K'),
(12, 'Karina Sousa', 'karina.sousa@email.com', '2456-7890', 'Instituto L'),
(13, 'Renato Lima', 'renato.lima@email.com', '3567-8901', 'Instituto M'),
(14, 'Sofia Martins', 'sofia.martins@email.com', '4678-9012', 'Instituto N'),
(15, 'Valter Pinto', 'valter.pinto@email.com', '5789-0123', 'Instituto O'),
(16, 'Camila Ferreira', 'camila.ferreira@email.com', '6890-1234', 'Instituto P'),
(17, 'Fábio Dias', 'fabio.dias@email.com', '7901-2345', 'Instituto Q'),
(18, 'Cristiane Nunes', 'cristiane.nunes@email.com', '8901-3456', 'Instituto R'),
(19, 'Leonardo Moreira', 'leonardo.moreira@email.com', '9012-4567', 'Instituto S'),
(20, 'Patrícia Rocha', 'patricia.rocha@email.com', '0123-5678', 'Instituto T'),
(21, 'Marcelinho Silva', 'marcelinho.silva@email.com', '1234-4321', 'Instituto U'),
(22, 'Geovana Lima', 'geovana.lima@email.com', '2345-5432', 'Instituto V'),
(23, 'Frederico Lopes', 'frederico.lopes@email.com', '3456-6543', 'Instituto W'),
(24, 'Tânia Martins', 'tania.martins@email.com', '4567-7654', 'Instituto X'),
(25, 'Isabel Cristina', 'isabel.cristina@email.com', '5678-8765', 'Instituto Y'),
(26, 'Ricardo Fernandes', 'ricardo.fernandes@email.com', '6789-9876', 'Instituto Z'),
(27, 'Barbara Santos', 'barbara.santos@email.com', '7890-0987', 'Instituto AA'),
(28, 'André Alves', 'andre.alves@email.com', '8901-1098', 'Instituto AB'),
(29, 'Eliane Costa', 'eliane.costa@email.com', '9012-2109', 'Instituto AC'),
(30, 'Jordana Lima', 'jordana.lima@email.com', '0123-3210', 'Instituto AD'),
(31, 'Vinícius Martins', 'vinicius.martins@email.com', '1345-4321', 'Instituto AE'),
(32, 'Priscila Souza', 'priscila.souza@email.com', '2456-5432', 'Instituto AF'),
(33, 'Eduardo Bernardes', 'eduardo.bernardes@email.com', '3567-6543', 'Instituto AG'),
(34, 'Mariana Ribeiro', 'mariana.ribeiro@email.com', '4678-7654', 'Instituto AH'),
(35, 'Fernando Campos', 'fernando.campos@email.com', '5789-8765', 'Instituto AI'),
(36, 'Luana Oliveira', 'luana.oliveira@email.com', '6890-9876', 'Instituto AJ'),
(37, 'Gustavo Almeida', 'gustavo.almeida@email.com', '7901-0987', 'Instituto AK'),
(38, 'Tatiane Nunes', 'tatiane.nunes@email.com', '8901-1098', 'Instituto AL'),
(39, 'Julio César', 'julio.cesar@email.com', '9012-2109', 'Instituto AM'),
(40, 'Alice Martins', 'alice.martins@email.com', '0123-3210', 'Instituto AN');

-- --------------------------------------------------------

--
-- Estrutura para tabela `patrocinadores`
--

CREATE TABLE `patrocinadores` (
  `id` int(11) NOT NULL,
  `nome_empresa` varchar(255) NOT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `apoio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `patrocinadores`
--

INSERT INTO `patrocinadores` (`id`, `nome_empresa`, `contato`, `apoio`) VALUES
(1, 'Empresa A', 'contato@empresaA.com', 10.9),
(2, 'Empresa B', 'contato@empresaB.com', 85112.8),
(3, 'Empresa C', 'contato@empresaC.com', 100),
(4, 'Empresa D', 'contato@empresaD.com', 1000),
(5, 'Empresa E', 'contato@empresaE.com', 60000000),
(6, 'Empresa F', 'contato@empresaF.com', 8000560000),
(7, 'Empresa G', 'contato@empresaG.com', 6456.89),
(8, 'Empresa H', 'contato@empresaH.com', 455454),
(9, 'Empresa I', 'contato@empresaI.com', 54),
(10, 'Empresa J', 'contato@empresaJ.com', 5665),
(11, 'Empresa K', 'contato@empresaK.com', 5655),
(12, 'Empresa L', 'contato@empresaL.com', 43),
(13, 'Empresa M', 'contato@empresaM.com', 33),
(14, 'Empresa N', 'contato@empresaN.com', 10),
(15, 'Empresa O', 'contato@empresaO.com', 5),
(16, 'Empresa P', 'contato@empresaP.com', 100),
(17, 'Empresa Q', 'contato@empresaQ.com', 1000),
(18, 'Empresa R', 'contato@empresaR.com', 20.4),
(19, 'Empresa S', 'contato@empresaS.com', 9566.6),
(20, 'Empresa T', 'contato@empresaT.com', 75);

-- --------------------------------------------------------

--
-- Estrutura para tabela `patrocinadores_eventos`
--

CREATE TABLE `patrocinadores_eventos` (
  `patrocinador_id` int(11) NOT NULL,
  `evento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `patrocinadores_eventos`
--

INSERT INTO `patrocinadores_eventos` (`patrocinador_id`, `evento_id`) VALUES
(1, 1),
(1, 2),
(2, 6),
(3, 9),
(6, 1),
(6, 2),
(6, 7),
(10, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_atividades`
--

CREATE TABLE `tipos_atividades` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipos_atividades`
--

INSERT INTO `tipos_atividades` (`id`, `tipo`) VALUES
(6, 'Atividade Prática'),
(9, 'Competição'),
(10, 'Curso'),
(4, 'Debate'),
(5, 'Exposição'),
(3, 'Mesa Redonda'),
(7, 'Networking'),
(1, 'Palestra'),
(8, 'Show'),
(2, 'Workshop');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atividades`
--
ALTER TABLE `atividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evento_id` (`evento_id`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `certificados`
--
ALTER TABLE `certificados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_validade` (`codigo_validade`),
  ADD KEY `participante_id` (`participante_id`),
  ADD KEY `atividade_id` (`atividade_id`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Índices de tabela `inscricoes`
--
ALTER TABLE `inscricoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participante_id` (`participante_id`),
  ADD KEY `evento_id` (`evento_id`);

--
-- Índices de tabela `palestrantes`
--
ALTER TABLE `palestrantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `palestrantes_atividades`
--
ALTER TABLE `palestrantes_atividades`
  ADD PRIMARY KEY (`palestrante_id`,`atividade_id`),
  ADD KEY `atividade_id` (`atividade_id`);

--
-- Índices de tabela `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `patrocinadores`
--
ALTER TABLE `patrocinadores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `patrocinadores_eventos`
--
ALTER TABLE `patrocinadores_eventos`
  ADD PRIMARY KEY (`patrocinador_id`,`evento_id`),
  ADD KEY `evento_id` (`evento_id`);

--
-- Índices de tabela `tipos_atividades`
--
ALTER TABLE `tipos_atividades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atividades`
--
ALTER TABLE `atividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `certificados`
--
ALTER TABLE `certificados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `inscricoes`
--
ALTER TABLE `inscricoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de tabela `palestrantes`
--
ALTER TABLE `palestrantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `participantes`
--
ALTER TABLE `participantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `patrocinadores`
--
ALTER TABLE `patrocinadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `tipos_atividades`
--
ALTER TABLE `tipos_atividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atividades`
--
ALTER TABLE `atividades`
  ADD CONSTRAINT `atividades_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`),
  ADD CONSTRAINT `atividades_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_atividades` (`id`);

--
-- Restrições para tabelas `certificados`
--
ALTER TABLE `certificados`
  ADD CONSTRAINT `certificados_ibfk_1` FOREIGN KEY (`participante_id`) REFERENCES `participantes` (`id`),
  ADD CONSTRAINT `certificados_ibfk_2` FOREIGN KEY (`atividade_id`) REFERENCES `atividades` (`id`);

--
-- Restrições para tabelas `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Restrições para tabelas `inscricoes`
--
ALTER TABLE `inscricoes`
  ADD CONSTRAINT `inscricoes_ibfk_1` FOREIGN KEY (`participante_id`) REFERENCES `participantes` (`id`),
  ADD CONSTRAINT `inscricoes_ibfk_2` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`);

--
-- Restrições para tabelas `palestrantes_atividades`
--
ALTER TABLE `palestrantes_atividades`
  ADD CONSTRAINT `palestrantes_atividades_ibfk_1` FOREIGN KEY (`palestrante_id`) REFERENCES `palestrantes` (`id`),
  ADD CONSTRAINT `palestrantes_atividades_ibfk_2` FOREIGN KEY (`atividade_id`) REFERENCES `atividades` (`id`);

--
-- Restrições para tabelas `patrocinadores_eventos`
--
ALTER TABLE `patrocinadores_eventos`
  ADD CONSTRAINT `patrocinadores_eventos_ibfk_1` FOREIGN KEY (`patrocinador_id`) REFERENCES `patrocinadores` (`id`),
  ADD CONSTRAINT `patrocinadores_eventos_ibfk_2` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
