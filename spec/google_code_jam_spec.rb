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
end