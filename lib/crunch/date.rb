module Crunch
  def self.date_fixer raw_date
    d = DateTime.parse raw_date
    d.strftime "%A the #{d.day.ordinalize} of %B"
  end

  def self.time_since past_date
    now = DateTime.now
    i = (now - Date.parse(past_date)).to_i

    return 'in the future' if i < 0
    return 'today' if i == 0
    return 'yesterday' if i == 1

    d = i == 1 ? 'day' : 'days'

    '%d %s ago' % [
      i,
      d
    ]
  end
end
