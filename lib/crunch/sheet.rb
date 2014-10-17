require 'dotenv'

Dotenv.load

module Crunch
  class Sheet
    def initialize
      @session = GoogleDrive.login(ENV['GOOGLE_USER'], ENV['GOOGLE_PASS'])
      @sheet = @session.spreadsheet_by_key(ENV['SPREADSHEET_ID'])
    end
  end
end
