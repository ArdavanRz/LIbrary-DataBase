DELIMITER $$
CREATE PROCEDURE req(
in username_temp varchar(50),
in title_temp varchar(50),
in date_temp int,
in job_temp int
)

begin
DECLARE permit int;
declare cost int;
set cost = (select price from books where title = title_temp);
 IF exists ( SELECT 1 FROM systeminfo WHERE username = username_temp AND strcmp(tag,'0') AND penalty < 4 and funds > cost) THEN
  set permit = 1;
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'permission granted';
end if;

IF exists ( SELECT 1 FROM systeminfo WHERE username = username_temp AND strcmp(tag,'0') AND penalty < 4 and funds < cost) THEN
  set permit = 0;
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'low funds';
end if; 

IF exists ( SELECT 1 FROM systeminfo WHERE username = username_temp AND strcmp(tag,'0') AND penalty > 4 and funds < cost) THEN
  set permit = 0;
  insert into requests(username,title,due_date,state) values (username_temp,title_temp,date_temp,'penalty');
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'permission denied';
end if; 

IF (exists (SELECT 1 FROM books WHERE title = title_temp AND class = job_temp)) and (permit = 1) and (exists (select 1 from bookstore where title = title_temp and count > 0)) THEN
  insert into requests(username,title,due_date,state) values (username_temp,title_temp,date_temp,'success');
  
  update bookstore
  set count = count - 1
  where title = title_temp;
  
  update systeminfo
  set funds = funds - cost
  where uername = user_temp;
 
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'borrow complete';
end if;

IF (exists (SELECT 1 FROM books WHERE title = title_temp AND class = job_temp)) and (permit = 1) and (exists (select 1 from bookstore where title = title_temp and count < 0)) THEN
  insert into requests(username,title,due_date,state) values (username_temp,title_temp,date_temp,'out of stock');
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'out of stock';
end if;






END$$
DELIMITER 