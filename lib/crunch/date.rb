module Crunch
  def self.date_fixer raw_date
    d = DateTime.parse raw_date
    d.strftime "%A the #{d.day.ordinalize} of %B"
  end

  def self.time_since past_date, brackets = true
    now = DateTime.now
    i = (now - Date.parse(past_date)).to_i


    if i > 7
      i = (i / 7).floor
      w = i == 1 ? 'week' : 'weeks'
      s = '%d %s ago' % [
        i,
        w
      ]
    else
      d = i == 1 ? 'day' : 'days'
      s = '%d %s ago' % [
        i,
        d
      ]
    end

    s = 'in the future' if i < 0
    s = 'today' if i == 0
    s = 'yesterday' if i == 1

    if brackets
      s = '(%s)' % s
    end

    s
  end
end
