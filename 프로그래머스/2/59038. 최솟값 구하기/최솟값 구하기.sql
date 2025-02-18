-- 코드를 입력하세요
select DATETIME as '시간'
from ANIMAL_INS
where DATETIME = (
   select min(DATETIME)
   from ANIMAL_INS
)