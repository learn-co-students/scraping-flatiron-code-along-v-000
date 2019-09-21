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
   self.all.clear
 end

end
