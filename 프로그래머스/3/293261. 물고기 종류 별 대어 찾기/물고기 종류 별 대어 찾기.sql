select a.ID, b.FISH_NAME, a.LENGTH
from FISH_INFO a
inner join FISH_NAME_INFO b on a.FISH_TYPE = b.FISH_TYPE
where a.LENGTH = (
   select max(LENGTH)
   from FISH_INFO
   where FISH_TYPE = a.FISH_TYPE
)
order by a.ID