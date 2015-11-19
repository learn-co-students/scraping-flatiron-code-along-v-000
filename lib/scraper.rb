require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  attr_accessor

  def initialize
  end

  def get_page
    @doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    get_page.css('.post')
  end

  def make_courses
    get_courses.each do |course_info|
      course = Course.new
      course.title = course_info.css("h2").text
      course.schedule = course_info.css("p").text
      course.description = course_info.css(".date").text
    end
  end
end



