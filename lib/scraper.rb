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
      html = open(http://learn-co-curriculum.github.io/site-for-scraping/courses)
      Nokogiri::HTML
      doc = Nokogiri::HTML(html)
      puts doc 
    end   
  
end



