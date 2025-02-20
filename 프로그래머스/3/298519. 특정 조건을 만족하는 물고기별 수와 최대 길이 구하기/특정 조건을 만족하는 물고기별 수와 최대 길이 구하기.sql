-- 코드를 작성해주세요
select 
   count(*) as FISH_COUNT, 
   max(LENGTH) as MAX_LENGTH, 
   FISH_TYPE
from FISH_INFO
group by FISH_TYPE
having 
   sum(if(LENGTH is null, 0 , if(length <= 10, 10, length))) / count(length) >= 33
order by FISH_TYPE