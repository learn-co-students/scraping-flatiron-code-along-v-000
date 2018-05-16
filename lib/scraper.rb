require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    get_page.css("#course-grid .posts-holder .post")
  end

  def make_courses
    get_courses.each do |course|
      instance = Course.new
      instance.title = course.css("h2").text.strip
      instance.schedule = course.css(".date").text.strip
      instance.description = course.css("p").text.strip
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

end #end class
