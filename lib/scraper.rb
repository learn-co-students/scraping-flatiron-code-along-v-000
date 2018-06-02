require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

    def get_page
      html=open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
      doc=Nokogiri::HTML.parse(html)
    end

    def get_courses
      doc=self.get_page.css(".post")
    end

    def make_courses
      self.get_courses.each do |post|
        course=Course.new  #initialize a new Course instances
        course.title=post.css('h2').text #scrape title text and store it in instance variable
        course.schedule=post.css('.date').text #scrape schedule text and store it in instance variable
        course.description=post.css('p').text #scrape description text and store it in instance variable
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
