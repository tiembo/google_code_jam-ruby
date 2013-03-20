require 'spec_helper'
require './lib/google_code_jam'

describe GoogleCodeJam do
  describe '#reverse_words' do
    it 'returns a list of words in reverse order' do
      test_cases = [
        ['this is a test', 'test a is this'],
        ['foobar', 'foobar'],
        ['all your base', 'base your all']
      ]

      test_cases.each { |c| GoogleCodeJam.reverse_words(c.first).should == c.last }
    end
  end

  describe '#minimum_scalar_product' do
    it 'returns scalar product of two vectors' do
      test_cases = [
        ['3', '1 3 -5', '-2 4 1', -25],
        ['5', '1 2 3 4 5', '1 0 1 0 1', 6]
      ]

      test_cases.each { |c| GoogleCodeJam.minimum_scalar_product(c[0], c[1], c[2]).should == c.last }
    end
  end
end