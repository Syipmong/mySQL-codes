create schema school;

create table school.student (
    id int primary key,
    name varchar(20)
);
insert into school.student values
(1, 'Alice'),
(2, 'Bob'),
(3, 'Cindy');

create table school.course (
    id int primary key,
    name varchar(20)
);
insert into school.course values
(1, 'Math'),
(2, 'English'),
(3, 'Chinese');