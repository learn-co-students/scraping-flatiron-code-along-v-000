#####get_page
#uses Nokogiri to get the HTML from a web page
#####get_courses
#uses a CSS selector to return an array of Nokogiri XML elements representing the courses described on the web page we are scraping
#####make_courses
#iterates over the courses array returned by #get_courses and creates a new Course instance out of each array element.

require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |course|
      if course.css("h2").text != ""
        new_course = Course.new
        new_course.title = course.css("h2").text
        new_course.schedule = course.css(".date").text
        new_course.description = course.css("p").text
      end
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

Scraper.new.make_courses
