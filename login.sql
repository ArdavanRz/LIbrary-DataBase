DELIMITER $$
CREATE PROCEDURE login(
  in username_temp varchar(50),
  in pass_temp binary(16))
  begin
  IF NOT exists ( SELECT 1 FROM systeminfo WHERE username = username_temp ) THEN
  SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'username does not exist';
  end if;
  
IF exists ( SELECT 0 FROM systeminfo WHERE username = username_temp AND pass = AES_ENCRYPT(pass_temp,'passw') and strcmp(tag,concat(username_temp,creation)) ) THEN
UPDATE systeminfo
SET tag = concat(username_temp,creation)
WHERE username = username_temp;
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'logged in';
end if;

  IF exists ( SELECT 1 FROM systeminfo WHERE username = username_temp AND pass != AES_ENCRYPT(pass_temp,'passw') ) THEN

  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'wrong password';
end if;
  

   IF exists ( SELECT 1 FROM systeminfo WHERE username = username_temp and pass = AES_ENCRYPT(pass_temp,'passw') and strcmp(tag,'0')   ) THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'already logged in';
end if;
 
  
  END$$
DELIMITER ;

call login('ali','lol');
drop procedure login;
select * from systeminfo;


