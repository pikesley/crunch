module Crunch
  class Length
    attr_reader :date, :time_since

    def initialize row
      @date = Crunch.date_fixer row[0]
      @time_since = Crunch.time_since row[0]
      @measurement = row[1]
    end

    def measurement
      '%scm' % @measurement
    end
  end
end
