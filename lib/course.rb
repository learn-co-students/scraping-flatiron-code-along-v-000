class Course
  attr_accessor :title, :schedule, :description
  
  def initialize
    @@all << self 
  end 
  @@all = []
  def self.reset_all
    self.all.clear
  end 
  def self.all
    @@all
  end 


end 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
# #   @@all = []

# # attr_accessor :description , :schedule, :title
# #   def initialize #(title,schedule,description)
# #     # @title = title
# #     # @schedule = schedule
# #     # @description = description
# #     @@all << self
# #   end 

# #   def self.reset_all
# #     self.all.clear
# #   end
# #   def self.all 
# #     @@all 
# #   end 
# # end


