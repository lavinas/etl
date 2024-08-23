-- INSERTING INITIAL DATA
use vooo_prod_backend;


SET FOREIGN_KEY_CHECKS = 0;
-- aggregator
INSERT INTO `aggregator` (`id`,`id_client`,`name`) VALUES (11,1076,'Destaxa');
-- client
INSERT INTO `client` (`id`,`economic_group_id`,`id_address`,`id_contact`,`id_document`,`id_author`,`headquarter_id`,`id_aggregator`,`name`,`trading`,`brand`,`status`,`created_at`,`updated_at`) VALUES (1076,NULL,NULL,NULL,1076,1,NULL,11,'Nexu','Nexu Tecnologia Em Capturas E Processamento De Transacoes Ltda','Nexu',1,'2020-08-18 20:20:05','2020-08-20 08:59:50');
INSERT INTO `client` (`id`,`economic_group_id`,`id_address`,`id_contact`,`id_document`,`id_author`,`headquarter_id`,`id_aggregator`,`name`,`trading`,`brand`,`status`,`created_at`,`updated_at`) VALUES (1507,NULL,NULL,NULL,1507,3579,NULL,1,'EPLP Tecnologia de Pagamentos LTDA','EPLP Tecnologia de Pagamentos LTDA','EPAG',1,'2021-10-14 12:05:35','2021-10-25 18:37:21');
INSERT INTO `client` (`id`,`economic_group_id`,`id_address`,`id_contact`,`id_document`,`id_author`,`headquarter_id`,`id_aggregator`,`name`,`trading`,`brand`,`status`,`created_at`,`updated_at`) VALUES (2210,NULL,NULL,NULL,2207,3579,NULL,1,'Tradio Pagamentos Ltda','Tradio Pagamentos Ltda','Tradio Bank',1,'2023-11-09 17:31:55','2023-11-13 13:13:48');


SET FOREIGN_KEY_CHECKS = 1;


-- INSERTING MIGRATION OBJECTS


use vooo_prod_migration;


-- jobs
insert into job (id, name, type, action, base, object, field, last, `limit`) values (100, 'vooo_prod_backend.aggregador', 'table', 'none', 'vooo_prod_backend', 'aggregator', 'id', 0, 5000);
insert into job (id, name, type, action, base, object, field, last, `limit`) values (200, 'vooo_prod_backend.client', 'table', 'copy', 'vooo_prod_backend', 'client', 'id', 0, 5000);

insert into job (id, name, type, action, base, object, field, last, `limit`) values (900, 'vooo_prod_backend.card_flag', 'table', 'copy', 'vooo_prod_backend', 'card_flag', 'card_flag_id', -1, 5000);

insert into job (id, name, type, action, base, object, field, last, `limit`) values (300, 'vooo_prod_backend.address', 'table', 'copy', 'vooo_prod_backend', 'client', 'id', 0, 5000);




-- reference
insert into reference(referrer, referred, field_referrer, field_referred) values (200, 100, 'id_aggregator', 'id');
insert into reference(referrer, referred, field_referrer, field_referred) values (300, 200, 'id', 'id_address');



commit;