class Course
  attr_accessor :title, :schedule, :description

  @@all = []

  def self.all
    @@all
  end

  def initialize
    @@all << self
  end

  def self.reset_all
    @@all.clear
  end


end



