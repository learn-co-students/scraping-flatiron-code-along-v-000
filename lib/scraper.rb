require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    Nokogiri::HTML(html)
  end

  def get_courses
    self.get_page.css("section.posts-holder .post")
  end

  def make_courses
    self.get_courses.each do |course|
      course_object = Course.new
      course_object.title = course.css("h2").text
      course_object.schedule = course.css(".date").text
      course_object.description = course.css("p").text
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
