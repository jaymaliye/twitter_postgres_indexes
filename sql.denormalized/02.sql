SELECT 
    '#' || t.hashtag as tag, 
    count(*) as count
FROM (
    SELECT DISTINCT
        data->>'id' as id_tweets,
        jsonb_array_elements(data->'entities'->'hashtags')->>'text' as hashtag
    FROM 
        tweets_jsonb
    WHERE 
        data->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
    UNION
    SELECT DISTINCT
        data->>'id' as id_tweets,
        jsonb_array_elements(data->'extended_tweet'->'entities'->'hashtags')->>'text' as hashtag
    FROM 
        tweets_jsonb
    WHERE 
        data->'extended_tweet'->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
) t
GROUP BY t.hashtag
ORDER BY count DESC, t.hashtag
LIMIT 1000;
