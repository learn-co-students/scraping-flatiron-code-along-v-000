require 'nokogiri'
require 'open-uri'
require "pry"

require_relative './course.rb'


class Scraper
  def initialize
    @titles = []
    @schedules = []
    @descriptions = []
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
  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end
  def get_courses

   @schedules = self.get_page.css(".post .date")
   @titles = self.get_page.css(".post h2")
   @descriptions = self.get_page.css(".post p")
  end

  def make_courses
    course = Course.new
    get_courses
    @titles.each do |title|
      # binding.pry
      course.title = title.text
    end
    @schedules.each do |schedule|
      course.schedule = schedule.text
    end
    @descriptions.each do |description|
      course.description = description.text
    end
    course
  end

end
