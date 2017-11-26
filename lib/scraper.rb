require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

class Scraper
#attr_accessor :
#1
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
#2
  def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
      binding.pry
  end
#3
  def get_courses

  end
#4, final
  def make_courses

  end

#theend
end
Scraper.new.get_page
