select * from layoffs;
select count(*) from layoffs; 
with layoffs as (
select  *,
 row_number()over (partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as id
 from layoffs)
 select * from layoffs  order by id desc;  
 -- lets check if the duplicate are true
 select * from layoffs where company = 'casper';
 
 -- create a new table similar to the original table and adding id to the original table, add new column to the id,import temporary data to it and delete,
 
 CREATE TABLE `layoffs100` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `id` int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

  delete  from layoffs100  where id>1;
  select * from layoffs;
 insert into layoffs100 
 with layoffs as (
select  *,
 row_number()over (partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as id
 from layoffs)
 select * from layoffs;
 select  count(*) from layoffs100;
 
 -- STANDARDIZE
 select * from layoffs100;
 select distinct industry from layoffs100 order by industry asc;
 select *  from layoffs100 where industry like 'Crypto%';
update layoffs100 
set industry = 'Crypto' 
 where industry like 'crypto%';
 select * from layoffs100 where industry like 'Crypto%';
 select distinct industry from layoffs100 where industry like 'Crypto%';
 select distinct country, trim(trailing '.'from country) from layoffs100;
 update layoffs100 
 set country =  trim(trailing '.'from country)
 where country like 'United state%';
 select distinct country from layoffs100 where country like 'united states%';

-- update date from text to date
select date from layoffs100;

SELECT `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs100;
update layoffs100
set `date` = str_to_date(`date` , '%m/%d/%Y');

ALTER TABLE LAYOFFS100
MODIFY COLUMN `DATE` DATE;

-- handling missing values 
-- 	code to check missing values
select company from layoffs100
where company is null or company = ''; -- has blank and null values

select industry from layoffs100








