require 'google_drive'
require 'dotenv'

Dotenv.load

SCHEDULER.every '5m', :first_at => Time.now do
  session = GoogleDrive.login(ENV['GOOGLE_USER'], ENV['GOOGLE_PASS'])
  sheet = session.spreadsheet_by_key(ENV['SPREADSHEET_ID'])
  feeds = sheet.worksheets[0]
  meal = Crunch::Meal.new feeds.rows[-1]

  send_event('meal', { food: meal.menu, date: meal.date, interval: "(#{meal.time_since})" })
end
