SELECT 
-- visits.visit_time AS 'Raw Timestamp', 
datetime(visits.visit_time / 1000000 - 11644473600, 'unixepoch') AS Timestamp, 
urls.url AS URL, urls.title AS Title
FROM visits
LEFT JOIN urls
ON urls.id = visits.url
ORDER BY visits.visit_time