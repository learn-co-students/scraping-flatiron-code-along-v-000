require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
    def get_page
      whole_page = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
      Nokogiri::HTML(whole_page)
    end

    def get_courses
      self.get_page.css(".post") #call the css method on the whole NodeNest and return only those nodes with class "post" 
    end

    def make_courses
      self.get_courses.each do |post| #each course variable is the class "post" node representing each course
        course = Course.new
        course.title = post.css("h2").text
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
      end
    end

    def print_courses
    self.make_courses #scrapes and instantiates new Course instances with instance variables for title / schedule / description
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
#instantiate a new instance of scraper
#call the get page function on that instance

