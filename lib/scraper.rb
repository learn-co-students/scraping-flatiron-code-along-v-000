require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
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
 
    def get_page
  #use nokogori and open-uri to grab entire HTML doc from webpage
  doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  
 # doc.css(".post").each do |post|
#  course = Course.new
 #   course.title = post.css("h2").text 
  #  course.schedule = post.css(".date").text
   # course.description = post.css("p").text 
  #  end 
    end 
  
    def get_courses
      #use CSS selector to grab all of HTML elements that contain a course. Return XML elements.
      self.get_page.css(".post")
    end 
    
    def make_courses
      #instantate Course objects and give each course a title, schedule and description
      self.get_courses.each do |post|
        course = Course.new 
        course.title = post.css("h2").text 
        course.schedule = post.css(".date").text 
        course.description = post.css("p").text
    end 
  end 
    
    def print_courses
      #calls on make_courses and then iterates over all courses that gets created to puts out a list of course offerings
      self.make_courses
      Course.all.each do |course|
        if course.title
          puts "Title: #{course.title}"
          puts "Schedule: #{course.schedule}"
          puts "Description: #{course.description}"
    end
  end 
end 
end



Scraper.new.print_courses
