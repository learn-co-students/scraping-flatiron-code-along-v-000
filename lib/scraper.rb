require 'nokogiri'
require 'open-uri'
require 'byebug'

require_relative './course.rb'

class Scraper

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

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css('.post')
  end

  def make_courses
    self.get_courses.each do |scraped_info|
      course = Course.new
      course.title = scraped_info.css('h2').text
      course.schedule = scraped_info.css('.date').text
      course.description = scraped_info.css('p').text
    end
  end

end
