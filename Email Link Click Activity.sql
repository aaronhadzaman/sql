// Note: This is populating data from our entire Braze instance
SELECT
    COUNT(external_user_id) AS "CLICK COUNT",
    CAMPAIGN_ID as "Campaign ID",
    LINK_ALIAS as "Link Alias",
    SPLIT_PART(url, '?', 0) as "DE-PERSONALIZED URL"
FROM
    USERS_MESSAGES_EMAIL_CLICK_SHARED
WHERE
    url IS NOT NULL
    AND CONTAINS("DE-PERSONALIZED URL", 'unsubscribe') = 0
    AND CONTAINS("DE-PERSONALIZED URL", 'emailinboundprocessing') = 0
    AND DATE_TRUNC('day', TO_TIMESTAMP_NTZ(time)) >= DATEADD('day', -14, DATE_TRUNC('day', CURRENT_DATE()))
GROUP BY "DE-PERSONALIZED URL", "CAMPAIGN_ID", "LINK_ALIAS"
ORDER BY "CLICK COUNT" DESC;
