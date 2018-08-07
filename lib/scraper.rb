require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    doc = Nokogiri::HTML(html)
    # binding.pry
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |course_xml|
      course = Course.new
      course.title = course_xml.css("h2").text
      course.schedule = course_xml.css("class").text
      course.description = course_xml.css("p").text
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
