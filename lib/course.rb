class Course
  # class variables
  @@all = []

  # attribute accessors
  attr_accessor :title, :schedule, :description

  # instance methods
  def initialize
    @@all << self
  end

  # class methods
  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
