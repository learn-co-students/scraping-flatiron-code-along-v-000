class Course
  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    #return @@all
    @@all
  end
  #clear
  def self.reset_all
     @@all.clear
  end
end