SELECT 
    x.lang AS lang, 
    count(*)
FROM (
    SELECT DISTINCT 
        data->>'id' AS id_tweets, data->>'lang' AS lang
    FROM 
        tweets_jsonb
    WHERE 
        data->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
    UNION
    SELECT DISTINCT 
        data->>'id' AS id_tweets, data->>'lang' AS lang
    FROM 
        tweets_jsonb
    WHERE 
        data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
) x
GROUP BY 
    x.lang
ORDER BY 
    count DESC, 
    x.lang;
