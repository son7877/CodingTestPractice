-- 코드를 입력하세요
select A.NAME, A.DATETIME
from ANIMAL_INS A
where A.ANIMAL_ID not in (
   select ANIMAL_ID
   from ANIMAL_OUTS
)
order by A.DATETIME
limit 3
