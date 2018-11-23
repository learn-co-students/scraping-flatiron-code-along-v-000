class Course
  attr_accessor :description, :title, :schedule

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

end
