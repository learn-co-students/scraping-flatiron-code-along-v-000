class Course

  attr_accessor :title, :schedule, :description
  @@all =[]

  def initialize
    @@all << self
    @@title = title
    @@schedule = schedule
    @@description = description

  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

end
