require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative './course.rb'

class Scraper
  def get_page
    url = 'https://learn-co-curriculum.github.io/site-for-scraping/courses'
    Nokogiri::HTML(open(url))
  end

  def get_courses
    self.get_page.css('.post')
  end

  def make_courses
    self.get_courses.each do |xml_course|
      course = Course.new
      course.title = xml_course.css('h2').text
      course.schedule = xml_course.css('.date').text
      course.description = xml_course.css('p').text
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
