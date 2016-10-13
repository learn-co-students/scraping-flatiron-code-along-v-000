require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    # This method only scrapes the page, and gives the raw Nokogiri HTML page data
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    # These methods below have been left in to learn how the scraping works
    #doc.css(".post").each do |post|
    #  course = Course.new
    #  course.title = post.css("h2").text
    #  course.schedule = post.css("em").text
    #  course.description = post.css("p").text
    #end
  end

  def get_courses
    # This method uses the css selector to obtain data from elements that contain info that we need
    # Use Chrome 'Inspect' followed by 'Element Inspection Tool' to find the exact css selector to be used
    self.get_page.css(".post")
  end

  def make_courses
    # Parses each course element into a hash containing the data that we need
    # Observe that css sub-selectors like h2, em and p have been used to identify the different text from that
    # particular sub-element
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css("em").text
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
