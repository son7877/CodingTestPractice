-- 코드를 작성해주세요
select ID, EMAIL, FIRST_NAME, LAST_NAME
from DEVELOPER_INFOS
where 'Python' IN (SKILL_1, SKILL_2, SKILL_3) 
order by ID