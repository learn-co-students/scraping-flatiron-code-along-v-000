class Course
  attr_accessor :description, :schedule, :title

  @@all = []

  def initialize
    @@all << self
  end

  def self.reset_all
    @@all.clear
  end

  def self.all
    @@all
  end
end
