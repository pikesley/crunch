require 'spec_helper'

module Crunch
  describe Crunch do
    it 'should format a date correctly' do
      expect(Crunch.date_fixer '2014-06-15').to eq 'Sunday the 15th of June'
    end
  end
end
