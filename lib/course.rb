class Course
  attr_accessor :title, :schedule, :description

  @@courses = []
  def initialize
    @@courses.push(self)
  end

  def self.all
    @@courses
  end

  def self.reset_all
    @@courses = []
  end
end
