require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
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

  end
#3
  def get_courses

  end
#4, final
  def make_courses

  end

#theend
end
