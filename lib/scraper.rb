require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
    def get_page #Should only contain code for getting the HTML document
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
      # doc.css(".post").each do |post|
      #   course = Course.new
      #   course.title = post.css("h2").text
      #   course.schedule = post.css("date").text
      #   course.description = post.css("p").text
      # end
    end

    def get_courses
      #operates on the HTML page (which is the return value of the .get_page method) AND
      #return the collection of Nokogiri XML elements that describe each course.
      #So, we'll call on our .get_page method inside the .get_courses method.
      self.get_page.css(".post")
    end

    def make_courses
      #operates on the collection of course offering Nokogiri XML elements that was returned by the .get_courses method.
      #iterates over the collection & makes a new instance of Course class for each one while assigning it the appropriate attributes.
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

end


Scraper.new.print_courses
