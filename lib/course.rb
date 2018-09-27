
class Course 
  
attr_accessor :title, :schedule, :description, :title  

@@all = []

def initialize
  @@all << self 
end

def self.reset_all
  @@all.clear
end

def schedule
  @schedule
end 

def title
  @title
end 

def description
  @description
end 

def self.all 
 @@all 
end

end
