class Course
  attr_accessor :title, :schedule, :description
  @@courses = []

  def initialize
    self.class.all << self
  end

  def self.reset_all
    all.clear
  end

  def self.all
    @@courses
  end
end
