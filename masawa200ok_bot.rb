require 'twitter'
require 'yaml'
require 'active_record'

def errorlog(msg)
  File.open 'error.log', File::WRONLY|File::APPEND|File::CREAT do |f|
    datetime = DateTime.now.to_s
    f.puts("#{datetime}: #{msg}")
  end
end

class Tweet < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './masawa200ok_bot.sqlite3'
)

count = Tweet.all.count
rec_no = rand(count) + 1

if t = Tweet.find(rec_no)
  puts t.tweet
else
  errorlog("I cannot find tweet: no=#{rec_no}")
  return
end

client = Twitter::REST::Client.new do |config|
  settings = YAML.load_file('./settings.yaml')
  config.consumer_key         = settings[:consumer_key]
  config.consumer_secret      = settings[:consumer_key_secret]
  config.access_token         = settings[:access_token]
  config.access_token_secret  = settings[:access_token_secret]
end

#client.update('Hello, World!')


