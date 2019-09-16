require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page()
    #responsible for using Nokogiri and open-uri to grab the entire HTML document from the web page
    #should be responsible for just getting the page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses()
    #responsible for using a CSS selector to grab all of the HTML elements that contain a course.
    #the return value of this method should be a collection of Nokogiri XML elements, each of which describes a course offering.
    self.get_page.css(".post")
  end

  def make_courses()
    #responsible for actually instantiating Course objects and giving each course object the correct title, schedule and description attribute that we scraped from the page.
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end



  def print_courses
    #calls on .make_courses and then iterates over all of the courses that gets created to puts out a list of course offerings.
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

Scraper.new.get_page
Scraper.new.print_courses
