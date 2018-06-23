class Course
  
  attr_accessor :title, :schedule, :description
 
  @@instances = []
  
  def initialize
    @@instances << self
  end
  
  def self.all 
    @@instances
  end
  
  def self.reset_all
    @@instances.clear
  end
  
end


