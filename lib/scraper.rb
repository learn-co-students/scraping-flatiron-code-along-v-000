require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  attr_accessor :doc, :courses


  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    @courses = get_page.css("#course-grid")
  end

  def make_courses
    course = Course.new
    get_courses.each do |c|
      course.title = c.css("h2").text
      course.schedule = c.css(".date").text
      course.description = c.css("p").text

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
