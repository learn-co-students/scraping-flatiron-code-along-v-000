require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb' # path of Course class

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    # "::" this syntax references the parent and child relationship of the nested modules
  end

  def get_courses
    self.get_page.css(".post") # doc.css(".post") is the collection of course offerings
  end

  def make_courses
    self.get_courses.each do |post| # iterate the collection of course offerings
      course = Course.new # create new Course instance
      course.title = post.css("h2").text # title is after name="h2"
      course.schedule = post.css(".date").text # schedule is after name="em.date"
      course.description = post.css("p").text # description is after name="p"
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title != "" # last two spaces on website were blank
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
    #binding.pry
  end
end
