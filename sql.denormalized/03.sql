SELECT 
    t.lang as lang, 
    count(*) as count
FROM (
    SELECT DISTINCT data->>'id' as id_tweets, data->>'lang' as lang
    FROM 
        tweets_jsonb
    WHERE 
        data->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
    UNION
    SELECT DISTINCT 
        data->>'id' as id_tweets, data->>'lang' as lang
    FROM 
        tweets_jsonb
    WHERE 
        data->'extended_tweet'->'entities'->'hashtags'@@'$[*].text == "coronavirus"'
) t
GROUP BY 
    t.lang
ORDER BY 
    count DESC, t.lang;
