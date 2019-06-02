require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Course
  attr_accessor :title, :schedule, :description
  @@courses = []
  def initialize
    @@courses<<self
  end
  def self.all
    @@courses
  end
  def self.reset_all
    @@courses.clear
  end
end

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
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end

  def get_courses
    courses = get_page.css(".post")
  end

  def make_courses
    get_courses.each {|course|
        new_course = Course.new
        new_course.title = course.css("h2").text
        new_course.schedule = course.css(".date").text
        new_course.description = course.css("p").text
    }
  end
end

test = Scraper.new
test.print_courses
