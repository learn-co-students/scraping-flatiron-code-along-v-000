require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './course.rb'

class Scraper

  # def get_page_governor_wiki
  #   doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Governors_of_Texas#Governors_of_Texas"))
  # end 
  
  def get_page
    array_governors = []
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Governors_of_Texas#Governors_of_Texas"))
    title = doc.search(".wikitable")
    
    title[1].css("tr").each do |tr_list|
      scraped_governor = {}
      small_list = tr_list.search("small")
      scraped_governor[:name] = tr_list.css("td big").first.text
      scraped_governor[:profile_url] = "https://en.wikipedia.org#{tr_list.css("td big b a").attribute("href").value}"
      scraped_governor[:born_death_date] = tr_list.css("td")[3].css("small").first.text  
      scraped_governor[:age] = small_list[1].text.gsub(/[()]/, "")
      scraped_governor[:term_in_office] = "#{tr_list.css("td")[4].children[0].text} - #{tr_list.css("td")[4].children[0].text.gsub(/[\n]/, '')}"
      scraped_governor[:party_affiliation] = tr_list.css("td")[5].text
      scraped_governor[:elected_year] = tr_list.css("td")[6].text
      array_governors << scraped_governor
    end
    array_governors
    binding.pry
  end 
  
    
    # def get_page
    # scraped_governors = {}
    # doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Governors_of_Texas#Governors_of_Texas"))
    # title = doc.search(".wikitable")
    # governor= title[1].css("td")
    # # # td_list.each do |governor|
    # small_list = governor.search("small")
    # scraped_governors[:profile_url] ="https://en.wikipedia.org#{governor.css("big b a").attribute("href").value}"
    # scraped_governors[:born_death_date] = small_list[0].text 
    #   scraped_governors[:age] = small_list[1].text.gsub(/[()]/, "")
    #   scraped_governors[:term_in_office] = "#{governor[4].children[0].text} - #{governor[4].children[0].text.gsub(/[\n]/, '')}"
    #   scraped_governors[:party_affiliation] = governor[5].text
    #   scraped_governors[:elected_year] = governor[6].text
    #   binding.pry
    # end 
    
  
end 
    
  
    # # title of the course
    # title = doc.css(".post").first.css("h2").text
  
    # # schedule of the course 
    # schedule = doc.css(".post").first.css(".date").text
  
    # # details of the course 
    # description = doc.css(".post").first.css("p").text
    #binding.pry
  
  
#   def get_courses
#     self.get_page.css(".post")
#   end 
  
#   def make_courses
#     self.get_courses.each do |post|
#       course = Course.new
#       course.title = post.css("h2").text
#       course.schedule = post.css(".date").text
#       course.description = post.css("p").text
#     end 
#   end
#   def print_courses
#     self.make_courses
#     Course.all.each do |course|
#       if course.title
#         puts "Title: #{course.title}"
#         puts "Schedule: #{course.schedule}"
#         puts "Description: #{course.description}"
#       end
#     end
#   end
  
# end 
# Scraper.new.print_courses 
















# class Scraper
#   def get_page
#     doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
#   end
#   def get_courses
#   self.get_page.css(".post")
#   end
#   def make_courses
  
#     self.get_courses.each do |post|
#       course = Course.new
#       course.title = post.css("h2").text
#       course.schedule = post.css(".date").text
#       course.description = post.css("p").text
#     end 
  
#   end
  
  
  
#     
  
# end
# Scraper.new.print_courses
#Scraper.new.get_page


