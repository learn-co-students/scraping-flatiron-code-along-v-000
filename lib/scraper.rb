require 'nokogiri'
require 'open-uri'

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
    self.get_page.css("#course-grid .posts-holder .post")
  end
  
  def make_courses
    self.get_courses.each do |i| 
      course              = Course.new
      course.title        = i.css("h2").text
      course.schedule     = i.css("em").text
      course.description  = i.css("p").text
    end
  end 
  
end
