DELIMITER $$
CREATE PROCEDURE addbook(
in title_temp varchar(50),
in author_temp varchar(50),
in edition_temp int,
in released_temp int,
in price_temp int,
in class_temp int,
in count_temp int
)
begin
 IF exists (select 1 from books where title = title_temp and author = author_temp and released = released_temp and price = price_temp and class = class_temp and edition = edition_temp )THEN
  update bookstore
  set count = count + count_temp
  where title = title_temp;

else
 insert into books (title,author,edition,released,price,class) values (title_temp,author_temp,edition_temp,released_temp,price_temp,class_temp);
 insert into bookstore (title,count) values (title_temp,count_temp);
 end if;

END$$
DELIMITER 

 call addbook('cyka','blyat',1,1378,40,1,3);
 select * from bookstore;
 
 drop procedure addbook;
 select * from books;