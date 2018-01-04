#==================require=====================
require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'
#==============================================

class Scraper
#=================instance=====================
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses
    self.get_page.css(".post")
  end
  
  def make_courses
    self.get_courses.each{|p|
      course = Course.new
      course.title = p.css("h2").text
      course.schedule = p.css(".date").text
      course.description = p.css("p").text
    }
  end
#==============================================
end

