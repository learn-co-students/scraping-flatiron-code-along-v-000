class Course
  attr_accessor :title, :schedule, :description
  @@all = []


  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def initialize (title: "", schedule: "", description: "")
    self.class.all << self
    self.title = title
    self.schedule = schedule
    self.description = description
  end

end
