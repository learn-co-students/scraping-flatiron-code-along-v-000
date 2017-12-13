require 'pry'

# create a class Course 
class Course 
# create attr_accessor for title 
  attr_accessor :title, :schedule, :description
# create instance methods for:
  def initialize
    @courses = []
  end 
  
# create class method - self.all
  def self.all
    # this method returns an array of all instances of Course class 
    
    @courses << self 
    @courses
  end 
  
  def self.reset_all 
    @courses = []
  end 

end 