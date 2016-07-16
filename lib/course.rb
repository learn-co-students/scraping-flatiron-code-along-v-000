class Course
  attr_accessor :title, :description, :schedule

  @@all=[]

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  # this is a class method because it is called directly on the class. We need this to manipulate the instances of the class
  def self.reset_all #resetting the array that holds all the instances of the class
      @@all.clear
  end

end
