require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  attr_accessor :courses

  def get_page
    url ="http://learn-co-curriculum.github.io/site-for-scraping/courses"
    doc = Nokogiri::HTML(open(url))
  end

  def get_courses
    courses = get_page.css('.post')
  end

  def make_courses
    courses = get_courses.each{|course_listing|
      course = Course.new
      course.title = course_listing.css("h2").text
      course.schedule = course_listing.css(".date").text
      course.description = course_listing.css("p").text
      }
    @courses = courses
  end
end



