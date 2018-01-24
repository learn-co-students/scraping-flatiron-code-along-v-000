require 'nokogiri'
require 'open-uri'
require 'pry'

#need to req file so that you can make new Course instances
require_relative './course.rb'

class Scraper

  def get_page
    #instance method, use Nokogiri & open-uri to get entire HTML doc
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    #instance method, grab HTML elements with a course
    self.get_page.css(".post")
  end

  def make_courses
    #create Course objects by iterating over XML elements
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end

  def print_courses
    #iterates over all courses and puts out a list of offerings
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
