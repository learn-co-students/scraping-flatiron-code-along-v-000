require 'nokogiri'
require 'open-uri'
require_relative './course.rb'

class Scraper
  

  def get_page
   Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end# of get_page


  def get_courses
  get_page.css("article")
  end# of get_courses


  def make_courses
    get_courses.each do |article|
      course = Course.new
      course.title = article.css("h2").text
      course.schedule = article.css(".date").text
      course.description = article.css("p").text 
    end# of do
  end# of make_courses


    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"+"\n""\n"
      end
    end
  end
end# of class 

Scraper.new.print_courses


