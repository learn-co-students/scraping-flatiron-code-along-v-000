require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  # uses nokogiri and open-uri to grab entire html document from web page
  def get_page
    doc = Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
  end
  # instance method that uses CSS selector to grab all of HTML elements containing a course.
  # returns a collection of Nokogiri XML elements. which describes a course offering.
  def get_courses
    self.get_page.css(".post")
  end
  # actually instantiates Course objects, gives each attribute, data from which we scraped
  def make_courses
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end
# this was given to begin with
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end


end

Scraper.new.print_courses
