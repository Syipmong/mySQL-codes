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

create table school.student_course (
    student_id int,
    course_id int,
    primary key (student_id, course_id),
    foreign key (student_id) references school.student(id),
    foreign key (course_id) references school.course(id)
);

insert into school.student_course values
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3);
```