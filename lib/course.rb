class Course

@@all = []

attr_accessor :title, :schedule, :description

def initialize
  @title = title
  @schedule = schedule
  @description = description
  self.class.all << self 
end

def self.all
  @@all
end

def self.reset_all
  self.all.clear
end

end

