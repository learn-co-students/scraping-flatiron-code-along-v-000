require 'nokogiri'
require 'open-uri'
# require "pry"
class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    get_page.css('.post')
  end

  def make_courses
    get_courses.each{|x|
      course=Course.new
      course.title = x.css("h2").text
      course.schedule = x.css(".date").text
      course.description = x.css("p").text
    }
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

Scraper.new.get_page
