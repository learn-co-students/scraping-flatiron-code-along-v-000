require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    @doc = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    Nokogiri::HTML(@doc)
  end

  def get_courses
    get_page.css(".post")
  end

  def make_courses
    courses = get_courses
    courses.each do |course|
      title = course.css('h2').text
      schedule = course.css('.date').text
      description = course.css('p').text
      new_course = Course.new
      new_course.title = title
      new_course.schedule = schedule
      new_course.description = description
    end
  end

  def print_courses
    self.make_courses
    binding.pry
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
