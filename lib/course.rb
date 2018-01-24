#define Class Course - scraping code along

class Course

  #after running rspec on spec/course_spec.rb
  #review errors, need setters and getters for instance methods below

  attr_accessor :title, :schedule, :description

  #build class methods

  @@all =[]

  #adds each instance to array
  def initialize
    @@all << self
  end

  #returns all instances of class method
  def self.all
    @@all
  end

  #clears all instances of class method array
  def self.reset_all
    @@all.clear
  end
end
