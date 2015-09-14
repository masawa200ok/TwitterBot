open(ARGV[0]).each do |line|
  line.chomp!
  next if nil
  if line.match(/^$/)
    next
  end
  if line.size >= 140
    puts "[#{line.size}] [Bot]#{line}"
    next
  else
    puts "[Bot]#{line}"
  end
end


