module Crunch
  class Shed
    attr_reader :date, :time_since

    def initialize row
      @date = Crunch.date_fixer row[2]
      @time_since = Crunch.time_since row[2]
    end
  end
end
