require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'
# lets Scraper class assign attributes from  Course class to
# data scraped from website

class Scraper

# iterate over scraped data collection
# make new Course instance for each course element in iteration,
# assign instance the scraped title, schedule and description,
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  # get only CSS selectors with data I want.
  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |post|
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

end #Scraper class end
#Scraper.new.print_courses
