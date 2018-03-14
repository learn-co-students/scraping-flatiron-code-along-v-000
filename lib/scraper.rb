require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    @doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    get_courses.each do |post|
      new_course = Course.new
      new_course.title = post.css("h2").text
      new_course.description = post.css("p").text
      new_course.schedule = post.css("em").text
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
