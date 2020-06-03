require "nokogiri"
require "pry"
require "open-uri"

require_relative "./course.rb"

class Scraper

  def get_page
    Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |cl|
      course = Course.new
      course.title = cl.css("h2").text
      course.schedule = cl.css(".date").text
      course.description = cl.css("p").text
    end
  end

end
