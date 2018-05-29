require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def get_page 
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    
  def get_courses 
    self.get_page.css(".post")
  end
  
  def get_courses
    self.get_courses.each do |c|
      course = Course.new 
      course.title = c.css("h2")
      course.schedule = c.css(".date")
      course.description = c.css("p")
    end
  end
end
 
 

 
Scraper.new.print_courses
