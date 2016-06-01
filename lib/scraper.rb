require 'nokogiri'
require 'open-uri'

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
      @doc = Nokogiri::HTML(html)
    end

    def get_courses
      page = self.get_page
      page.css(".post")
    end

    def make_courses
      courses = self.get_courses
      courses.each do |x|
        new_course = Course.new
        new_course.title = x.css("h2").text
        new_course.schedule = x.css(".date").text
        new_course.description = x.css("p").text 
      end
    end
  
end



