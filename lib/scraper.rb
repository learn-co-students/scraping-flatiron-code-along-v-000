require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end

  def get_courses
    get_page.css(".post")
  end

  def make_courses
    get_courses.each do |xml|
      course = Course.new
      course.title = xml.css("h2").text
      course.schedule = xml.css(".date").text
      course.description = xml.css("p").text
    end
  end
end