-- 코드를 입력하세요
select U.USER_ID, U.NICKNAME, sum(B.PRICE) as TOTAL_SALES
from USED_GOODS_USER U
inner join USED_GOODS_BOARD B on U.USER_ID = B.WRITER_ID
where b.STATUS = 'DONE'
group by U.USER_ID
having TOTAL_SALES >= 700000
order by TOTAL_SALES
