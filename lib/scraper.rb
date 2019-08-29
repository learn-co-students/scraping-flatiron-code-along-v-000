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
      self.get_page.css(".post")
    end

    def make_courses

      self.get_courses.each do |element|
        course = Course.new
        course.title = element.css("h2").text
        course.schedule = element.css("em").text
        course.description = element.css("p").text
      end

    end

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
end
