-- 코드를 입력하세요
select floor(PRICE/10000) * 10000 as 'PRICE', count(*) as 'PRODUCTS'
from PRODUCT
group by floor(PRICE/10000)
order by PRICE