require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

def get_page
  doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

  binding.pry
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


# def get_courses
#   #uses CSS selector to grab HTML elements
#   #containing course
# end

# def make_courses
#   #instantiates Course objects giving each
#   #attribute scraped from page
# end

end
Scraper.new.get_page
