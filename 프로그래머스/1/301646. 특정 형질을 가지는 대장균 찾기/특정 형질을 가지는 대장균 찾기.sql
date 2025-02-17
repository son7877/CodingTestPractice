-- 코드를 작성해주세요
select count(*) as COUNT
from ECOLI_DATA
where 1=1
    AND (2 != (GENOTYPE & 2))  
    AND (((4 & GENOTYPE) = 4) OR (( 1 & GENOTYPE ) = 1))