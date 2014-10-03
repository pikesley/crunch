require 'spec_helper'

module Crunch
  describe Meal do
    before :each do
      @ss_row = [
        '2010-10-02',
        'Pinky',
        '2',
        '2',
        '0:12:30'
      ]
      @meal = Meal.new @ss_row
    end

#    it 'should have a date' do
#      expect(@meal.date).to be 'Thursday the 2nd of October'
#    end
  end
end
