class Course
<<<<<<< HEAD
  attr_accessor :title, :schedule, :description
  @@all = []

  def initialize
    @@all << self
  end
=======
	attr_accessor :schedule, :title, :description
	@@all = []

	def initialize
		@@all << self
	end

	def self.all 
		@@all
	end

	def self.reset_all
		@@all.clear
	end
end
>>>>>>> 3b8844487e160fadb24b6877ff1e7f0bad75f865

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

end
