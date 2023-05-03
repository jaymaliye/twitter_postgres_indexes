CREATE INDEX idx_jsonb_1 ON tweets_jsonb USING gin((data->'entities'->'hashtags'));

CREATE INDEX idx_jsonb_2 ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));

CREATE INDEX idx_jsonb_3 ON tweets_jsonb USING gin((data->'lang'));

CREATE INDEX idx_jsonb_4 ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))) WHERE data->>'lang'='en';

CREATE INDEX idx_jsonb_5 ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')),
    (data->'entities'->'hashtags' || COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')));
