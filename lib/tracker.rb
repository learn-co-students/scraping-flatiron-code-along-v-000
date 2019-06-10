module Tracker


  module Class

    ALL = []

    def all
      ALL
    end

    def reset_all
      ALL.clear
    end

  end


  module Instance

    def initialize
      self.class.all.push(self)
    end

  end

end
