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


        it 'handles newline delimiters' do
            expect(StringCalculator.add("1\n2,3")).to eq(6)
            expect(StringCalculator.add("1\n2\n3")).to eq(6)
          end

        it 'handles custom delimiters' do
            expect(StringCalculator.add("//;\n1;2")).to eq(3)
            expect(StringCalculator.add("//|\n1|2|3")).to eq(6)
          end

          it 'raises exception for negative numbers' do
            expect { StringCalculator.add('1,-2') }.to raise_error('negatives not allowed: -2')
            expect { StringCalculator.add('-1,-2,3') }.to raise_error('negatives not allowed: -1, -2')
          end

          it 'ignores numbers larger than 1000' do
            expect(StringCalculator.add('2,1001')).to eq(2)
            expect(StringCalculator.add('1000,1001')).to eq(1000)
          end

          it 'handles multi-character delimiters' do
            expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
            expect(StringCalculator.add("//[---]\n1---2---3")).to eq(6)
          end

          it 'handles multiple delimiters' do
            expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
            expect(StringCalculator.add("//[**][%%]\n1**2%%3")).to eq(6)
          end
end
