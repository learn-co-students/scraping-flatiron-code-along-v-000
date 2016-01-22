require 'pry'
require 'nokogiri'
require 'open-uri'

class Course
	attr_accessor :title, :description, :schedule

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

