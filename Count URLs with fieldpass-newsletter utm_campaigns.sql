SELECT 
    SPLIT_PART(REPLACE(first_location, 'https://', ''), '/', 1) AS root_domain, 
    COUNT(*) AS session_count
FROM 
    session
WHERE 
    cf_first_utm_campaign ='fieldpass-newsletter'
GROUP BY 
    SPLIT_PART(REPLACE(first_location, 'https://', ''), '/', 1)
ORDER BY 
    session_count DESC;
