require 'spec_helper'

module Crunch
  describe Shed do
    before :each do
      Timecop.freeze '2014-10-13T00:00:00+00:00'

      @ss_row = [
        '1',
        '2014-10-03',
        '2014-10-13'
      ]
      @shed = Shed.new @ss_row
    end

    after :each do
      Timecop.return
    end

    it 'should have a date' do
      expect(@shed.date).to eq 'Monday the 13th of October'
    end

    it 'should have a time_since' do
      expect(@shed.time_since).to eq '(today)'
    end
  end
end
