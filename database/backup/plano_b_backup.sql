-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: plano_b_tabacaria
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'fcaf4753-7356-11f1-9611-002403f444ed:1-63';

--
-- Table structure for table `backup_itens_venda`
--

DROP TABLE IF EXISTS `backup_itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_itens_venda` (
  `id` int NOT NULL DEFAULT '0',
  `venda_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_itens_venda`
--

LOCK TABLES `backup_itens_venda` WRITE;
/*!40000 ALTER TABLE `backup_itens_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup_itens_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `quantidade` int NOT NULL,
  `valor_pago` decimal(10,2) DEFAULT NULL,
  `data_compra` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,50,235.81,'2026-06-29'),(2,1,50,235.81,'2026-06-29');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `curva_abc`
--

DROP TABLE IF EXISTS `curva_abc`;
/*!50001 DROP VIEW IF EXISTS `curva_abc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `curva_abc` AS SELECT 
 1 AS `produto`,
 1 AS `valor_estoque`,
 1 AS `percentual_estoque`,
 1 AS `classe`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `estoque_atual`
--

DROP TABLE IF EXISTS `estoque_atual`;
/*!50001 DROP VIEW IF EXISTS `estoque_atual`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `estoque_atual` AS SELECT 
 1 AS `id`,
 1 AS `produto`,
 1 AS `estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `giro_estoque`
--

DROP TABLE IF EXISTS `giro_estoque`;
/*!50001 DROP VIEW IF EXISTS `giro_estoque`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `giro_estoque` AS SELECT 
 1 AS `produto`,
 1 AS `estoque_atual`,
 1 AS `quantidade_vendida`,
 1 AS `giro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `indicadores_vendas`
--

DROP TABLE IF EXISTS `indicadores_vendas`;
/*!50001 DROP VIEW IF EXISTS `indicadores_vendas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `indicadores_vendas` AS SELECT 
 1 AS `faturamento_total`,
 1 AS `itens_vendidos`,
 1 AS `ticket_medio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `indicadores_vendas_v2`
--

DROP TABLE IF EXISTS `indicadores_vendas_v2`;
/*!50001 DROP VIEW IF EXISTS `indicadores_vendas_v2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `indicadores_vendas_v2` AS SELECT 
 1 AS `total_vendas`,
 1 AS `total_itens_vendidos`,
 1 AS `faturamento_total`,
 1 AS `ticket_medio`,
 1 AS `valor_medio_por_item`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `itens_venda`
--

DROP TABLE IF EXISTS `itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_venda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `venda_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_id` (`venda_id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `itens_venda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`),
  CONSTRAINT `itens_venda_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_venda`
--

LOCK TABLES `itens_venda` WRITE;
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
INSERT INTO `itens_venda` VALUES (1,1,1,2,11.00),(2,2,3,1,8.00),(3,3,5,1,17.00);
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacoes_estoque`
--

DROP TABLE IF EXISTS `movimentacoes_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacoes_estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `quantidade` int NOT NULL,
  `data_movimentacao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `movimentacoes_estoque_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacoes_estoque`
--

LOCK TABLES `movimentacoes_estoque` WRITE;
/*!40000 ALTER TABLE `movimentacoes_estoque` DISABLE KEYS */;
INSERT INTO `movimentacoes_estoque` VALUES (1,1,'entrada',50,'2026-06-29'),(2,1,'saida',3,'2026-06-29'),(3,2,'entrada',2,'2026-06-29'),(4,3,'entrada',10,'2026-06-29'),(5,4,'entrada',1,'2026-06-29'),(6,5,'entrada',52,'2026-06-29'),(7,6,'entrada',25,'2026-06-29'),(8,7,'entrada',12,'2026-06-29'),(9,8,'entrada',25,'2026-06-29'),(10,9,'entrada',5,'2026-06-29'),(11,10,'entrada',8,'2026-06-29'),(12,11,'entrada',9,'2026-06-29'),(13,2,'entrada',2,'2026-06-29'),(14,3,'entrada',10,'2026-06-29'),(15,4,'entrada',1,'2026-06-29'),(16,5,'entrada',52,'2026-06-29'),(17,6,'entrada',25,'2026-06-29'),(18,7,'entrada',12,'2026-06-29'),(19,8,'entrada',25,'2026-06-29'),(20,9,'entrada',5,'2026-06-29'),(21,10,'entrada',8,'2026-06-29'),(22,11,'entrada',9,'2026-06-29');
/*!40000 ALTER TABLE `movimentacoes_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produto` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `custo_unitario` decimal(10,2) DEFAULT NULL,
  `preco_venda` decimal(10,2) DEFAULT NULL,
  `estoque_atual` int DEFAULT NULL,
  `estoque_minimo` int DEFAULT NULL,
  `lucro` decimal(10,2) DEFAULT NULL,
  `margem` decimal(5,2) DEFAULT NULL,
  `valor_estoque` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'seda elements','seda','elements',4.72,11.00,50,10,6.28,57.13,235.81,'OK'),(2,'gás butano','gás','gás',23.95,50.00,2,1,26.05,52.10,47.90,'OK'),(3,'piteira de vidro','piteira','paradize',1.84,8.00,10,3,6.16,76.96,18.43,'OK'),(4,'tesoura abduzido','tesoura','abduzido',24.87,50.00,1,1,25.13,50.26,24.87,'ATENÇÃO'),(5,'tabaco acrema','tabaco','acrema',9.65,17.00,52,7,7.35,43.26,501.59,'OK'),(6,'seda acrema','seda','acrema',2.85,7.00,25,5,4.15,59.29,71.24,'OK'),(7,'isqueiro clipper grande','isqueiro','clipper',4.04,9.00,12,3,4.96,55.15,48.44,'OK'),(8,'seda tatu do bem','seda','tatu do bem',1.95,5.00,25,5,3.05,61.00,48.75,'OK'),(9,'filtro para cigarro','filtro','aleda',5.05,14.00,5,3,8.95,63.92,25.26,'OK'),(10,'piteira aleda extra larga','piteira','aleda',3.44,9.00,8,4,5.56,61.81,27.50,'OK'),(11,'isqueiro maçarico','isqueiro','firestar',7.90,18.00,9,3,10.10,56.10,71.12,'OK');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ranking_produtos`
--

DROP TABLE IF EXISTS `ranking_produtos`;
/*!50001 DROP VIEW IF EXISTS `ranking_produtos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ranking_produtos` AS SELECT 
 1 AS `produto`,
 1 AS `unidades_vendidas`,
 1 AS `faturamento`,
 1 AS `lucro_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ranking_produtos_v2`
--

DROP TABLE IF EXISTS `ranking_produtos_v2`;
/*!50001 DROP VIEW IF EXISTS `ranking_produtos_v2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ranking_produtos_v2` AS SELECT 
 1 AS `produto`,
 1 AS `unidades_vendidas`,
 1 AS `faturamento`,
 1 AS `lucro_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `relatorio_estoque`
--

DROP TABLE IF EXISTS `relatorio_estoque`;
/*!50001 DROP VIEW IF EXISTS `relatorio_estoque`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `relatorio_estoque` AS SELECT 
 1 AS `id`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `marca`,
 1 AS `estoque`,
 1 AS `custo_unitario`,
 1 AS `valor_investido`,
 1 AS `preco_venda`,
 1 AS `valor_venda`,
 1 AS `lucro`,
 1 AS `lucro_potencial`,
 1 AS `margem`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `relatorio_vendas`
--

DROP TABLE IF EXISTS `relatorio_vendas`;
/*!50001 DROP VIEW IF EXISTS `relatorio_vendas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `relatorio_vendas` AS SELECT 
 1 AS `produto`,
 1 AS `quantidade_vendida`,
 1 AS `faturamento`,
 1 AS `lucro_gerado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `relatorio_vendas_v2`
--

DROP TABLE IF EXISTS `relatorio_vendas_v2`;
/*!50001 DROP VIEW IF EXISTS `relatorio_vendas_v2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `relatorio_vendas_v2` AS SELECT 
 1 AS `id_item`,
 1 AS `id_venda`,
 1 AS `data_venda`,
 1 AS `id_produto`,
 1 AS `produto`,
 1 AS `quantidade`,
 1 AS `preco_unitario`,
 1 AS `valor_total_item`,
 1 AS `forma_pagamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `valor_estoque_produtos`
--

DROP TABLE IF EXISTS `valor_estoque_produtos`;
/*!50001 DROP VIEW IF EXISTS `valor_estoque_produtos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `valor_estoque_produtos` AS SELECT 
 1 AS `produto`,
 1 AS `estoque_atual`,
 1 AS `custo_unitario`,
 1 AS `valor_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `forma_pagamento` varchar(30) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,'pix','2026-06-29'),(2,'dinheiro','2026-06-29'),(3,'cartao','2026-06-29');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_categorias`
--

DROP TABLE IF EXISTS `vw_categorias`;
/*!50001 DROP VIEW IF EXISTS `vw_categorias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_categorias` AS SELECT 
 1 AS `categoria`,
 1 AS `produtos`,
 1 AS `quantidade_vendida`,
 1 AS `faturamento`,
 1 AS `custo`,
 1 AS `lucro`,
 1 AS `margem`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dashboard_executivo`
--

DROP TABLE IF EXISTS `vw_dashboard_executivo`;
/*!50001 DROP VIEW IF EXISTS `vw_dashboard_executivo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dashboard_executivo` AS SELECT 
 1 AS `faturamento_bruto`,
 1 AS `total_vendas`,
 1 AS `ticket_medio`,
 1 AS `itens_vendidos`,
 1 AS `valor_investido`,
 1 AS `valor_potencial_venda`,
 1 AS `lucro_potencial`,
 1 AS `produtos_criticos`,
 1 AS `categorias_ativas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dashboard_resumo`
--

DROP TABLE IF EXISTS `vw_dashboard_resumo`;
/*!50001 DROP VIEW IF EXISTS `vw_dashboard_resumo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dashboard_resumo` AS SELECT 
 1 AS `total_vendas`,
 1 AS `itens_vendidos`,
 1 AS `faturamento_bruto`,
 1 AS `ticket_medio`,
 1 AS `valor_estoque`,
 1 AS `lucro_potencial_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_desempenho_produtos`
--

DROP TABLE IF EXISTS `vw_desempenho_produtos`;
/*!50001 DROP VIEW IF EXISTS `vw_desempenho_produtos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_desempenho_produtos` AS SELECT 
 1 AS `id`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `quantidade_vendida`,
 1 AS `faturamento`,
 1 AS `lucro_bruto`,
 1 AS `margem_lucro`,
 1 AS `classificacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_formas_pagamento`
--

DROP TABLE IF EXISTS `vw_formas_pagamento`;
/*!50001 DROP VIEW IF EXISTS `vw_formas_pagamento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_formas_pagamento` AS SELECT 
 1 AS `forma_pagamento`,
 1 AS `quantidade_vendas`,
 1 AS `faturamento`,
 1 AS `ticket_medio`,
 1 AS `percentual_faturamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_produtos_criticos`
--

DROP TABLE IF EXISTS `vw_produtos_criticos`;
/*!50001 DROP VIEW IF EXISTS `vw_produtos_criticos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_produtos_criticos` AS SELECT 
 1 AS `id`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `estoque_atual`,
 1 AS `estoque_minimo`,
 1 AS `custo_unitario`,
 1 AS `preco_venda`,
 1 AS `quantidade_repor`,
 1 AS `situacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ranking_lucratividade`
--

DROP TABLE IF EXISTS `vw_ranking_lucratividade`;
/*!50001 DROP VIEW IF EXISTS `vw_ranking_lucratividade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ranking_lucratividade` AS SELECT 
 1 AS `id`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `quantidade_vendida`,
 1 AS `faturamento`,
 1 AS `custo_total`,
 1 AS `lucro_bruto`,
 1 AS `margem_lucro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_valor_estoque`
--

DROP TABLE IF EXISTS `vw_valor_estoque`;
/*!50001 DROP VIEW IF EXISTS `vw_valor_estoque`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_valor_estoque` AS SELECT 
 1 AS `id`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `estoque_atual`,
 1 AS `custo_unitario`,
 1 AS `preco_venda`,
 1 AS `valor_investido`,
 1 AS `valor_venda`,
 1 AS `lucro_potencial`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `curva_abc`
--

/*!50001 DROP VIEW IF EXISTS `curva_abc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `curva_abc` AS select `valor_estoque_produtos`.`produto` AS `produto`,`valor_estoque_produtos`.`valor_estoque` AS `valor_estoque`,round(((`valor_estoque_produtos`.`valor_estoque` / sum(`valor_estoque_produtos`.`valor_estoque`) OVER () ) * 100),2) AS `percentual_estoque`,(case when ((sum(`valor_estoque_produtos`.`valor_estoque`) OVER (ORDER BY `valor_estoque_produtos`.`valor_estoque` desc )  / sum(`valor_estoque_produtos`.`valor_estoque`) OVER () ) <= 0.80) then 'A' when ((sum(`valor_estoque_produtos`.`valor_estoque`) OVER (ORDER BY `valor_estoque_produtos`.`valor_estoque` desc )  / sum(`valor_estoque_produtos`.`valor_estoque`) OVER () ) <= 0.95) then 'B' else 'C' end) AS `classe` from `valor_estoque_produtos` order by `valor_estoque_produtos`.`valor_estoque` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `estoque_atual`
--

/*!50001 DROP VIEW IF EXISTS `estoque_atual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `estoque_atual` AS select `p`.`id` AS `id`,`p`.`produto` AS `produto`,coalesce(sum((case when (`m`.`tipo` = 'entrada') then `m`.`quantidade` when (`m`.`tipo` = 'saida') then -(`m`.`quantidade`) end)),0) AS `estoque` from (`produtos` `p` left join `movimentacoes_estoque` `m` on((`p`.`id` = `m`.`produto_id`))) group by `p`.`id`,`p`.`produto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `giro_estoque`
--

/*!50001 DROP VIEW IF EXISTS `giro_estoque`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `giro_estoque` AS select `p`.`produto` AS `produto`,`e`.`estoque` AS `estoque_atual`,coalesce(sum(`iv`.`quantidade`),0) AS `quantidade_vendida`,round((coalesce(sum(`iv`.`quantidade`),0) / `e`.`estoque`),2) AS `giro` from ((`produtos` `p` join `estoque_atual` `e` on((`p`.`id` = `e`.`id`))) left join `itens_venda` `iv` on((`p`.`id` = `iv`.`produto_id`))) group by `p`.`produto`,`e`.`estoque` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `indicadores_vendas`
--

/*!50001 DROP VIEW IF EXISTS `indicadores_vendas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `indicadores_vendas` AS select sum((`iv`.`quantidade` * `iv`.`preco_unitario`)) AS `faturamento_total`,sum(`iv`.`quantidade`) AS `itens_vendidos`,avg(`iv`.`preco_unitario`) AS `ticket_medio` from `itens_venda` `iv` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `indicadores_vendas_v2`
--

/*!50001 DROP VIEW IF EXISTS `indicadores_vendas_v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `indicadores_vendas_v2` AS select count(distinct `relatorio_vendas_v2`.`id_venda`) AS `total_vendas`,sum(`relatorio_vendas_v2`.`quantidade`) AS `total_itens_vendidos`,sum(`relatorio_vendas_v2`.`valor_total_item`) AS `faturamento_total`,round(avg(`relatorio_vendas_v2`.`valor_total_item`),2) AS `ticket_medio`,round((sum(`relatorio_vendas_v2`.`valor_total_item`) / sum(`relatorio_vendas_v2`.`quantidade`)),2) AS `valor_medio_por_item` from `relatorio_vendas_v2` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ranking_produtos`
--

/*!50001 DROP VIEW IF EXISTS `ranking_produtos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ranking_produtos` AS select `p`.`produto` AS `produto`,sum(`iv`.`quantidade`) AS `unidades_vendidas`,sum((`iv`.`quantidade` * `iv`.`preco_unitario`)) AS `faturamento`,sum((`iv`.`quantidade` * `p`.`lucro`)) AS `lucro_total` from (`produtos` `p` join `itens_venda` `iv` on((`p`.`id` = `iv`.`produto_id`))) group by `p`.`produto` order by `lucro_total` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ranking_produtos_v2`
--

/*!50001 DROP VIEW IF EXISTS `ranking_produtos_v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ranking_produtos_v2` AS select `p`.`produto` AS `produto`,sum(`iv`.`quantidade`) AS `unidades_vendidas`,sum((`iv`.`quantidade` * `iv`.`preco_unitario`)) AS `faturamento`,sum((`iv`.`quantidade` * `p`.`lucro`)) AS `lucro_total` from (`produtos` `p` join `itens_venda` `iv` on((`p`.`id` = `iv`.`produto_id`))) group by `p`.`produto` order by `lucro_total` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `relatorio_estoque`
--

/*!50001 DROP VIEW IF EXISTS `relatorio_estoque`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `relatorio_estoque` AS select `p`.`id` AS `id`,`p`.`produto` AS `produto`,`p`.`categoria` AS `categoria`,`p`.`marca` AS `marca`,`e`.`estoque` AS `estoque`,`p`.`custo_unitario` AS `custo_unitario`,round((`e`.`estoque` * `p`.`custo_unitario`),2) AS `valor_investido`,`p`.`preco_venda` AS `preco_venda`,round((`e`.`estoque` * `p`.`preco_venda`),2) AS `valor_venda`,`p`.`lucro` AS `lucro`,round((`e`.`estoque` * `p`.`lucro`),2) AS `lucro_potencial`,`p`.`margem` AS `margem` from (`produtos` `p` join `estoque_atual` `e` on((`p`.`id` = `e`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `relatorio_vendas`
--

/*!50001 DROP VIEW IF EXISTS `relatorio_vendas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `relatorio_vendas` AS select `p`.`produto` AS `produto`,sum(`iv`.`quantidade`) AS `quantidade_vendida`,sum((`iv`.`quantidade` * `iv`.`preco_unitario`)) AS `faturamento`,sum((`iv`.`quantidade` * `p`.`lucro`)) AS `lucro_gerado` from (`produtos` `p` join `itens_venda` `iv` on((`p`.`id` = `iv`.`produto_id`))) group by `p`.`produto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `relatorio_vendas_v2`
--

/*!50001 DROP VIEW IF EXISTS `relatorio_vendas_v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `relatorio_vendas_v2` AS select `iv`.`id` AS `id_item`,`v`.`id` AS `id_venda`,`v`.`data_venda` AS `data_venda`,`p`.`id` AS `id_produto`,`p`.`produto` AS `produto`,`iv`.`quantidade` AS `quantidade`,`iv`.`preco_unitario` AS `preco_unitario`,(`iv`.`quantidade` * `iv`.`preco_unitario`) AS `valor_total_item`,`v`.`forma_pagamento` AS `forma_pagamento` from ((`itens_venda` `iv` join `vendas` `v` on((`iv`.`venda_id` = `v`.`id`))) join `produtos` `p` on((`iv`.`produto_id` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `valor_estoque_produtos`
--

/*!50001 DROP VIEW IF EXISTS `valor_estoque_produtos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `valor_estoque_produtos` AS select `produtos`.`produto` AS `produto`,`produtos`.`estoque_atual` AS `estoque_atual`,`produtos`.`custo_unitario` AS `custo_unitario`,(`produtos`.`estoque_atual` * `produtos`.`custo_unitario`) AS `valor_estoque` from `produtos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_categorias`
--

/*!50001 DROP VIEW IF EXISTS `vw_categorias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_categorias` AS select `p`.`categoria` AS `categoria`,count(distinct `p`.`id`) AS `produtos`,sum(`rv`.`quantidade`) AS `quantidade_vendida`,round(sum(`rv`.`valor_total_item`),2) AS `faturamento`,round(sum((`rv`.`quantidade` * `p`.`custo_unitario`)),2) AS `custo`,round((sum(`rv`.`valor_total_item`) - sum((`rv`.`quantidade` * `p`.`custo_unitario`))),2) AS `lucro`,round((((sum(`rv`.`valor_total_item`) - sum((`rv`.`quantidade` * `p`.`custo_unitario`))) / sum(`rv`.`valor_total_item`)) * 100),2) AS `margem` from (`relatorio_vendas_v2` `rv` join `produtos` `p` on((`rv`.`id_produto` = `p`.`id`))) group by `p`.`categoria` order by `faturamento` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dashboard_executivo`
--

/*!50001 DROP VIEW IF EXISTS `vw_dashboard_executivo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dashboard_executivo` AS select (select `vw_dashboard_resumo`.`faturamento_bruto` from `vw_dashboard_resumo`) AS `faturamento_bruto`,(select `vw_dashboard_resumo`.`total_vendas` from `vw_dashboard_resumo`) AS `total_vendas`,(select `vw_dashboard_resumo`.`ticket_medio` from `vw_dashboard_resumo`) AS `ticket_medio`,(select `vw_dashboard_resumo`.`itens_vendidos` from `vw_dashboard_resumo`) AS `itens_vendidos`,(select sum(`vw_valor_estoque`.`valor_investido`) from `vw_valor_estoque`) AS `valor_investido`,(select sum(`vw_valor_estoque`.`valor_venda`) from `vw_valor_estoque`) AS `valor_potencial_venda`,(select sum(`vw_valor_estoque`.`lucro_potencial`) from `vw_valor_estoque`) AS `lucro_potencial`,(select count(0) from `vw_produtos_criticos`) AS `produtos_criticos`,(select count(0) from `vw_categorias`) AS `categorias_ativas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dashboard_resumo`
--

/*!50001 DROP VIEW IF EXISTS `vw_dashboard_resumo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dashboard_resumo` AS select count(distinct `relatorio_vendas_v2`.`id_venda`) AS `total_vendas`,sum(`relatorio_vendas_v2`.`quantidade`) AS `itens_vendidos`,sum(`relatorio_vendas_v2`.`valor_total_item`) AS `faturamento_bruto`,round(avg(`relatorio_vendas_v2`.`valor_total_item`),2) AS `ticket_medio`,(select sum((`produtos`.`estoque_atual` * `produtos`.`custo_unitario`)) from `produtos`) AS `valor_estoque`,(select sum((`produtos`.`estoque_atual` * `produtos`.`lucro`)) from `produtos`) AS `lucro_potencial_estoque` from `relatorio_vendas_v2` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_desempenho_produtos`
--

/*!50001 DROP VIEW IF EXISTS `vw_desempenho_produtos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_desempenho_produtos` AS select `vw_ranking_lucratividade`.`id` AS `id`,`vw_ranking_lucratividade`.`produto` AS `produto`,`vw_ranking_lucratividade`.`categoria` AS `categoria`,`vw_ranking_lucratividade`.`quantidade_vendida` AS `quantidade_vendida`,`vw_ranking_lucratividade`.`faturamento` AS `faturamento`,`vw_ranking_lucratividade`.`lucro_bruto` AS `lucro_bruto`,`vw_ranking_lucratividade`.`margem_lucro` AS `margem_lucro`,(case when (`vw_ranking_lucratividade`.`margem_lucro` >= 70) then '⭐⭐ Excelente' when (`vw_ranking_lucratividade`.`margem_lucro` >= 50) then '🟢 Bom' when (`vw_ranking_lucratividade`.`margem_lucro` >= 35) then '🟡 Atenção' else '🔴 Revisar' end) AS `classificacao` from `vw_ranking_lucratividade` order by `vw_ranking_lucratividade`.`lucro_bruto` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_formas_pagamento`
--

/*!50001 DROP VIEW IF EXISTS `vw_formas_pagamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_formas_pagamento` AS select `relatorio_vendas_v2`.`forma_pagamento` AS `forma_pagamento`,count(distinct `relatorio_vendas_v2`.`id_venda`) AS `quantidade_vendas`,sum(`relatorio_vendas_v2`.`valor_total_item`) AS `faturamento`,round(avg(`relatorio_vendas_v2`.`valor_total_item`),2) AS `ticket_medio`,round(((sum(`relatorio_vendas_v2`.`valor_total_item`) / (select sum(`relatorio_vendas_v2`.`valor_total_item`) from `relatorio_vendas_v2`)) * 100),2) AS `percentual_faturamento` from `relatorio_vendas_v2` group by `relatorio_vendas_v2`.`forma_pagamento` order by `faturamento` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_produtos_criticos`
--

/*!50001 DROP VIEW IF EXISTS `vw_produtos_criticos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_produtos_criticos` AS select `produtos`.`id` AS `id`,`produtos`.`produto` AS `produto`,`produtos`.`categoria` AS `categoria`,`produtos`.`estoque_atual` AS `estoque_atual`,`produtos`.`estoque_minimo` AS `estoque_minimo`,`produtos`.`custo_unitario` AS `custo_unitario`,`produtos`.`preco_venda` AS `preco_venda`,(`produtos`.`estoque_minimo` - `produtos`.`estoque_atual`) AS `quantidade_repor`,(case when (`produtos`.`estoque_atual` = 0) then 'SEM ESTOQUE' when (`produtos`.`estoque_atual` <= `produtos`.`estoque_minimo`) then 'REPOR' else 'OK' end) AS `situacao` from `produtos` where (`produtos`.`estoque_atual` <= `produtos`.`estoque_minimo`) order by `produtos`.`estoque_atual` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ranking_lucratividade`
--

/*!50001 DROP VIEW IF EXISTS `vw_ranking_lucratividade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ranking_lucratividade` AS select `p`.`id` AS `id`,`p`.`produto` AS `produto`,`p`.`categoria` AS `categoria`,sum(`rv`.`quantidade`) AS `quantidade_vendida`,sum(`rv`.`valor_total_item`) AS `faturamento`,round(sum((`rv`.`quantidade` * `p`.`custo_unitario`)),2) AS `custo_total`,round((sum(`rv`.`valor_total_item`) - sum((`rv`.`quantidade` * `p`.`custo_unitario`))),2) AS `lucro_bruto`,round((((sum(`rv`.`valor_total_item`) - sum((`rv`.`quantidade` * `p`.`custo_unitario`))) / sum(`rv`.`valor_total_item`)) * 100),2) AS `margem_lucro` from (`relatorio_vendas_v2` `rv` join `produtos` `p` on((`rv`.`id_produto` = `p`.`id`))) group by `p`.`id`,`p`.`produto`,`p`.`categoria` order by `lucro_bruto` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_valor_estoque`
--

/*!50001 DROP VIEW IF EXISTS `vw_valor_estoque`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_valor_estoque` AS select `produtos`.`id` AS `id`,`produtos`.`produto` AS `produto`,`produtos`.`categoria` AS `categoria`,`produtos`.`estoque_atual` AS `estoque_atual`,`produtos`.`custo_unitario` AS `custo_unitario`,`produtos`.`preco_venda` AS `preco_venda`,round((`produtos`.`estoque_atual` * `produtos`.`custo_unitario`),2) AS `valor_investido`,round((`produtos`.`estoque_atual` * `produtos`.`preco_venda`),2) AS `valor_venda`,round((`produtos`.`estoque_atual` * `produtos`.`lucro`),2) AS `lucro_potencial` from `produtos` order by round((`produtos`.`estoque_atual` * `produtos`.`custo_unitario`),2) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-12 16:52:52
