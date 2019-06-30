require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

#scraper has no attributes -it is purely functional
#this method just responsibile for parsing the HTML page
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
   end

#this method  operates on the HTML page (which is the return value of the .get_page method)
#and returns the collection of Nokogiri XML elements that describe each course (.post class)
  def get_courses
    self.get_page.css(".post")
  end

#method should iterate over the collection and
#make a new instance of Course class for each one
#while assigning it the appropriate attributes (these are setup in Course.rb)
  def make_courses
    #doc.css(".post").each do |post|
    self.get_courses.each do |post| #why does this need to be self? Are we not already operating on instance of scraper in the get_courses method?
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end


    def print_courses
    self.make_courses
        Course.all.each do |course|
        if course.title
          puts "Title: #{course.title}"
          puts "  Schedule: #{course.schedule}"
          puts "  Description: #{course.description}"
        end
      end
    end


end

Scraper.new.print_courses
