DELIMITER $$
CREATE PROCEDURE charge(
in money int,
in username_temp varchar(50))
begin
 IF exists ( SELECT 1 FROM systeminfo WHERE username = username_temp AND strcmp(tag,'0') ) AND money > 0 THEN
  update systeminfo
  set funds =  money 
  where username = username_temp;
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'funds added';
end if;

 IF exists ( SELECT 1 FROM systeminfo WHERE username = username_temp AND strcmp(tag,'0') ) AND money < 0 THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'invalid amount';
end if;

IF not exists ( SELECT 1 FROM systeminfo WHERE username = username_temp ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'account not found';
end if;

 IF exists ( SELECT 1 FROM systeminfo WHERE username = username_temp AND strcmp(tag,concat(username_temp,creation)) ) AND (money > 0 or money < 0) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'please login first';
end if;



END$$
DELIMITER 

call charge(50,'ali');
drop procedure charge;

