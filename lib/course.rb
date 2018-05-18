class Course 
  @@all = []

attr_accessor :description , :schedule, :title
  def initialize #(title,schedule,description)
    # @title = title
    # @schedule = schedule
    # @description = description
    @@all << self
  end 

  def self.reset_all
    self.all.clear
  end
  def self.all 
    @@all 
  end 
end


