create table Library(

branch_id int,
Address varchar(50),
Phone_number int,
primary key(Branch_ID)
);

create table Publishers(
publisher_id varchar(30),
address varchar(50),
site varchar(30),
primary key(publisher_id)
);

create table Books(
title varchar(50),
author varchar(50),
edition int,
released int,
price int,
class int
);

create table nonacademic(
nam varchar(10),
surname varchar(10),
id int,
tele int,
address varchar(50),
occupation varchar(10),
primary key(id)
);


create table Student(
nam varchar(10),
surname varchar(10),
id int,
tele int,
address varchar(50),
studentid int,
uni varchar(20),
primary key(id)
);


create table Proff(
nam varchar(10),
surname varchar(10),
id int,
tele int,
address varchar(50),
proffid int,
uni varchar(20),
primary key(id)
);

create table systeminfo(
username varchar(50),
pass binary(32),
creation int,
tag varchar(10) default '0',
funds int,
penalty int
);

create table systeminfo_temp(
username varchar(50),
pass binary(16),
creation int,
pocket int
);

create table bookstore(
title varchar(50),
count int
);

create table requests(
username varchar(50),
title varchar(50),
due_date int,
state varchar(20)
);

create table borrowed(
title varchar(50),
due datetime
);

create table manager(
main_manager varchar(50),
pass binary(32)
);

create table librarian(
employee varchar(50),
pass binary(32)
);

create table msg(
msg varchar(100)


);

delimiter |

CREATE TRIGGER msg_upt after INSERT ON requests
  FOR EACH ROW
  BEGIN
    insert into msg (msg) values (concat(new.username,new.title,new.state));

  END;
|

delimiter ;

