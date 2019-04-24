require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  #use Nokogiri and open-uri to grab the entire HTML document from the web page.
  def get_page 
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    
    #doc.css(".post").each do |post|
     # course = Course.new 
      #course.title = post.css("h2").text
      #course.schedule = post.css(".date").text 
      #course.description = post.css("p").text 
    #end 
  end 
    
    #use a CSS selector to grab all of the HTML elements that contain a course. The return value of this method should be a collection of Nokogiri XML elements, each of which describes a course offering
    def get_courses 
      self.get_page.css(".post")
    end 
    
    #instantiates Course objects and gives each course object the correct title, schedule and description attribute that we scraped from the page.
    def make_courses 
      self.get_courses.each do |post|
        course = Course.new 
        course.title = post.css("h2").text
        course.schedule = post.css(".date").text 
        course.description = post.css("p").text
      end 
    end 
    
    #calls on .make_courses and then iterates over all of the courses that gets created to puts out a list of course offerings
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



