require 'google_drive'
require 'date'
require 'active_support/core_ext/integer/inflections'
require 'dotenv'

Dotenv.load

class Meal
  attr_reader :date, :raw_date

  def initialize row
    @date = date_fixer row[0]
    @food = row[1]
    @offered = row[2].to_i
    @eaten = row[3].to_i
    @time = row[4]
  end

  def date_fixer raw
    @raw_date = DateTime.parse raw

    @raw_date.strftime "%A the #{@raw_date.day.ordinalize} of %B"
  end

  def menu
    @food = @eaten > 1 ? @food.pluralize : @food

    '%d %s' % [
      @eaten,
      @food
    ]
  end

  def interval
    now = DateTime.now

    i = (now - @raw_date).to_i

    d = i == 1 ? 'day' : 'days'

    '(%d %s ago)' % [
      i,
      d
    ]
  end
end

SCHEDULER.every '2s' do
  session = GoogleDrive.login(ENV['GOOGLE_USER'], ENV['GOOGLE_PASS'])

  sheet = session.spreadsheet_by_key(ENV['SPREADSHEET_ID'])

  feeds = sheet.worksheets[0]

  meal = Meal.new feeds.rows[-1]

  send_event('meal', { food: meal.menu, date: meal.date, interval: meal.interval })
end
