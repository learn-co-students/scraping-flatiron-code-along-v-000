class Course
  attr_accessor :title, :schedule, :description
  @@courses=[]
  def self.all
    @@courses
  end
  def self.reset_all
    @@courses=[]
  end
  def initialize
    @@courses<<self
  end
end
