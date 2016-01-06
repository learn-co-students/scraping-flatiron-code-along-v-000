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
  @@all.clear
end

def get_courses
  self.get_page.css(".post")
end

end