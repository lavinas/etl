-- INSERTING INITIAL DATA
use vooo_prod_backend;
SET FOREIGN_KEY_CHECKS = 0;
-- aggregator
INSERT INTO `aggregator` (`id`,`id_client`,`name`) VALUES (11,1076,'Destaxa');
-- client
INSERT INTO `client` (`id`,`economic_group_id`,`id_address`,`id_contact`,`id_document`,`id_author`,`headquarter_id`,`id_aggregator`,`name`,`trading`,`brand`,`status`,`created_at`,`updated_at`) VALUES (1076,NULL,NULL,NULL,1076,1,NULL,11,'Nexu','Nexu Tecnologia Em Capturas E Processamento De Transacoes Ltda','Nexu',1,'2020-08-18 20:20:05','2020-08-20 08:59:50');
INSERT INTO `client` (`id`,`economic_group_id`,`id_address`,`id_contact`,`id_document`,`id_author`,`headquarter_id`,`id_aggregator`,`name`,`trading`,`brand`,`status`,`created_at`,`updated_at`) VALUES (1507,NULL,NULL,NULL,1507,3579,NULL,1,'EPLP Tecnologia de Pagamentos LTDA','EPLP Tecnologia de Pagamentos LTDA','EPAG',1,'2021-10-14 12:05:35','2021-10-25 18:37:21');
INSERT INTO `client` (`id`,`economic_group_id`,`id_address`,`id_contact`,`id_document`,`id_author`,`headquarter_id`,`id_aggregator`,`name`,`trading`,`brand`,`status`,`created_at`,`updated_at`) VALUES (2210,NULL,NULL,NULL,2207,3579,NULL,1,'Tradio Pagamentos Ltda','Tradio Pagamentos Ltda','Tradio Bank',1,'2023-11-09 17:31:55','2023-11-13 13:13:48');
#user
INSERT INTO `user` (`id`,`id_client`,`id_role`,`id_contact`,`headquarter_id`,`id_aggregator`,`username`,`email`,`password`,`status`,`created_at`,`updated_at`,`last_access_date`,`last_password_change_date`) VALUES (1,NULL,1,NULL,NULL,1,'Vooo','vooo@vooo.com.br','$2b$13$7XiJFkFH11aVeTUHnYRCZ.pmpzKjrwJIFrqE2uXneRPr5bTIJk442',1,'2016-10-07 23:28:02','2023-05-29 10:54:03','2024-08-23 17:17:24','2083-08-28');
INSERT INTO `user_control` (`id`,`client_id`,`user_id`,`time_window_in_minutes`,`password_days_to_expire`,`description`) VALUES (0,NULL,NULL,30,90,'Tempo padrão, caso não tenha customização');
SET FOREIGN_KEY_CHECKS = 1;


## insert no final do processamento
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `aggregator` (`id`,`id_client`,`name`) VALUES (1,0,'Vooo');
INSERT INTO `document` (`id`,`type`,`number`,`created_at`,`updated_at`) VALUES (0,'CNPJ',23659971000143,'2016-01-01 00:00:00','2016-01-01 00:00:00');
INSERT INTO `client` (`id`,`economic_group_id`,`id_address`,`id_contact`,`id_document`,`id_author`,`headquarter_id`,`id_aggregator`,`name`,`trading`,`brand`,`status`,`created_at`,`updated_at`) VALUES (0,NULL,NULL,NULL,0,1,NULL,1,'Vooo','Vooo Servicos de Controle e Gestao Ltda','Vooo',0,'2016-01-01 00:00:00','2023-04-20 12:25:56');

INSERT INTO `user` (`id`,`id_client`,`id_role`,`id_contact`,`headquarter_id`,`id_aggregator`,`username`,`email`,`password`,`status`,`created_at`,`updated_at`,`last_access_date`,`last_password_change_date`) VALUES (1,NULL,1,NULL,NULL,1,'Vooo','vooo@vooo.com.br','$2b$13$7XiJFkFH11aVeTUHnYRCZ.pmpzKjrwJIFrqE2uXneRPr5bTIJk442',1,'2016-10-07 23:28:02','2023-05-29 10:54:03','2024-09-09 18:38:10','2083-08-28');
SET FOREIGN_KEY_CHECKS = 1;
