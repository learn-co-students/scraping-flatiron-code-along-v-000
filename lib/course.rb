class Course
  attr_accessor :title, :schedule, :description

  @@courses = []

  def initialize
    @@courses << self
  end

  def self.all
    @@courses
  end

  def self.reset_all
    self.all.clear
  end
end