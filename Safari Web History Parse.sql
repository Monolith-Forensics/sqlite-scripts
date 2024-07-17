SELECT 
-- history_visits.visit_time AS 'Raw Timestamp',
datetime(history_visits.visit_time + 978307200, 'unixepoch') AS Timestamp, 
history_items.url AS URL,
history_visits.title AS Title
FROM history_visits
LEFT JOIN history_items
ON history_items.id = history_visits.history_item
ORDER BY history_visits.visit_time