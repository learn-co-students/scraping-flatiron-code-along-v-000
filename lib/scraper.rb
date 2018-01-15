require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  attr_accessor :doc

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
    @doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    @doc
  end

  def get_courses
    @doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    @doc = @doc.css(".post")
  end

  def make_courses
    @doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    @doc = @doc.css(".post")
    @doc.each do |post|
      new_course = Course.new
      new_course.title = post.css("h2").text
      new_course.schedule = post.css(".date").text
      new_course.description = post.css("p").text
    end
  end

end
