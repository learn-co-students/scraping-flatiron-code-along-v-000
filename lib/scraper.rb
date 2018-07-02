require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end

  def get_courses
    get_page.css("#hero")
  end

  def make_courses
    get_courses.each do |x|
      x = Course.new
      x.title = get_courses.css("h2").text
      x.schedule =  get_courses.css("date").text
      x.description = get_courses.css("p").text
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
