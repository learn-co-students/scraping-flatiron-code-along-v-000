class Course

  @@courses = []

attr_accessor :title, :schedule, :description

  def initialize
    self.class.all << self
  end

  def self.all
    @@courses
  end

  def self.reset_all
    self.all.clear
  end

end
