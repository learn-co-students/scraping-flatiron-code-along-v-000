require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_accessor :doc

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
     Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    get_page.css(".posts-holder")
  end

  def make_courses
    get_courses.each do |course|
      new_course = {}

      new_course[:title] = course.css("h2").text
      new_course[:schedule] = course.css(".date").text
      new_course[:description] = course.css("p").text

      new = Course.new
      new_course.each {|key, value| new.send("#{key}=",value)}
    end
  end

end
