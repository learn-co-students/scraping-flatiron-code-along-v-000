require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

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

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    #doc.css(".post").each do |post|
     #course = Course.new
     #course.title = post.css("h2").text
     #course.schedule = post.css(".date").text
     #course.description = post.css("p").text

   #end

  end

  def get_courses
    self.get_page.css(".post")
      #collects all css elements that contain a course. return should be a collection of xml elements
  end

  def make_courses
    self.get_page.css(".post").each do |post|
     course = Course.new
     course.title = post.css("h2").text
     course.schedule = post.css(".date").text
     course.description = post.css("p").text
   end
  end

end

Scraper.new.print_courses
