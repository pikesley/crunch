require 'spec_helper'

module Crunch
  describe Length do
    before :each do
      @ss_row = [
        '2014-09-30',
        '45'
      ]
      @length = Length.new @ss_row
    end

    it 'should have a date' do
      expect(@length.date).to eq 'Tuesday the 30th of September'
    end

    it 'should have a time_since' do
      expect(@length.time_since).to eq '3 days ago'
    end

    it 'should have a measurement' do
      expect(@length.measurement).to eq '45cm'
    end
  end
end
