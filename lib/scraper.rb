require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    Nokogiri::HTML(html)
  end

  def get_courses
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    doc.css(".post")
  end

  def make_courses
    get_courses.each do |course|
      make = Course.new
      make.title = course.css("h2").text
      make.schedule = course.css(".date").text
      make.description = course.css("p").text
    end
  end
  
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
  
end

test = Scraper.new
test.get_courses


