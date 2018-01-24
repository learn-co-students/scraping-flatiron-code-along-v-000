require 'nokogiri'
require 'open-uri'
require 'pry'
#requires course class file so that Scraper can make new
#courses and give them attributes scraped from the web page
require_relative './course.rb'

class Scraper

    def get_page
        Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
        #iterates on general post
      #  doc.css(".post").each do |post|
      # course = Course.new
       #assign it a title
      # course.title = post.css("h2").text
       #schedule
      # course.schedule = post.css(".date").text
       #and description
       #course.description = post.css("p").text
    end

    def get_courses
      #operates on the html page and returns collection of Nokogiri XML elements
      #the HTML page is the return value of get_page, so we call get_page method
      self.get_page.css(".post")
    end

    def make_courses
      #operates on the collection of course offering XML elements returned by get_courses
      #iterates over the collection and makes new instance of course class for each
        self.get_courses.each do |post|
        course = Course.new
        course.title = post.css("h2").text
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
      end
    end
    
end
