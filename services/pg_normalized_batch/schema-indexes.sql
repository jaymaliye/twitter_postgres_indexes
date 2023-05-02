CREATE INDEX idx_id_tweets_tag ON tweet_tags (id_tweets, tag);

CREATE INDEX idx_tag_id_tweets ON tweet_tags (tag, id_tweets);

CREATE INDEX idx_id_tweets_lang ON tweets (id_tweets, lang);

CREATE INDEX idx_gin ON tweets USING gin(to_tsvector('english',text)) WHERE lang='en';

