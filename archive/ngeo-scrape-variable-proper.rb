require 'nokogiri'
require 'open-uri'

class Issue(month, year)
  attr_accessor :month, :year
#  attr_accessor :title, :month, :year

  def initialize
 #   @title = ""
    @month = ""
    @year = ""
  end

  # def select_title
  #   puts "Please select a title:  1 = National Geographic"
  #   @title = gets.chomp
  # end

  def input_issue_date
    puts "National Geographic Feature Articles Search"
    puts "What month? (please enter a month between 1 and 12)"
    @month = gets.chomp
    fill = 0
    puts "DEBUG: month is #{month}"
    if month.to_i < 10
      month = fill + month
    end
    puts "DEBUG: month now #{month}"
    puts "What year (please enter a year between 2013 and 2015)?"
    @year = gets.chomp
    Issue.new(@month, @year)
  end

  # def validate_issue_date
  #   if @title = 1
  #     month_i = @month.to_i
  #     if (month_i < 1) || (month_i > 12)
  #       puts "I'm so sorry - you did not enter a "
  #       input_issue_date
  #     end
  #   end
  # end

def get_url
url_var = "http://ngm.nationalgeographic.com/#{@year}/#{@month}/table-of-contents"
puts "DEBUG: url_var is #{url_var}"
end

def get_content
  doc = Nokogiri::HTML(open(url_var))

  hed = Array.new
  sub = Array.new

  hed = doc.css("div.hed").collect {|node| node.text.strip}   #get article titles
  sub = doc.css("div.sub").collect {|node| node.text.strip}   #get article subtitles

  hedlength = hed.length
  sublength = sub.length
  if hedlength != sublength
    puts "HEAD & SUB ARRAYS ARE DIFFERENT LEGNTHS.  CHECK YOUR EXTRACT"
  else            #interlace titles & subtitles
    hedsub = []
    incr = 1
    i = 0
    begin
      hedsub << hed[i]
      hedsub << sub[i]
      i += incr
    end while i < hedlength
  end
end

def display_content
  title = "This Month in National Geographic\n\n"
  puts title  
  puts hedsub
end

input_issue_date
get_url
get_content
display_content

