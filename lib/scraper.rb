require 'nokogiri' # Ruby Gem; turn giant HTML string into nested objects
require 'open-uri' # Ruby module; allows HTTP requests

require_relative './course.rb' # use the COURSEclass template

class Scraper #parse a web page's HTML & pull pertinent data
  # Use Nokogiri
  # Use Open-Uri
  # Use scraped DATA to INSTANTIATE instances of COURSEclass

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses")) #OPEN is an OPEN-URI method
    #grab the URL's HTML using OPEN-URI, access the HTMLclassmethods of NOKOGIRI and store the nested node translation in DOCvariable <<< WRITE BETTER PLZ

    # doc.css(".post").each do |post|
    #   course = Course.new
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text
    #   course.description = post.css(".p").text
    # end

  end

  def get_courses
  end

  def make_courses
  end







end #<----CLASS END
