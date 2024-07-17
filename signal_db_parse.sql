-- Author: Matt Danner, Monolith Forensics
-- Created: December 28, 2022

SELECT 'mms' AS message_type, mms._id, DATETIME(mms.date / 1000, 'unixepoch', 'localtime') AS 'date (CT)', '' AS date_sent, DATETIME(mms.date_received / 1000, 'unixepoch', 'localtime') AS 'date_received (CT)', mms.body, 
part.ct AS attachment_type, part.data_size AS attachment_size, part.file_name,
recipient.phone, recipient.signal_profile_name, recipient.system_given_name, recipient.system_family_name, recipient.system_display_name
FROM mms
LEFT JOIN part
ON mms._id = part.mid
LEFT JOIN recipient
ON mms.address = recipient._id

UNION

SELECT 'sms' AS message_type, sms._id,DATETIME(sms.date / 1000, 'unixepoch', 'localtime') AS 'date (CT)',DATETIME(sms.date_sent / 1000, 'unixepoch', 'localtime') AS 'date_sent (CT)', '' AS date_received, sms.body, 
'' AS attachment_type, '' AS attachment_size, '' AS file_name,
recipient.phone, recipient.signal_profile_name, recipient.system_given_name, recipient.system_family_name, recipient.system_display_name
FROM sms
LEFT JOIN recipient
ON sms.address = recipient._id