module Crunch
  class Weight
    attr_reader :points, :latest_date, :time_since

    def initialize rows
      @points = rows.map { |i| {x: DateTime.parse(i[0]).strftime('%s').to_i, y: i[1].to_i} }
      @latest_date = Crunch.date_fixer rows[-1][0]
      @time_since = Crunch.time_since rows[-1][0]
    end
  end
end
