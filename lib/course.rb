class Course
#=================properties===================
  attr_accessor :title, :schedule, :description
  @@all = []
#=================intialize====================
  def initialize
    self.class.all << self
  end
#==================class=======================
  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end
#==============================================
end