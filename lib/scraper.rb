require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

    def get_page
        html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
        doc = Nokogiri::HTML(html)
    end

    def get_courses
        self.get_page.css(".post")
    end

    def make_courses
        courses = self.get_courses
        courses.each do |school|
          course = Course.new
          course.title = school.css("h2").text
          course.schedule = school.css('.date').text
          course.description = school.css('p').text
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

now = Scraper.new
puts now
