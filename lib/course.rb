require 'pry'
class Course
  attr_accessor :title, :schedule, :description
  @@all = []
  #a class variable array named all
  def initialize #Course class instance pushed to @@all array
    @@all << self
  end

  def self.all #calls the variable @@all
    @@all
  end

  def self.reset_all #clears @@all array
    @@all.clear
  end

end
