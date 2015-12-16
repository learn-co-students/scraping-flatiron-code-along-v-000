require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def self.get_page
    page = Nokogiri::HTML(open(http://learn-co-curriculum.github.io/site-for-scraping/courses))
  end

  def self.get_courses
    courses = page.css("article")
  end

  def self.make_courses
  end



end



