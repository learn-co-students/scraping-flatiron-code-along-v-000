class Course
  #  each course has a title, a schedule (either Part- or Full-Time) and a description

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
