require 'spec_helper'

module Crunch
  describe Crunch do
    it 'should format a date correctly' do
      expect(Crunch.date_fixer '2014-06-15').to eq 'Sunday the 15th of June'
    end

    it 'should calculate an interval correctly' do
      Timecop.freeze '2014-10-03T00:00:00+00:00'

      expect(Crunch.time_since '2014-10-03').to eq '(today)'
      expect(Crunch.time_since '2014-10-02').to eq '(yesterday)'
      expect(Crunch.time_since '2014-10-01').to eq '(2 days ago)'
    #  expect(Crunch.time_since '2014-06-15', nil).to eq '110 days ago'
      expect(Crunch.time_since '2015-01-01').to eq '(in the future)'
      expect(Crunch.time_since '2014-09-03').to eq '(4 weeks ago)'
      expect(Crunch.time_since '2014-09-10').to eq '(3 weeks ago)'

      Timecop.return
    end
  end
end
