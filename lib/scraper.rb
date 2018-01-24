require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    courses = []
    get_page.css(".posts-holder article").each do |post|
      courses << post
    end
    courses
  end

  def make_courses
    courses = []
    get_courses.each do |c|
      course = Course.new
      courses << course
      course.title = c.css("h2").text
      course.schedule = c.css("em.date").text
      course.description = c.css("p").text
    end
    courses
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

s = Scraper.new
s.print_courses
