require 'pry'
require 'nokogiri'
require 'open-uri'
require_relative './course.rb'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    self.get_page.css(".post")
    # course_offerings = self.get_page.css("post")
    # binding.pry
    # course_offerings.each do |course_offering|
    #   binding.pry
    #   course_offering
    #   binding.pry
    #end

    # binding.pry

    # course_offerings = scraper.get_courses
    # # expect(course_offerings).not_to be_empty
    # expect(course_offerings).to be_a(Nokogiri::XML::Element)
    # course_offerings.each do |course_offering|
    #   # expect(course_offering).not_to be_empty
    #   # expect(course_offering).to be_a(Nokogiri::XML::Element)
    #   expect{course_offering.css("h2").text}.to_not raise_error

  end

  def make_courses
    self.get_courses.each do |post|
      course             = Course.new
      course.title       = post.css("h2").text
      course.schedule    = post.css(".date").text
      course.description = post.css("p").text
    end
  end

  def print_courses
    self.make_courses

    Course.all.each do |course|
      # binding.pry
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end

Scraper.new.print_courses


#
#
#
# course_offerings = scraper.get_courses
# # expect(course_offerings).not_to be_empty
# # expect(course_offerings).to be_a(Nokogiri::XML::Element)
# course_offerings.each do |course_offering|
#   # expect(course_offering).not_to be_empty
#   # expect(course_offering).not_to raise_error
#   expect(course_offering).to be_a(Nokogirii::XML::Element)
#   expect{course_offering.css("h2").text}.to_not raise_error
#
#   # expect{course_offering.css(".post")}.to eq("Full-Time")
