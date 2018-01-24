require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    # The page itself:
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  # operate on the HTML page (which is the return value of the .get_page method)
  # and return the collection of Nokogiri XML elements that describe each course.
  def get_courses
    self.get_page.css("post")
  end


  def make_courses
    # The collection of course offerings:
    self.get_courses.each do |post|
      course = Course.new
      # The title of an individual course offering:
      course.title = post.css("h2").text
      # The schedule of an individual course offering:
      course.schedule = post.css(".date").text
      # The description of an individual course offering:
      course.description = post.css("p").text
      # binding.pry
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
