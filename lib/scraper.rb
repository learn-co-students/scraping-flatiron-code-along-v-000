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
    Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
  end
  
  def get_courses
    doc = self.get_page.css(".post")
  end
  
  def make_courses
    self.get_courses.each do |article|
      course = Course.new
      course.title = article.css("h2").text
      course.schedule = article.css("em").text
      course.description = article.css("p").text
    end
  end
end

#Scraper.new.print_courses

