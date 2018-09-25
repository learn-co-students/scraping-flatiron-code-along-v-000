class Course
  attr_accessor :title, :schedule, :description
  ALL = []

  def initialize
    ALL << self
  end

  def self.all
    ALL
  end

  def self.reset_all
    all.clear
  end
end
