require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  # COURSE_URL = "http://learn-co-curriculum.github.io/site-for-scraping/courses"
  
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
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end 

  def get_courses 
    self.get_page.css("h2")
  end 
  
  def make_courses
    self.get_courses.each do |c|
      new_c = Course.new
      new_c.title = self.get_page.css("h2").text
      new_c.schedule = self.get_page.css(".date").text
      new_c.description = self.get_page.css("p").text
      Course.all << new_c
    end 
  end 
end



