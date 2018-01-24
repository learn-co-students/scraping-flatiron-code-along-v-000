require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    course = Course.new
    post = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

    course.title = post.css(".post").first.css("h2").text
    course.schedule = post.css(".post").first.css(".date").text
    course.description = post.css(".post").first.css("p").text

    course
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
