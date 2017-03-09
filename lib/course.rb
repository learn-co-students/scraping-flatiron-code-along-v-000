class Course
  #attributes
  attr_accessor :title, :schedule, :description
  @@all = Array.new

  #initialize
  def initialize
    @@all << self
  end

  #class methods
  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
  #instance method


  #class methods


end
