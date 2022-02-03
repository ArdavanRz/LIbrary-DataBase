DELIMITER $$
CREATE PROCEDURE edit(
  in name_temp varchar(50),
  in username_temp varchar(50),
  in id_temp int,
  in tele_temp int,
  in job_temp int,
  in job_id int,
  in uni_temp varchar(10))
  begin

   IF job_temp = 1 and exists ( SELECT 1 FROM nonacademic WHERE nam = name_temp) THEN
   update nonacademic
   set nam = name_temp, surname = username_temp , id = id_temp , tele = tele_temp, occupation = job_temp
   where nam = name_temp;
   end if;
   
   IF job_temp = 1 and not exists ( SELECT 1 FROM nonacademic WHERE nam = name_temp) THEN
   insert into nonacademic(nam,surname,id,tele,address,occupation) values (name_temp,username_temp,id_temp,tele_temp,'?',job_temp);
   end if;
   
      IF job_temp = 2 and exists ( SELECT 1 FROM student WHERE nam = name_temp) THEN
   update student
   set nam = name_temp, surname = username_temp , id = id_temp , tele = tele_temp, studentid = job_id , uni = uni_temp
   where nam = name_temp;
   end if;
   
   IF job_temp = 2 and not exists ( SELECT 1 FROM student WHERE nam = name_temp) THEN
   insert into student(nam,surname,id,tele,address,studentid,uni) values (name_temp,username_temp,id_temp,tele_temp,'?',job_id,uni_temp);
   end if;
   
      IF job_temp = 3 and exists ( SELECT 1 FROM proff WHERE nam = name_temp) THEN
   update proff
   set nam = name_temp, surname = username_temp , id = id_temp , tele = tele_temp, proffid = job_id , uni = uni_temp
   where nam = name_temp;
   end if;
   
   IF job_temp = 3 and not exists ( SELECT 1 FROM nonacademic WHERE nam = name_temp) THEN
   insert into proff(nam,surname,id,tele,address,proffid,uni) values (name_temp,username_temp,id_temp,tele_temp,'?',job_id,uni_temp);
   end if;
   
   
  END$$
DELIMITER ;

call edit('roham','roham',754,333,1,2,'aut');
select * from nonacademic;
drop procedure edit;