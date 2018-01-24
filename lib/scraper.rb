require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    #Uses Nokogiri and open-uri to grab the entire HTML document from the web page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    #Uses a CSS selector to grab all of the HTML elements that contain a course
    self.get_page.css(".post")
  end

  def make_courses
    #Actually instantiates Course objects and
    #giving each course object the correct title, schedule and description attribute
    self.get_courses.each do |post|
      course = Course.new #instantiate a new course object
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
