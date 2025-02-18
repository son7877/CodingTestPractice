-- 코드를 작성해주세요
select A.ID, 
   case
      when b.PCT <= 0.25 then 'CRITICAL'
      when b.PCT <= 0.5 then 'HIGH'
      when b.PCT <= 0.75 then 'MEDIUM'
      else 'LOW'
   end as COLONY_NAME
from ECOLI_DATA a
JOIN (
   select ID, PERCENT_RANK() over (order by SIZE_OF_COLONY desc) as PCT
   from ECOLI_DATA
) b
ON a.ID = b.ID
ORDER BY a.ID