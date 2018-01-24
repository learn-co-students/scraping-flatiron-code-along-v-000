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
        #binding.pry
      end
    end
  end

    def get_page
       doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    end

    def get_courses
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
      doc.css(".post").collect{|e|  e }
    end

    def make_courses
      doc = get_courses
      doc.each {|e|
        course = Course.new
        course.title = e.css("h2").text
        course.schedule = e.css(".date").text
        course.description = e.css("p").text
        }
      #binding.pry
    end
end


#Scraper.new.get_page
#Scraper.new.get_courses
#Scraper.new.make_courses
#Scraper.new.print_courses
