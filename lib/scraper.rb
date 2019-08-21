require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    #Grabs the HTML from the flatiron school curriculm page.
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    # doc.css(".post").each do |post|
    #   course = Course.new
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text
    #   course.description = post.css("p").text
    # end
  end

  def get_courses
    #Get a list of courses from the flatiron school curriculm page.
    #We'll grab all of the courses the page has.
    self.get_page.css(".post")
  end

  def make_courses
    #We'll iterate over the doc array to grab the dat we want to create a new course object, give it a title,
    # schedule, and description.
    self.get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end

    def print_courses
      #print the courses from the make_courses method.
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end

Scraper.new.print_courses
