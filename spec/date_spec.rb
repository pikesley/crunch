require 'spec_helper'

module Crunch
  describe Crunch do
    it 'should format a date correctly' do
      expect(Crunch.date_fixer '2014-10-02').to eq 'Thursday the 2nd of October'
    end
  end
end
