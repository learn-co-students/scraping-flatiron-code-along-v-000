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
      # this method uses Nokogiri to get the HTML from a web page 
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    end 

    def get_courses
      # return an array of Nokogiri elements representing courses
      binding.pry
      doc.css(".posts-holder h2")
    end 
end



