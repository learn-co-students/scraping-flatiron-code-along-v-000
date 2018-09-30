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
      html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
      doc = Nokogiri::HTML(html)
    end
    
    def get_courses
      #=> use CSS selector to grab all of the HTML elements that contain a course
      all_HTML = self.get_page
      return all_HTML.css(".post")
    end
    
    def make_courses
      
      all_courses = self.get_courses
      all_courses.each do |noko_course|
        course = Course.new
        course.title = noko_course.css("h2").text
        course.schedule = noko_course.css(".date").text
        course.description = noko_course.css("p").text
      end 
    end
  
end


#properties.each do |k, v|
#animal.send("#{k=}", v) => Mass assignment
