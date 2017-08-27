require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    # doc.css(".post").first.css("h2").text  #Returns "Web Development Immersive"
    # doc.css(".post").first.css(".date").text #Returns "Full-Time"
    # doc.css(".post").first.css("p").text #Returns description of course
    # doc.css(".post").each do |post| #when testing out in Pry, we used .first.css to test the first element of the ".post" class.
    #   #now that we know it works, we can iterate over each ".post" element to return the title, schedule, & description of each course. In the code below, we are creating a new instance of Course with these attributes with each iteration.
    #   course = Course.new
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text
    #   course.description = post.css("p").text
    # end
    ##-------THIS WAS THEN REFACTORED INTO THE METHODS BELOW-------###
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |post| #when testing out in Pry, we used .first.css to test the first element of the ".post" class.
     #now that we know it works, we can iterate over each ".post" element to return the title, schedule, & description of each course. In the code below, we are creating a new instance of Course with these attributes with each iteration.
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

Scraper.new.get_page
