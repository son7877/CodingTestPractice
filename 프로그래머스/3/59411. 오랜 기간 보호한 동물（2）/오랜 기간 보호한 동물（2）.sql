-- 코드를 입력하세요
select I.ANIMAL_ID, I.NAME
from ANIMAL_INS I
inner join ANIMAL_OUTS O on I.ANIMAL_ID = O.ANIMAL_ID
order by datediff(O.DATETIME, I.DATETIME) desc
limit 2
