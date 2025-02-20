-- 코드를 입력하세요
select B.CATEGORY, sum(S.SALES) as TOTAL_SALES
from BOOK B
inner join BOOK_SALES S on B.BOOK_ID = S.BOOK_ID
where S.SALES_DATE LIKE '2022-01%'
group by B.CATEGORY
order by B.CATEGORY