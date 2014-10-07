module Crunch
  def self.date_fixer raw_date
    d = DateTime.parse raw_date
    d.strftime "%A the #{d.day.ordinalize} of %B"
  end

  def self.time_since past_date, brackets = true
    now = DateTime.now
    before = Date.parse past_date
    i = (now - before).to_i

    s = case

    when i == 0
      'today'

    when i == 1
      'yesterday'

    when i < 0
      'in the future'

    when i > 728
      '%d years ago' % (i / 365).floor

    when i > 59
      '%d months ago' % (i / 30).floor

    when i > 13
      '%d weeks ago' % (i / 7).floor

    else
      '%d days ago' % i
    end

    if brackets
      s = '(%s)' % s
    end

    s
  end
end
