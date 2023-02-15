select name, founded_at, founded_at_clean, str_to_date(founded_at, '%m/%d/%y') as found_date FROM crunchbase_companies_clean_data
order by found_date;

select name,founded_at,founded_at_clean from crunchbase_companies_clean_data
where founded_at is null;

# update kolom founded_at
update crunchbase_companies_clean_data
set founded_at=str_to_date(founded_at, '%m/%d/%y');
alter TABLE crunchbase_companies_clean_data
modify founded_at DATE

SELECT name, founded_at, founded_at_clean from crunchbase_companies_clean_data
order by founded_at DESC;

select founded_at,
extract(year from founded_at) Tahun
from crunchbase_companies_clean_data
order by founded_at desc;

select founded_at_clean,
extract(year from founded_at_clean) Tahun
from crunchbase_companies_clean_data
order by founded_at_clean desc;

select timestampdiff(year,founded_at,CURRENT_DATE) Usia_Company,
founded_at
from crunchbase_companies_clean_data
order by founded_at DESC;

select concat(timestampdiff(year,founded_at,CURRENT_DATE), ' Tahun atau ',
              timestampdiff(month,founded_at,CURRENT_DATE), ' Bulan') Usia_Company,
founded_at
from crunchbase_companies_clean_data
order by founded_at DESC;

select CURRENT_DATE as date,
current_time as time,
CURRENT_TIMESTAMP as timestamp,
LOCALTIME as local_time,
LOCALTIMESTAMP as local_timestamp,
NOW() as now
from crunchbase_companies_clean_data;

# contoh handling missing value, date yg kosong diisi dengan current date
select founded_at, founded_at_clean,
COALESCE(founded_at, founded_at_clean, CURRENT_DATE) new
from crunchbase_companies_clean_data;

# contoh trim huruf W (kapital) dalam sql
select bike_number, trim(LEADING 'W' from bike_number) new
from dc_bikeshare_q1_2012;

select bike_number, trim(TRAILING 'W' from bike_number) new
from dc_bikeshare_q1_2012;

select bike_number, trim(both 'W' from bike_number) new
from dc_bikeshare_q1_2012;

select bike_number, trim(LEADING 'W' from bike_number) new
from dc_bikeshare_q1_2012;

select trim(LEADING 'W' from 'WAKAKAW') new;
select trim(trailing 'W' from 'WAKAKAW') new;
select trim(both 'W' from 'WAKAWKAW') new;

#menentukan posisi suatu string berada dimana dalam text
SELECT bike_number,
       POSITION('1' in bike_number) as pos
FROM dc_bikeshare_q1_2012;

SELECT start_time,
    LEFT(start_time, 10) as selected_date,
    RIGHT(start_time, 8) as selected_time,
    SUBSTR(start_time, 15, 2) AS selected_minute
from dc_bikeshare_q1_2012;
