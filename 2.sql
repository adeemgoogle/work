
SELECT
    name,
    setting,
    context
FROM pg_settings
WHERE name IN ('wal_level','max_wal_senders','max_replication_slots');


CREATE ROLE kafka_replica WITH superuser login PASSWORD 'kafka_replica';
CREATE SCHEMA debezium_info;
CREATE TABLE debezium_info.heartbeat (id serial PRIMARY KEY, date_load TIMESTAMPTZ DEFAULT NOW() );
create table departments(
    dep_id int primary key ,
    dept_name text
);
insert into departments values(1, 'development');
insert into departments values (2, 'снабжение');
SELECT *
FROM debezium_info.heartbeat;


CREATE PUBLICATION dbz_publication
FOR TABLE debezium_info.heartbeat, departments;

SELECT *
FROM pg_replication_slots;