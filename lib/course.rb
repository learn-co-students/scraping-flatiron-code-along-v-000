class Course
    
    attr_accessor :title, :schedule, :description
    
    @@all = []
    
    def self.all
        @@all
    end
    
    def self.reset_all
       @@all.clear 
    end
    
    def save
       @@all << self 
    end
    
    def initialize
        save
    end
end

