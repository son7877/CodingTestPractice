-- 코드를 입력하세요
select i.FLAVOR
from ICECREAM_INFO i
inner join FIRST_HALF f on i.FLAVOR = f.FLAVOR
WHERE f.TOTAL_ORDER > 3000 and i.INGREDIENT_TYPE = "fruit_based"