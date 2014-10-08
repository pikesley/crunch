require 'spec_helper'

module Crunch
  describe Crunch do
    it 'should format a date correctly' do
      expect(Crunch.date_fixer '2014-06-15').to eq 'Sunday the 15th of June'
    end

    it 'should calculate an interval correctly' do
      Timecop.freeze '2014-10-03T00:00:00+00:00'

      expect(Crunch.time_since '2014-10-03').to match /today/
      expect(Crunch.time_since '2014-10-02').to match /yesterday/
      expect(Crunch.time_since '2014-10-01').to match /2 days ago/
      expect(Crunch.time_since '2014-09-26').to match /7 days ago/

      expect(Crunch.time_since '2014-09-10').to match /3 weeks ago/
      expect(Crunch.time_since '2014-09-03').to match /4 weeks ago/
      expect(Crunch.time_since '2014-08-12').to match /7 weeks ago/

      expect(Crunch.time_since '2014-06-15').to match /3 months ago/
      expect(Crunch.time_since '2014-03-15').to match /6 months ago/
      expect(Crunch.time_since '2013-04-03').to match /18 months ago/

      expect(Crunch.time_since '2012-10-03').to match /2 years ago/

      expect(Crunch.time_since '2015-01-01').to match /in the future/

      Timecop.return
    end

    it 'should insert brackets correctly' do
      expect(Crunch.time_since '1974-06-15').to match /^(.*)$/
      expect(Crunch.time_since '1970-01-01', nil).to match /^[0-9]* years ago$/
    end
  end
end
