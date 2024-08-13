use vooo_migration;

-- insert into aggregator_ref
insert into aggregator_ref (id) values (11);


-- insert into client_ref
insert into client_ref (id) values (1507); -- epag
insert into client_ref (id) values (2210); -- tradio


insert into job (id, name, type, action, base, object, field, last) values (100, 'cliente load', 'table', 'loadClient', 'vooo_migration', 'client_ref', 'id', 0);
insert into job (id, name, type, action, base, object, field, last) values (200, 'cliente copy', 'table', 'copy', 'vooo_prod_backend', 'client', 'id', 0);
insert into job (id, name, type, action, base, object, field, last) values (300, 'document copy', 'table', 'copy', 'vooo_prod_backend', 'document', 'id', 0);

insert into reference (referrer, referred, field_referrer, field_referred) values (200, 100, 'id', 'id');
insert into reference (referrer, referred, field_referrer, field_referred) values (300, 200, 'id', 'id_document');

commit;