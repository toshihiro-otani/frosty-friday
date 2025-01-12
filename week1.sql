use role csc_user;
use database frosty_friday;
use warehouse frosty_friday_xsmall;

create schema if not exists toshihiro;

-- WEEK1
create or replace stage frosty_friday.toshihiro.week1
  url = ' s3://frostyfridaychallenges/challenge_1/'
;

list @frosty_friday.toshihiro.week1;

create table if not exists toshihiro.week1 as 
select 
  $1 as value,
  metadata$filename as filename,
  metadata$file_row_number as file_row_number,
  metadata$file_content_key as file_content_key,
  metadata$file_last_modified as file_last_modified,
  convert_timezone('UTC', metadata$start_scan_time) as start_scan_time
from @week1 (pattern => '.*challenge_1/.*[.]csv');

select * from toshihiro.week1 order by 2, 3;
