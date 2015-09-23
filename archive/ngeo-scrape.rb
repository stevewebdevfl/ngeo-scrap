require 'nokogiri'
require 'open-uri'

hed = Array.new
sub = Array.new

doc = Nokogiri::HTML(open("http://ngm.nationalgeographic.com/2015/03/table-of-contents"))

hed = doc.css("div.hed").collect {|node| node.text.strip}

sub = doc.css("div.sub").collect {|node| node.text.strip}

hedlength = hed.length
sublength = sub.length
if hedlength != sublength
  puts "HEAD & SUB ARRAYS ARE DIFFERENT LEGNTHS.  CHECK YOUR EXTRACT"
else
  hedsub = Array.new
  incr = 1
  i = 0
  begin
    hedsub << hed[i]
    hedsub << sub[i]
    i += incr
  end while i < hedlength
  title = "This Month in National Geographic\n\n"
  puts title  
  puts hedsub
end