require_relative '../lib/string_calculator'
require 'byebug'

RSpec.describe StringCalculator do
 
    describe '.add' do
        it 'returns 0 for empty string' do
          expect(StringCalculator.add('')).to eq(0)
        end


        it 'returns the number for single number input' do
            expect(StringCalculator.add('1')).to eq(1)
            expect(StringCalculator.add('5')).to eq(5)
          end


        it 'returns sum for two numbers' do
            expect(StringCalculator.add('1,2')).to eq(3)
            expect(StringCalculator.add('10,20')).to eq(30)
          end


        it 'returns sum for multiple numbers' do
            expect(StringCalculator.add('1,2,3')).to eq(6)
            expect(StringCalculator.add('1,2,3,4,5')).to eq(15)
          end
end
