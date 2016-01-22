require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  

  def get_page
    doc= Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.description = post.css("p").text
      course.schedule = post.css(".date").text
      binding.pry
    end
   

  end

  
end


Scraper.new.make_courses


