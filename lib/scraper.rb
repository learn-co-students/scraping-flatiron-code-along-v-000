require 'nokogiri'
require 'open-uri'
require 'pry'

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
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    Nokogiri::HTML(html)
  end

  def get_courses
    get_page.css('article.post')
  end

  def make_courses
    records = get_courses
    records.each do |record|
      course = Course.new
      course.title = record.css('h2').text
      course.schedule = record.css('em.date').text
      course.description = record.css('p').text
    end
  end
end
