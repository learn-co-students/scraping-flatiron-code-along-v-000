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
    Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
  end
  def get_courses
    get_page.css(".post")
  end
  def make_courses
    cor = []
    nok = get_courses
    nok.each do |x|
      a = Course.new
      a.title = x.css("h2").text
      a.schedule = x.css(".date").text
      a.description = x.css("p").text
      cor << a
    end
    cor
  end
end
