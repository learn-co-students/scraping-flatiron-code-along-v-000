require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  attr_accessor :course

  def get_page
    return Nokogiri::HTML(open("https://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    return self.get_page.css('.post')
  end

  def make_courses
    self.get_courses.each do |course|
      course_ = Course.new
      course_.title = course.css("h2").text
      course_.schedule = course.css(".date").text
      course_.description = course.css("p").text
    end
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
  
end



