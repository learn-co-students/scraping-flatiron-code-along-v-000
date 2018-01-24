require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  @@array = []
    def get_page
      html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
      doc = Nokogiri::HTML(html)
      doc
    end

    def get_courses
      self.get_page.css(".post")
    end

    def make_courses
      self.get_courses.each do |course|
        post = Course.new
        post.title = course.css("h2").text
        post.schedule = course.css(".date").text
        post.description = course.css("p").text

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
