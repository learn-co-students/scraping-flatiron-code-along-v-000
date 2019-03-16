require 'nokogiri'
require 'open-uri'
require 'pry'


require_relative './course.rb'
#Require `Course` class file so `Scraper` can make new courses and give them attributes scraped from webpage

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    #doc.css(".post").each do |post|
      #course = Course.new
      #course.title = post.css("h2").text
      #course.schedule = post.css(".date").text
      #course.description = post.css("p").text
  end

  # get_courses method should operate on the HTML page
    # which is the return value of the .get_page method
  def get_courses
    self.get_page.css(".post")
    # return the collection of Nokogiri XML elements that describe each course
  end

  # make_courses method should operate on collection of course offering Nokogiri XML elements returned by #.get_courses method
  def make_courses
    self.get_courses.each do |post| # iterate over the collection
      course = Course.new # make a new instance of `Course` class for each one
      course.title = post.css("h2").text # while assigning it the appropriate attributes
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

Scraper.new.get_page
