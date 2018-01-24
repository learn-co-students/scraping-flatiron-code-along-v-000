require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end

  def get_courses
    get_page.css(".posts-holder .post")
  end

  def make_courses
    get_courses.each do |course_offering|
      course = Course.new
      course.title       = course_offering.css("h2").text
      course.schedule    = course_offering.css(".date").text
      course.description = course_offering.css("p").text
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
