
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |post|
      cls = Course.new
      cls.title = post.css("h2").text
      cls.schedule = post.css(".date").text
      cls.description = post.css("p").text
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |item|
      if item.title
        puts "Title: #{item.title}"
        puts "  Schedule: #{item.schedule}"
        puts "  Description: #{item.description}"
      end
    end
  end

end