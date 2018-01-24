require 'nokogiri'
require 'open-uri'
require 'pry'
#lets require access to course.rb so that we can create new instances of courses
require_relative './course.rb'

class Scraper

  #The #get_page instance method will be responsible for using Nokogiri and open-uri to grab the entire HTML document from the web page.
    def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
        #For each iteration over the collection of Nokogiri XML elements returned to use by the doc.css(".post") line, we are making a new instance of the Course class and giving that instance the title, schedule and description extracted from the XML.
        #doc.css(".post").each do |post|
        #course = Course.new
        #course.title = post.css("h2").text
        #course.schedule = post.css(".date").text
        #course.description = post.css("p").text
        #end

    end
  #The #get_courses instance method will be responsible for using a CSS selector to grab all of the HTML elements that contain a course. In other words, the return value of this method should be a collection of Nokogiri XML elements, each of which describes a course offering. We're going to have to examine the page with the element inspector to find the CSS selector that contains the courses.
  def get_courses
    #use the method we created, and extract all info
    self.get_page.css(".post")
  end
  #The #make_courses method will be responsible for actually instantiating Course objects and giving each course object the correct title, schedule and description attribute that we scraped from the page.
  def make_courses
      self.get_courses.each do |post|
        course = Course.new
        course.title = post.css("h2").text
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
      end
  end
#It calls on .make_courses and then iterates over all of the courses that gets created to puts out a list of course offerings. We gave you this freebie so that we can easily see how cool it is to scrape data and make real live Ruby objects with it.
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
