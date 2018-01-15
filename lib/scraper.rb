require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    @doc = Nokogiri::HTML(html)
  end
  
  def get_courses
    get_page.css('.post')
  end

  def make_courses
    get_courses.each do |info|
      course = Course.new
      course.title = info.css('h2').text
      course.schedule = info.css('.date').text
      course.description = info.css('p').text
    end
  end

  def print_courses
    make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
end
