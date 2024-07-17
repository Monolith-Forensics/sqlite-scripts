SELECT 
target_path AS File
,datetime(start_time / 1000000 - 11644473600, 'unixepoch') AS Timestamp
,total_bytes AS Size, referrer AS URL
FROM downloads