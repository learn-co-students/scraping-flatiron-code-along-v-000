require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  # attr_accessor :url
  
  # def initialize(url)
  #   @url = url
  # end
  
  def get_page
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    Nokogiri::HTML(html) 
  end
  
  def get_courses
    self.get_page.css('#course-grid .posts-holder article.post')
  end
  
  def make_courses
    self.get_courses.each do |course_box|
      new_course = Course.new
      new_course.title = course_box.css('h2').text
      new_course.schedule = course_box.css('em.date').text
      new_course.description = course_box.css('p').text
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



