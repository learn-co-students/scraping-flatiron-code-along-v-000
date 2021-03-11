class Course 
  @@all = []
  attr_accessor :title, :schedule, :description
  
  def initialize
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.reset_all 
    self.all.clear
  end
end

