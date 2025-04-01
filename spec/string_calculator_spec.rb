require_relative '../lib/string_calculator'
require 'byebug'

RSpec.describe StringCalculator do
 
    describe '.add' do
        it 'returns 0 for empty string' do
          expect(StringCalculator.add('')).to eq(0)
        end



end
