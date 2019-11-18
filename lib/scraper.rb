require 'nokogiri' # Ruby Gem; turn giant HTML string into nested objects
require 'open-uri' # Ruby module; allows HTTP requests

require 'pry'

require_relative './course.rb'

class Scraper #parse a web page's HTML & pull pertinent data
  # Use Nokogiri
  # Use Open-Uri
  # Use scraped DATA to INSTANTIATE instances of COURSEclass

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    #OPEN is an OPEN-URI method

    binding.pry

  end







end #<----CLASS END

Scraper.new.get_page
