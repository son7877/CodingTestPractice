 select distinct a.ID, a.EMAIL, a.FIRST_NAME, a.LAST_NAME
 from DEVELOPERS a, SKILLCODES b
 where b.NAME in ('Python', 'C#') and (a.SKILL_CODE & b.CODE) > 0
 order by a.ID;