require 'spec_helper'

module Crunch
  describe Length do
    before :each do
      Timecop.freeze '2014-10-03'
      @ss_rows = [
        [
          '2014-09-30',
          '45'
        ],
        [
          '2014-10-03',
          '48'
        ]
      ]
      @length = Length.new @ss_rows
    end

    after :each do
      Timecop.return
    end

    it 'should have points' do
      expect(@length.points).to eq [
        {x: 1412035200, y: 45},
        {x: 1412294400, y: 48}
      ]
    end

    it 'should have a latest date' do
      expect(@length.latest_date).to eq 'Friday the 3rd of October'
    end

    it 'should have a time_since' do
      expect(@length.time_since).to eq '(today)'
    end
  end
end
