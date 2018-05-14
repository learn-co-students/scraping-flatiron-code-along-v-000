class Course

  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize
    @@all << self
  end

  def get_courses

  end

  def make_courses

  end

  def print_courses

  end
  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end



end
