#The Scraper class will be responsible for using Nokogiri to scrape the relevant data. It will also be responsible for taking that data and using it to instantiate instances of the Course class.

class Course
  
  attr_accessor :title, :schedule, :description
  
  @@all = []
  
  def initialize
    @@all << self 
  end
  
  def self.all
    @@all
  end
  
  def self.reset_all
    @@all.clear
  end
  
  
  
end

