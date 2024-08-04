-- Active: 1722460741017@@mysql.vooo.ws@3306@vooo_prod_backend




create table tmp_migra_control as
select b.client_id, b.connector_id, a.id_aggregator, 0 item_id
  from client a
inner join client_connector b on b.client_id = a.id
where a.id_aggregator = 11 or a.id in (2210, 1507);

select * from tmp_migra_control;

select min(a.connection_id)
  from connection a
inner join connection_item 
where a.client_id = 1922 and a.connector_id = 407 

select * from tmp_migra_control where connector_id = 407;


select *
  from connector a
where a.name like '%rede%';



select connection_id
  from connection a
where a.connection_id >= 100000 and a.connection_id < 101000;


select max(connection_id)
  from connection;





select max(output_id)
  from output_