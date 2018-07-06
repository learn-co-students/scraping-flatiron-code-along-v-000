class Course
    attr_accessor :title, :schedule, :description

    @@allcourses = []

    def initialize
        @@allcourses << self
    end

    def self.all
        @@allcourses
    end

    def self.reset_all
        @@allcourses.clear
    end
end
