DELIMITER $$
CREATE PROCEDURE search(
in title_temp varchar(50),
in author_temp varchar(50),
in edition_temp int,
in date_temp int
)
begin
select *
from books
where title = title_temp or author = author_temp or edition = edition_temp xor released = date_temp 
order by title;
END$$
DELIMITER 

insert into books values('bilakh','ostad',1,1378,6000,2);
delete from books;
call search('bilakh',null,null,null);
drop procedure search;