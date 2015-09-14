require 'nokogiri'

file_name = "./#{ARGV[0]}"

charset = nil
html = open(file_name) do |f|
  #charset = f.charset
  charset = 'utf-8'
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

doc.xpath('//dl[@class="clearfix"]').each do |node|
  text = node.css('h3 > a').inner_text
  text = text.gsub(/\n/, '')
  text = text.gsub(/(^\s+)|(\s+$)/, '')
  text = text.gsub(//, ' ')
  
  infos = node.css('.blog_info > p > span > span > b > a')
  array = []
  infos.each do |info|
    array.push(info.inner_text)
  end
  infos_text = array.reverse.join(',')
  output = "#{text} #{infos_text}"
  if output.size >= 140
    output = "[140 over]" + output
  end
  puts output
  puts ''
end

