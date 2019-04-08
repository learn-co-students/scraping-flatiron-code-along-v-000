require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def get_page
    #using Nokogiri and open-uri to grab the entire HTML document from the web page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

  end


  def get_courses
    # instance method will be responsible for using a CSS selector to grab all of the HTML elements that contain a course
    # return value of this method should be a collection of Nokogiri XML elements, each of which describes a course offering
    # self.get_page.css(".post").first.css("em").css(".date").text


    self.get_page.css(".post")
  end
  

  def make_courses
    self.get_courses.each { |course_offering| 
      course = Course.new
      course.title = course_offering.css("h2").text
      course.schedule = course_offering.css(".date").text
      course.description = course_offering.css("p").text
    }
  end

  
  def print_courses
    self.make_courses
    Course.all.each { |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    }
  end
  
end

# Scraper.new.get_page

# Scraper.new.print_courses
