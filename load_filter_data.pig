data = LOAD '/dualcore/ad_data1.txt' AS
(keyword:chararray, campaign_id:chararray, date:chararray, time:chararray, display_site:chararray, was_clicked:int, cpc:int, country:chararray, placement:chararray);

data1 = FILTER data BY country == 'USA';

rearrange = FOREACH data1 GENERATE campaign_id, date, time, UPPER(TRIM(keyword)), display_site, placement, was_clicked, cpc;
STORE rearrange  INTO '/dualcore/ad_data1/';

