-- 코드를 입력하세요
select
   concat(
      '/home/grep/src/',
      f.BOARD_ID, '/',
      f.FILE_ID,
      f.FILE_NAME,
      f.FILE_EXT
   )
   as 'FILE_PATH'
from USED_GOODS_BOARD b
inner join USED_GOODS_FILE f on b.BOARD_ID = f.BOARD_ID
where b.VIEWS = (
   select max(VIEWS)
   from USED_GOODS_BOARD
)
order by f.FILE_ID desc