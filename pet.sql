--show 문
show tables;

--drop table 문
drop table pet;

--create table 문
create table pet(
	name varchar(20),
	owner varchar(20),
	species varchar(20),
	gender char(1),
	death date,
	birth date
);

desc pet;

--insert 문
insert 
into pet values ('fluffy', 'harold', 'cat', 'f', '1990-02-03', null) ;

insert into pet(name,species)
values('fluffy', 'dog');

--delete 문
delete from pet;

--update

--select 문
select name, owner, species, gender, birth, death from pet;
--select * from pet where name = "Bowser";
select name, owner, species, gender, birth, death from pet
where name="Bowser";

--98년 이후
select * from pet where birth>="1998-1-1" ; 
--dog와 성별이 f
select *from pet where species = "dog" and gender = "f" ;
--새나 뱀
select * from pet where species = "bird" or species ="snake" ;
--정방향(디폴트)
select * from pet order by birth asc ;
--역순
select * from pet order by birth desc ;

select name, birth, death from pet where death is not null ;

--b로시작하는 name에서의 필드
select name from pet where name like "b%";
--y로끝나는 필드
select name from pet where name like "%y";
--c를포함한 필드
select name from pet where name like "%c%";
--S로시작하는 4자리 문자 
select name from pet where name like "S___";
--로우가 몇개인지
select count(*) from pet ;

--load data from txt 문
load data local infile "d:/pet.txt" into table pet
fields terminated by ","
lines terminated by "\n";
