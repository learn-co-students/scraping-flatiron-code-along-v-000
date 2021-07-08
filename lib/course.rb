require 'pry'

# create a class Course 
class Course 
# create attr_accessor for title 
  attr_accessor :title, :schedule, :description
# create instance methods for:
  @@all = []
  
  def initialize
    @@all << self
  end 
  
# create class method - self.all
  def self.all
    # this method returns an array of all instances of Course class 
   @@all 
  end 
  
  def self.reset_all 
    @@all = []
  end 

end 