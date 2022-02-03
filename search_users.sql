DELIMITER $$
CREATE PROCEDURE users(
in username_temp varchar(50),
in pass_temp int,
in name_temp varchar(50),
in surname_temp varchar(50)
)

begin
declare access int;
if (username_temp = 'librarian' and pass_temp = 213060) or (username_temp = 'manager' and pass_temp = 1421) then
 set access = 1;
end if;

if access =1 then
select *
from nonacademic
where nam = name_temp or surname = surname_temp
order by surname;
end if;

if access =1 then
select *
from student
where nam = name_temp or surname = surname_temp
order by surname;
end if;

if access =1 then
select *
from proff
where nam = name_temp or surname = surname_temp
order by surname;
end if;
END$$
DELIMITER 
