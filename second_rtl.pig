data = LOAD 'sample2.txt' USING PigStorage(',')  AS (keyword:chararray, campaign_id:chararray, date:chararray, time:chararray, display_site:chararray, was_clicked:int, cpc:int, country:chararray, placement:chararray);
unique_records = DISTINCT data;

rearrange = FOREACH unique_records  GENERATE campaign_id, REPLACE(date, '-', '/'), time, UPPER(TRIM(keyword)), display_site, placement, was_clicked, cpc;

DUMP rearrange ;
