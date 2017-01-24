require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative './course.rb'

class Scraper
  

  def get_page
   Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end# of get_page


  def get_courses
    
    get_page.css("h2")
  end# of get_courses


  def make_courses

  end# of make_courses


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



