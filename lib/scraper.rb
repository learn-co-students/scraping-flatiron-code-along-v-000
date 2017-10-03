require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

class Scraper
  attr_accessor :doc, :courses
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    courses = self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |course_offering|
      if course_offering.css("h2").text != ""
        course = Course.new
        course.title = course_offering.css("h2").text
        course.description = course_offering.css("p").text
        course.schedule = course_offering.css(".date").text
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


Scraper.new.print_courses
