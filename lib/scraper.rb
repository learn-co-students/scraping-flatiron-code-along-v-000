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

  def initialize
    @doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_page
    @doc
  end

  def get_courses
    self.get_page.css
  end

  def make_courses
    self.get_courses.each do |course|
      course.text
    end
  end

end
