require_relative "../concerns/memorable.rb"

class Course
    extend Memorable::ClassMethods
    include Memorable::InstanceMethods

    attr_accessor :title, :schedule, :description

    @@all = []

    def self.all
        @@all
    end
end

