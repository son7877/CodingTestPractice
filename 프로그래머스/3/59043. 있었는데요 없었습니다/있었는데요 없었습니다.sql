-- 코드를 입력하세요
select A.ANIMAL_ID, A.NAME
from ANIMAL_INS A
inner join ANIMAL_OUTS O on A.ANIMAL_ID = O.ANIMAL_ID
where A.DATETIME > O.DATETIME
order by A.DATETIME