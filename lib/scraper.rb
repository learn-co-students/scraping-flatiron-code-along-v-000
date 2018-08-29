require 'nokogiri'
require 'open-uri'
require 'pry'
 
require_relative './course.rb'
 
class Scraper
 
  def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses
  self.get_page.css(".post")
    
  end
  def make_courses
    get_courses.each do |course| 
     new_course = Course.new
     new_course.title = course.css("h2").text
     new_course.description = course.css("p").text
     new_course.schedule = course.css(".date").text
    end

  end
 
end
 
Scraper.new.get_page
