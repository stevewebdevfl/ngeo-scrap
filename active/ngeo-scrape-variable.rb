require 'nokogiri'
require 'open-uri'

hed = Array.new
sub = Array.new

puts "National Geographic Feature Articles Search"
puts "What month?"
month = gets.chomp
puts "What year?"
year = gets.chomp

#year = '2014'
#month = '04'

url_var = "http://ngm.nationalgeographic.com/#{year}/#{month}/table-of-contents"
puts "url_var is #{url_var}"

doc = Nokogiri::HTML(open(url_var))

# doc = Nokogiri::HTML(open("http://ngm.nationalgeographic.com/2014/04/table-of-contents"))

hed = doc.css("div.hed").collect {|node| node.text.strip}

sub = doc.css("div.sub").collect {|node| node.text.strip}

hedlength = hed.length
sublength = sub.length
if hedlength != sublength
  puts "HEAD & SUB ARRAYS ARE DIFFERENT LEGNTHS.  CHECK YOUR EXTRACT"
else
  hedsub = []
  incr = 1
  i = 0
  begin
    hedsub << hed[i]
    hedsub << sub[i]
    i += incr
  end while i < hedlength
  title = "Feature Articles - National Geographic Magazine, #{month}/#{year}\n\n"
  puts title  
  puts hedsub
end