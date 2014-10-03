require 'spec_helper'

module Crunch
  describe Meal do
    before :each do
      @ss_row = [
        '2014-10-02',
        'Pinky',
        '2',
        '2',
        '0:12:30'
      ]
      @meal = Meal.new @ss_row
    end

    it 'should have a date' do
      expect(@meal.date).to eq 'Thursday the 2nd of October'
    end
  end
end
