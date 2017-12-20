class Course

attr_accessor :title, :schedule, :description
@@all = []

def initialize
  @@all << self
end

class self.all
@@all
end

class self.reset_all
  @@all.clear
end
