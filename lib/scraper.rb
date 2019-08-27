require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page

    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
    doc

  end

  def get_courses

    get_page.css(".post")

  end

  def make_courses
    
    get_courses.each do |course_iteration|
      course_instance = Course.new
      course_instance.title = course_iteration.css("h2").text
      course_instance.schedule = course_iteration.css(".date").text
      course_instance.description = course_iteration.css("p").text
      
    end

  end

end
