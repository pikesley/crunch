require 'google_drive'
require 'dotenv'

Dotenv.load

SCHEDULER.every '5m', :first_at => Time.now do
  session = GoogleDrive.login(ENV['GOOGLE_USER'], ENV['GOOGLE_PASS'])
  sheet = session.spreadsheet_by_key(ENV['SPREADSHEET_ID'])

  feeds = sheet.worksheets[0]
  meal = Crunch::Meal.new feeds.rows.reverse.select { |r| r[3].to_i > 0 }[0]
  send_event('meal', { food: meal.menu, date: meal.date, interval: meal.time_since })

  lengths = Crunch::Length.new sheet.worksheets[1].rows[1..-1]
  send_event(:length, points: lengths.points, suffix: 'cm', date: lengths.latest_date, interval: lengths.time_since)

  weights = Crunch::Weight.new sheet.worksheets[2].rows[1..-1]
  send_event(:weight, points: weights.points, suffix: ' grams', date: weights.latest_date, interval: weights.time_since)

  sheds = sheet.worksheets[3]
  shed = Crunch::Shed.new sheds.rows.reverse.select { |r| r[2] != '' }[0]
  send_event(:shed, { date: shed.date, interval: shed.time_since })
end
