use test_iti;


-- 
-- 
INSERT INTO users 
VALUES('RANA', '25', '1999:12:12', '0','24781122339874', CURRENT_TIMESTAMP);
-- 
select * from users


ALTER TABLE users
RENAME COLUMN gender to is_male;



UPDATE users
set is_male = 0
WHERE national_id = '24781122339874';

select * from users


ALTER TABLE users
MODIFY COLUMN is_male boolean


