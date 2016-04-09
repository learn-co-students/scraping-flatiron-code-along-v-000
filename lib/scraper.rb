require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end

  def get_courses
    self.get_page.css("text")
  end

  def make_courses
    self.get_courses.map do |post|
      course = Course.new
      course.title = post.css("h2")
      course.schedule = post.css(".date")
      course.desciption = post.css("p")
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
