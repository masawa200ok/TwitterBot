require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './db.sqlite3'
)

class Tweet < ActiveRecord::Base
end

tweets = Tweet.all.order(id: :asc)
tweets.each do |t|
  new_tweet = "[Bot]#{t.tweet}"
  if new_tweet.size > 140
    new_tweet = "{140 over}" + new_tweet
  end
  puts new_tweet
end
