-- 코드를 입력하세요
select A.ANIMAL_ID, A.NAME
from ANIMAL_OUTS A
where A.ANIMAL_ID not in (
   select ANIMAL_ID
   from ANIMAL_INS
)
order by A.ANIMAL_ID