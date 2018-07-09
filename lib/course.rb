require_relative 'tracker'

class Course
  extend Tracker::Class
  include Tracker::Instance

  attr_accessor :title, :schedule, :description

end
