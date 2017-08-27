class Course

	attr_accessor :title, :description, :schedule

	@@all = []


	def initialize
		@@all << self
	end

	def self.reset_all
		self.all.clear
	end

	def self.all
		@@all
	end



end

