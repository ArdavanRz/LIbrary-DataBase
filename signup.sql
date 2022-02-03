insert into systeminfo VALUES ('farhad',AES_ENCRYPT('mytext','passw'),1377102);

DELIMITER $$
CREATE PROCEDURE signup(
  in username_temp varchar(50),
  in pass_temp binary(16),
  in creation_temp int)
  begin
  start transaction;
  IF NOT exists ( SELECT 1 FROM systeminfo WHERE username = username_temp ) THEN
  insert into systeminfo(username,pass,creation) values(username_temp,AES_ENCRYPT(pass_temp,'passw'),creation_temp);
  SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'account succesfully added';
  commit;
  else
   SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'username already exists';
  rollback;
  end if;
  END$$
DELIMITER ;

call SignUp('ali','lol','1377');
drop procedure signup;
delete from systeminfo;
select * from systeminfo;











