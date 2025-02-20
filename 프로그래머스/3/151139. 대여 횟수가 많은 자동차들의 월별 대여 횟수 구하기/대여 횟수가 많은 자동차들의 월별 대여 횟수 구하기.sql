-- 코드를 입력하세요
select month(START_DATE) as MONTH, CAR_ID, count(*) as RECORDS
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where CAR_ID in (
   select CAR_ID
   from CAR_RENTAL_COMPANY_RENTAL_HISTORY
   where year(START_DATE) = 2022 and month(START_DATE) between 8 and 10
   group by CAR_ID
   having count(*) >= 5
) and year(START_DATE) = 2022 and month(START_DATE) between 8 and 10
group by month(START_DATE), CAR_ID
order by MONTH, CAR_ID desc