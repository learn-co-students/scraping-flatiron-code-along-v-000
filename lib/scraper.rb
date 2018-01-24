require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    courses = self.get_page.css('.post').reject {|element| element.css('h2').empty? }
  end

  def make_courses
    Course.reset_all
    self.get_courses.each do |element|
      course = Course.new
      course.title = element.css('h2').text
      course.schedule = element.css('.date').text
      course.description = element.css('p').text
    end
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

