require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative './course.rb'

class Scraper

  def get_page #instance method. use Nokogiri & open URI to get the HTML from a webpage
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    #THIS IS ALL OF THE CODE NEEDED TO SOLVE THESE 3 METHODS in one spot:
        #  doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
        #  doc.css(".post").each do |post| #iterate over the collection of XML elements
        #  course = Course.new #create new instance from the iteration
        #  course.title = post.css("h2").text #give each instance the title, schedule, and description that is extracted from the nokogiri XML
        #  course.schedule = post.css(".date").text
        #  course.description = post.css("p").text
        #   end
  end

  def get_courses #instance method. use CSS selector to return an array XML
    self.get_page.css(".post")
  end

  def make_courses
    #title, schedule, description
    #iterate over courses array returned by get_courses and creates a new course instance out of each array element
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
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "Schedule: #{course.schedule}"
        puts "Description: #{course.description}"
      end
    end
  end

end
