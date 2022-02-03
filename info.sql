DELIMITER $$
CREATE PROCEDURE info(
in username_temp varchar(50),
in id_temp int,
in job_temp int)
begin

if job_temp=1 then
select * from systeminfo
where username = username_temp;
select * from nonacademic
where id = id_temp;
end if;

if job_temp=2 then
select * from systeminfo
where username = username_temp;
select * from student
where id = id_temp;
end if;

if job_temp=3 then
select * from systeminfo
where username = username_temp;
select * from proff
where id = id_temp;
end if;


END$$
DELIMITER ;

call info('roham',754,1);
drop procedure info;