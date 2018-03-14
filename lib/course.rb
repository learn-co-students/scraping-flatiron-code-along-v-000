class Course
  attr_accessor :title, :schedule, :description

  @@courses = []

  def initialize
    @@courses << self
  end

  def self.all
    return @@courses
  end

  def self.reset_all
    @@courses.clear
  end

end