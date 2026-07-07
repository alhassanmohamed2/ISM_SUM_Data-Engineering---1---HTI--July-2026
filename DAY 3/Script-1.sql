-- test_iti.users definition

CREATE TABLE `users` (
  `first_name` varchar(50) DEFAULT NULL  ,
  `age` smallint DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` char(1) DEFAULT 'M',
  `national_id` char(14) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  
  
  
  UNIQUE KEY `national_id` (`national_id`),
  CONSTRAINT `age_range` CHECK (((`age` > 0) and (`age` <= 120))),
  CONSTRAINT `chk_ND_length` CHECK ((char_length(`national_id`) = 14))
) 