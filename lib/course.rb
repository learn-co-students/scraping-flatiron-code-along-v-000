class Course
attr_accessor :title, :schedule, :description
@@all = []

def initialize
  @@all << self
end# of initialize


def self.all 
  @@all
end# of self.all


def self.reset_all
  @@all.clear
end# of reset_all


end# of class

