require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page #only the code for getting the HTML doc

    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    # doc.css(".post").each do |post|
    #   course = Course.new #make a new Course instance
    #   course.title = post.css("h2").text #scraped title
    #   course.schedule = post.css(".date").text #scraped schedule
    #   course.description = post.css("p").text #scraped description
    # end
    # binding.pry
  end

  def get_courses #operates on HTML page (the return value of .get_page method)
    self.get_page.css(".post") #returns the collection of Nokogiri XML elements
  end

  def make_courses #operates on the collection of course offering Nokogiri XML elements that was returned by the .get_courses method
    self.get_courses.each do |post| #.make_courses method iterates over the collection and make a new instance of Course class for each one while assigning it the appropriate attributes.
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
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

Scraper.new.print_courses
