require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

=begin
      doc.css(".post").each do |post|
        course = Course.new
        course.title = post.css("h2").text
        course.schedule = post.css(".date").text
        course.description = post.css("p").text
      end
=end
    end
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

end


=begin
# => get_page
  The #get_page instance method will be responsible for using Nokogiri and open-uri to grab the entire HTML document from the web page.

# => get_courses
  this method will be responsible for using a css selector to grab all all of the HTML elements that contain a course.

# => make_courses
  this method will be responsible for actually instantiating Course objects and giving each course and object the correct title
  schedule and description attribute that we scraped from the page

# => print_courses
  prints all coures.





=end
