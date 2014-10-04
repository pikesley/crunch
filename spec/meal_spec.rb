require 'spec_helper'

module Crunch
  describe Meal do
    before :each do
      Timecop.freeze '2014-10-03T00:00:00+00:00'

      @ss_row = [
        '2014-10-02',
        'Pinky',
        '2',
        '2',
        '0:12:30'
      ]
      @meal = Meal.new @ss_row
    end

    after :each do
      Timecop.return
    end

    it 'should have a date' do
      expect(@meal.date).to eq 'Thursday the 2nd of October'
    end

    it 'should have a time_since' do
      expect(@meal.time_since).to eq '(yesterday)'
    end

    it 'should have a meal description' do
      expect(@meal.menu).to eq '2 Pinkies'
    end
  end
end
