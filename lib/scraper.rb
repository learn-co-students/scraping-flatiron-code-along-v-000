require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_accessor :doc

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    @doc = Nokogiri::HTML(html)
  end

  def get_courses
    get_page
    @doc.css(".post")
  end

  def make_courses
    get_courses.each do |course|
      course_instance = Course.new
      course_instance.title = course.css("h2").text
      course_instance.schedule = course.css("em .date").text
      course_instance.description = course.css("p").text
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
