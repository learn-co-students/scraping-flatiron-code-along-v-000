require 'pry'
require 'nokogiri'
require 'open-uri'

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
    # The page itself:
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    # The collection of course offerings:
    doc.css(".post").each do |post|
      course = Course.new
      # The title of an individual course offering:
      course.title = post.css("h2").text
      # The schedule of an individual course offering:
      course.schedule = post.css(".date").text
      # The description of an individual course offering:
      course.description = post.css("p").text
      binding.pry
    end

  end

end
Scraper.new.get_page
