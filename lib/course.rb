#####title
#has a setter and a getter method for title
#####schedule
#has a setter and a getter method for a course's schedule
#####description
#has a setter and a getter method for a course's description
#####.all
#returns and array of all the instances of the Course class

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
end
