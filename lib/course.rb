class Course

  attr_accessor :title, :schedule, :description

  def self.all
    @@all
  end

  @@all = []

  def initialize
    @@all.push(self)
  end

  def self.reset_all
    @@all.clear
  end

end
