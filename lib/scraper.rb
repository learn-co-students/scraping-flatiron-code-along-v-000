require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

    def get_page
      html = open('https://learn-co-curriculum.github.io/site-for-scraping/courses')
      Nokogiri::HTML(html)
    end

    def get_courses
      html = open('https://learn-co-curriculum.github.io/site-for-scraping/courses')
      doc = Nokogiri::HTML(html)
      doc.css(".post")
    end

    def make_courses
      html = open('https://learn-co-curriculum.github.io/site-for-scraping/courses')
      doc = Nokogiri::HTML(html)
      courses = doc.css(".post")
      courses.each do |course|
        x = Course.new
        x.title = course.css("h2").text
        x.schedule = course.css(".date").text
        x.description = course.css("p").text
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
