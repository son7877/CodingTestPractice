-- 코드를 입력하세요
select BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') as PUBLISHED_DATE
from BOOK
where CATEGORY = '인문' and year(PUBLISHED_DATE) = 2021