require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

      # doc.css(".post").each do |post| # in order to grab the title, schedule and description of each one
      # course = Course.new
      # course.title = post.css("h2").text
      # course.schedule = post.css(".date").text
      # course.description = post.css("p").text
  end

  def get_courses
  self.get_page.css(".post") #operate on the HTML page (which is the return value of the .get_page method)
end

def make_courses #should iterate over the collection and make a new instance of Course class for each one while assigning it the appropriate attributes:
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
