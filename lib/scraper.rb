require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def get_page
    
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses")) #actual page
    
    doc.css(".post").each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
    binding.pry
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
#doc.css(".post") Collection of course offerings
#doc.css(".post").first.css("h2").text Course Title
#doc.css(".post").first.css(".date").text Schedule
#doc.css(".post").first.css("p").text Description
