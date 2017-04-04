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

    def get_page #uses Nokogiri and open-uri to grab entire HTML document
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    end

    def get_courses #uses CSS selector to grab course HTML elements.. returns collection of Nokogiri XML elements
      self.get_page.css(".post")
    end

    def make_courses #instantiating Course objects and giving them the correct attributes
      self.get_courses.each do |post|
        course = Course.new
        course.title = post.css("h2").text
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
      end
    end


end

Scraper.new.print_courses
