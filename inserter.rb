require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './db.sqlite3'
)

class Tweet < ActiveRecord::Base
end

open(ARGV[0]).each do |line|
  line.chomp!
  next if nil
  if line.match(/^$/)
    next
  end
  if line.size >= 140
    puts "[#{line.size}] #{line}"
    next
  end
  t = Tweet.create(
    tweet: line,
    delete_flg: 'f'
  )
  unless t
    p t
    break
  end
end


