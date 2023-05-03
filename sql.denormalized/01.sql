SELECT 
    count(*)     
FROM 
    tweets_jsonb
WHERE 
    data->'extended_tweet'->'entities'->'hashtags'@@'$[*].text == "coronavirus"' 
    OR
    data->'entities'->'hashtags'@@'$[*].text == "coronavirus"';
