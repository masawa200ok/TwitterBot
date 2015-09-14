require 'twitter'
require 'yaml'

current_dir = File.expand_path(File.dirname(__FILE__))

array = []
open("#{current_dir}/tweets.db.txt") do |file|
  while line = file.gets
    array.push(line)
  end
end
tweet = array.sample

client = Twitter::REST::Client.new do |config|
  settings = YAML.load_file("#{current_dir}/settings.yaml")
  config.consumer_key         = settings[:consumer_key]
  config.consumer_secret      = settings[:consumer_key_secret]
  config.access_token         = settings[:access_token]
  config.access_token_secret  = settings[:access_token_secret]
end
puts "#{Time.now}: #{tweet}"
client.update(tweet)
