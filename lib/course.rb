class Course

  attr_accessor :title, :schedule, :description #has a setter and a getter method for title, schedule and description

  @@all = []

  def initialize
    @@all << self
  end

  def self.all #returns and array of all the instances of the Course class 
    @@all
  end

  def self.reset_all
    @@all.clear
  end

end
