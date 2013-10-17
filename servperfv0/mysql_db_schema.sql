-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.13 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para teste
CREATE DATABASE IF NOT EXISTS `teste` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `teste`;


-- Copiando estrutura para tabela teste.indcol
CREATE TABLE IF NOT EXISTS `indcol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` bigint(20) NOT NULL,
  `nome_completo` varchar(250) NOT NULL,
  `cidade` varchar(250) NOT NULL,
  `endereco` varchar(250) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `faturamento` decimal(15,2) NOT NULL,
  `agente` varchar(250) NOT NULL,
  `universidade` varchar(250) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `empresa_atendida` varchar(250) NOT NULL,
  `data` date NOT NULL,
  `nome_fantasia` varchar(250) NOT NULL,
  `tipo_empresa` varchar(250) NOT NULL,
  `razao_social` varchar(250) NOT NULL,
  `bairro` varchar(250) NOT NULL,
  `atv_economica` varchar(250) NOT NULL,
  `atv_secundarias` varchar(250) NOT NULL,
  `cep` bigint(20) NOT NULL,
  `n_funcionarios` int(11) DEFAULT NULL,
  `data_abertura` date NOT NULL,
  `segmento` varchar(250) NOT NULL,
  `fat_anual` decimal(10,2) NOT NULL,
  `cargo` varchar(250) NOT NULL,
  `cpf` bigint(20) NOT NULL,
  `tel_fixo` bigint(20),
  `tel_celular` bigint(20),
  `email` bigint(20) NOT NULL,
  `data_nascimento` bigint(20) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `nivel_escolaridade` varchar(250) NOT NULL,
  `p1` tinyint(4) NOT NULL,
  `p2` tinyint(4) NOT NULL,
  `p3` tinyint(4) NOT NULL,
  `p4` tinyint(4) NOT NULL,
  `p5` tinyint(4) NOT NULL,
  `p6` tinyint(4) NOT NULL,
  `p7` tinyint(4) NOT NULL,
  `p8` tinyint(4) NOT NULL,
  `p9` tinyint(4) NOT NULL,
  `p10` tinyint(4) NOT NULL,
  `p11` tinyint(4) NOT NULL,
  `p12` tinyint(4) NOT NULL,
  `p13` tinyint(4) NOT NULL,
  `p14` tinyint(4) NOT NULL,
  `p15` tinyint(4) NOT NULL,
  `p16` tinyint(4) NOT NULL,
  `p17` tinyint(4) NOT NULL,
  `p18` tinyint(4) NOT NULL,
  `p19` tinyint(4) NOT NULL,
  `p20` tinyint(4) NOT NULL,
  `p21` tinyint(4) NOT NULL,
  `p22` tinyint(4) NOT NULL,
  `p23` tinyint(4) NOT NULL,
  `p24` tinyint(4) NOT NULL,
  `p25` tinyint(4) NOT NULL,
  `p26` tinyint(4) NOT NULL,
  `p27` tinyint(4) NOT NULL,
  `p28` tinyint(4) NOT NULL,
  `p29` tinyint(4) NOT NULL,
  `p30` tinyint(4) NOT NULL,
  `p31` tinyint(4) NOT NULL,
  `p32` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
