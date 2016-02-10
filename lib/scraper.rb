require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_reader :url

  def initialize
    @url = 'http://learn-co-curriculum.github.io/site-for-scraping/courses'
  end

  def get_page
    data = Nokogiri::HTML(open(url))
  end

  def get_courses
    get_page.css('.post')
  end

  def make_courses
    get_courses.each do |course|
      new_course = Course.new
      new_course.title = 'thing'
      new_course.schedule = 'thing'
      new_course.description = 'thing'
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



