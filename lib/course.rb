class Podcast

    attr_accessor :name, :rank, :summary

      @@all = []

    def initialize
      @@all
    end

    def self.all
      @@all << self
    end

  def self.reset_all
    @@all.clear
  end
end
