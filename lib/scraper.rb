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
      doc = Nokogiri::HTML(html)
      # Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    end

    def get_courses
      # html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
      # doc = Nokogiri::HTML(html)
      # courses = doc.css("h2")
      self.get_page.css(".post")
    end

    def make_courses
      self.get_courses.each do |post|
        course = Course.new
        course.title = post.css("h2").text
        # doc.css(".post").first.css("h2").text
        course.schedule = post.css('date').text
        #doc.css(".post").first.css(".date").text
        course.description = post.css('p').text
        #doc.css(".post").first.css("p").text
    end
  end



end
