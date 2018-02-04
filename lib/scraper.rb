require 'nokogiri'
require 'open-uri'

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
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    
    doc = Nokogiri::HTML(html)
  end
  
  def get_courses
    get_page.css(".post")
  end
  
  def make_courses
    #class posts-holder
    #h2
    #class date
    #<p>
    get_courses.each{|i| 
      instance = Course.new
      instance.title = i.css('h2').text
      instance.description = i.css('p').text
      instance.schedule = i.css('.date').text
    }
  end
  
end



