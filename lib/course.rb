class Course
  attr_accessor :title, :schedule, :description

  @@all = []
  def self.all
    @@all
  end
  def self.reset_all
    @@all.clear
  end

  def initialize(title = nil, schedule = nil, description = nil)
    @title = title
    @schedule = schedule
    @description = description
    self.class.all << self
  end
end

