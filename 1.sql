create table employee(
    employee_id int primary key,
    first_name text,
    last_name text,
    starts_work date,
    position_id int,
    dept_name_id int,
    salary float,
    foreign key (position_id) references positions(id_post),
    foreign key (dept_name_id) references departments(dep_id)
);
drop table employee;

create table departments(
    dep_id int primary key ,
    dept_name text
);
drop table departments;

create table positions(
    id_post int primary key ,
    pos_name varchar ,
    salary float
);

drop table positions;

insert into departments values(1, 'development');
insert into departments values (2, 'снабжение');

insert into positions values (1, 'data eng');
insert into positions values (2, 'Дизайнер');
insert into positions values (3, 'менеджер');

insert into employee values(1,'Адема', 'Бахытова', '23/09/2022', 1, 1, 60000);
insert into employee values(2, 'Давид', 'Микеланджело', '22/02/2021', 2, 1, 110000 );
insert into employee values(3, 'Давид', 'Данателло', '25/11/2021', 1, 1, 120000 );
insert into employee values(4, 'Dimash', 'Tl', '29/06/2022', 3, 2, 250000);
insert into employee values (5, 'Alem', 'babik', '2021/09/19', 2, 2, 133000);
insert into employee values (6, 'Aza', 'Ib', '2021/09/11', 1,2,30000);
insert into employee values (7, 'Aza', 'Ib', '2021/09/11', 3,1,30000)


--1
select e.first_name, e.last_name, e.salary, p.pos_name from employee e, positions p where e.position_id = p.id_post and
                                                                                          first_name='Давид';
--2
select d.dept_name, avg(e.salary)  from employee e, departments d where d.dep_id = e.dept_name_id group by d.dep_id;

--3 
select pos_name,avg(e.salary)  from employee e, positions p  where  p.id_post= e.position_id group by p.pos_name ;
