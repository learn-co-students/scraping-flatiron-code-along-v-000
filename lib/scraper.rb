require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    end


#call on .get_page method inside the .get_courses method
    def get_courses
      self.get_page.css(".post")
    end
  

#make_courses method should operate on the collection of course offering Nokogiri XML elements 
#that was returned by the .get_courses method.
#The make_courses method should iterate over the collection and make a new instance of Course
#class for each one while assigning it the appropriate attributes.
    def make_courses
      get_courses.each do |post|
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

#Scraper.new.get_page
Scraper.new.print_courses


