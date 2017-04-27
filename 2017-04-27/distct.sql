--distinct (증복행의 제거)
--총 타이틀 로우수
select count(title) from titles;
--타이틀 중복된것 제외
select count(distinct title) from titles;

--cf distinct
select DISTINCT title from titles;
