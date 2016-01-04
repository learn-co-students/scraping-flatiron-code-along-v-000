require 'rubygems'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_accessor :doc

  URI = 'http://learn-co-curriculum.github.io/site-for-scraping/courses'

  def get_page
    Nokogiri::HTML(open(URI))
  end

  def get_courses
    get_page.css(".post")
  end

  def make_courses
    get_courses.each do |course|
      new_course = Course.new
      new_course.title = course.css("h2").text
      new_course.schedule = course.css("em").text
      new_course.description = course.css("p").text
    end
  end
end