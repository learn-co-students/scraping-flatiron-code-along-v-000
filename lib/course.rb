class Course

  #Variables
  attr_accessor :title, :schedule, :description
  @@all = []

  #Methods
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
