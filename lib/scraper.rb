require 'nokogiri'
require 'open-uri'
 
require_relative './course.rb'
 
class Scraper
 
  # get HTML of page as a collection of Nokogiri XML elements
  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
 
  #get collection of course offerings
  def get_courses
    self.get_page.css(".post")
  end
 
  # assign individual course attributes to a given instance of the Course class
  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
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
 
Scraper.new.print_courses
