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
   doc = self.get_page 
   doc.css(".post")
  end 
  
  def make_courses 
    list = self.get_courses
    all_the_courses = []
    list.collect do |course|
      new_course = Course.new 
      new_course.title = course.css("h2").text 
      new_course.schedule = course.css(".date").text 
      new_course.description = course.css("p").text 
    end   
  end 
end



