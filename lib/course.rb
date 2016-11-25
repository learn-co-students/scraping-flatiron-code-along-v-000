class Course
  attr_accessor :title, :schedule, :description
  @@course = []
  def initialize
  	@@course << self
  end
  def self.all
    @@course
  end
  def self.reset_all
  	@@course.clear
  end
end
