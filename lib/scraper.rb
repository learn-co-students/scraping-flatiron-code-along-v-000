require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

class Scraper
  
  

  

def get_page
Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
end

def get_courses
self.get_page.css(".post")
end


def make_courses
#for each post, extract title, date, desc. and store
self.get_courses.each {|each_course|
                  new_course = Course.new
                  new_course.title = each_course.css("h2").text
                  new_course.schedule = each_course.css('em').text
                  new_course.description = each_course.css('p').text
                  }
end


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
Scraper.new.print_courses




