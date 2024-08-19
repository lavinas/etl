use vooo_migration;

-- insert into aggregator_ref
insert into aggregator_ref (id) values (11);


-- insert into client_ref
insert into client_ref (id) values (1507); -- epag
insert into client_ref (id) values (2210); -- tradio


-- insert into job
insert into job (id, name, type, action, base, object, field, last, limit) values (100, 'initial_load', 'table', 'loadClient', 'vooo_migration', 'client_ref', 'id', 0, 30000);
insert into job (id, name, type, action, base, object, field, last, limit) values (200, 'cliente', 'table', 'copy', 'vooo_prod_backend', 'client', 'id', 0, 30000);
insert into job (id, name, type, action, base, object, field, last, limit) values (300, 'document', 'table', 'copy', 'vooo_prod_backend', 'document', 'id', 0, 30000);
insert into job (id, name, type, action, base, object, field, last, limit) values (400, 'connection', 'table', 'copy', 'vooo_prod_backend', 'connection', 'connection_id', 112705476, 30000);
insert into job (id, name, type, action, base, object, field, last, `limit`) values (500, 'connection_item', 'table', 'copy', 'vooo_prod_backend', 'connection_item', 'item_id', 824131765, 30000);
insert into job (id, name, type, action, base, object, field, last, `limit`) values (600, 'connection_item', 'table', 'update', 'vooo_prod_backend', 'connection_item', 'item_id', 824131765, 30000);

-- insert into reference
insert into reference (referrer, referred, field_referrer, field_referred) values (200, 100, 'id', 'id');
insert into reference (referrer, referred, field_referrer, field_referred) values (300, 200, 'id', 'id_document');
insert into reference (referrer, referred, field_referrer, field_referred) values (400, 200, 'id_client', 'id');
insert into reference (referrer, referred, field_referrer, field_referred) values (500, 400, 'connection_id', 'connection_id');
insert into reference (referrer, referred, field_referrer, field_referred) values (600, 500, 'item_id', 'item_id');


commit;