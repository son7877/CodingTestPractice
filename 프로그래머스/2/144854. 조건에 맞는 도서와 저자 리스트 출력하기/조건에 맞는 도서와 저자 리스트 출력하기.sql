-- 코드를 입력하세요
select B.BOOK_ID, A.AUTHOR_NAME, date_format(B.PUBLISHED_DATE, '%Y-%m-%d') as PUBLISHED_DATE
from BOOK B
inner join AUTHOR A on B.AUTHOR_ID = A.AUTHOR_ID
where B.CATEGORY = '경제'
order by PUBLISHED_DATE