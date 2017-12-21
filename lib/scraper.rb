require 'nokogiri'
require 'open-uri'
require_relative './course.rb'

class Scraper
   #get_page method will be responsible for using Nokogiri and open-uri
   #to grab the entire HTML document from the web page
         def get_page
           doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
         end

        def get_courses
          self.get_page.css(".post") # return the collection of Nokogiri XML elements that describe each course
        end

        def make_courses
          doc.css(".post").each do |post|
          course = Course.new
          course.title = post.css("h2").text #i found these elements by inspecting the page and using pry
          course.schedule = post.css(".date").text
          course.description = post.css("p").text
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

end # end scraper class


Scraper.new.print_courses
