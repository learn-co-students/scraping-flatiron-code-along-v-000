require 'pry'
 class Course
   attr_accessor :title, :description, :schedule
   @@all = []  #keeps track of all the instances of the course.
    def initialize
      @@all << self
    end

    def self.all
      # binding.pry
      @@all
    end

    def self.reset_all
      @@all.clear
    end
 end
