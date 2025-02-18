-- 코드를 입력하세요
select DATETIME as '시간'
from ANIMAL_INS
where DATETIME = (
   select max(DATETIME)
   from ANIMAL_INS
)