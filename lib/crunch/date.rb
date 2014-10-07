module Crunch
  def self.date_fixer raw_date
    d = DateTime.parse raw_date
    d.strftime "%A the #{d.day.ordinalize} of %B"
  end

  def self.time_since past_date, brackets = true
    now = DateTime.now
    i = (now - Date.parse(past_date)).to_i

    s =  case
    when i > 7

      i = (i / 7).floor
      w = i == 1 ? 'week' : 'weeks'
      '%d %s ago' % [
        i,
        w
      ]
    when i < 0
      'in the future'
    when i == 0
      'today'
    when i == 1
      'yesterday'
    else
      d = i == 1 ? 'day' : 'days'
      '%d %s ago' % [
        i,
        d
      ]
    end

    if brackets
      s = '(%s)' % s
    end

    s
  end
end
