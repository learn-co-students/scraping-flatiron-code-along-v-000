class Course
  attr_accessor :title, :schedule, :description
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
  #binding.pry

  def self.reset_all
    @@all.clear
  end
end
