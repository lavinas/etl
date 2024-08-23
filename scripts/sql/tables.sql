select a.table_schema, a.table_name, c.unique_constraint_schema, c.referenced_table_name
  from information_schema.tables a
left join information_schema.table_constraints b 
   on b.table_schema = a.table_schema 
  and b.table_name = a.table_name
  and b.constraint_type = 'FOREIGN KEY'
left join information_schema.referential_constraints c
   on c.constraint_schema = b.constraint_schema
  and c.constraint_name = b.constraint_name
where not (a.table_name like 'tmp_%' or a.table_name like 'temp_%' or a.table_name like 'analise%' or a.table_name = 'mercadopago_transacao31.03')
  and  a.table_schema in (
'vooo_prod_backend'
) ;


select * from information_schema.table_constraints b


 