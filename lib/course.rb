class Course
  attr_accessor :title, :schedule, :description
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

  # def
  #   doc.css(".post").each do |post|
  #     course = Course.new
  #     course.title = post.css("h2").text
  #     course.schedule = post.css(".date").text
  #     course.description = post.css("p").text
  # end


end  # End of Class
