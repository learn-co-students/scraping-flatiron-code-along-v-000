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
      Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
    end
    
    def get_courses
      self.get_page.css('#course-grid .posts-holder .post')
    end
    
    def make_courses
      self.get_courses.each do |course_object| 
        course = Course.new
        course.title = course_object.css('h2').text
        course.schedule = course_object.css('.date').text
        course.description = course_object.css('p').text
      end
    end
    
end

Scraper.new.print_courses


