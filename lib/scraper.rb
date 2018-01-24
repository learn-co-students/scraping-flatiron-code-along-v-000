require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'


class Scraper

  def get_page
    html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
    Nokogiri::HTML(html)
  end

  def get_courses
    courses =[]
    i = 1
    for i in 0..6
      courses << get_page.css(".posts-holder .post")[i]
    end
    courses
  end

  def make_courses
    get_courses.each do |scrape|
      course = Course.new
      course.title = scrape.css("h2").text
      course.schedule = scrape.css(".date").text
      course.description = scrape.css("p").text
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
