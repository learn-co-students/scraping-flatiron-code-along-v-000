require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

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

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)

    doc
  end

  def get_courses
    doc = get_page
    doc.css(".post")
  end

  def make_courses
    courses = get_courses
    courses.each do |xml|
      course = Course.new
      course.title = xml.css("h2").text
      course.schedule =  xml.css(".date").text
      course.description = xml.css("p").text
      course
    end
  end
end

Scraper.new.print_courses
