require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

class Scraper



    def get_page
      html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
      Nokogiri::HTML(html)
    end

    def get_courses
      @@courses = get_page.css(".post")
    end

    def make_courses
      #binding.pry
      @@courses.each do |course |
        c = Course.new
        c.title = course.css("h2").text
        c.schedule = course.css("em").text
        c.description = course.css("p").text
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
