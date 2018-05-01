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

    def get_page      # instance method will be responsible for using Nokogiri and open-uri to grab the entire HTML document from the web page.
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    end
    def get_courses   # instance method will be responsible for using a CSS selector to grab all of the HTML elements that contain a course.
      self.get_page.css(".post")
    end
    def make_courses  # method will be responsible for actually instantiating Course objects and giving each course object the correct title, schedule and description attribute that we scraped from the page
      self.get_courses.each do |post|
        course = Course.new
        course.title  = post.css("h2").text
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
      end
    end
end

Scraper.new.get_page
Scraper.new.print_courses
