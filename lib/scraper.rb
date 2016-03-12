require 'nokogiri'
require 'open-uri'
#require 'pry'

require_relative './course.rb'

class Scraper

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
   #binding.pry
  end

  def get_courses
    get_page.css(".post")
  end

  def make_courses
    #binding.pry
    get_courses.each do |page|
      course = Course.new
      course.title = page.css("h2").text
      course.schedule = page.css("em").text
      course.description = page.css("p").text
      #binding.pry
    end
  end
end



