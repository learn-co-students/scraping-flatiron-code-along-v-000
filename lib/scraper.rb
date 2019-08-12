require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

    def get_page
      Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
      #get_page instance method will be responsible for using Nokogiri and open-uri to grab the entire HTML document from the web page.
    end

    def get_courses
      self.get_page.css(".post")
      #every keyword that has post.
      # responsible for using a CSS selector to grab all of the HTML elements that contain a course.
    end

    def make_courses
      self.get_courses.each do |post|
        course = Course.new
        course.title = post.css("h2").text
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
      # The #make_courses method will be responsible for actually instantiating Course objects and giving each course object the correct title,
      # schedule and description attribute that we scraped from the page.
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
