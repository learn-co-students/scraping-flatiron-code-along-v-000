
require 'pry'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

puts doc.css(".text")
