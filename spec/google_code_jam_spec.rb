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

  describe '#t9_spelling' do
    it 'returns t9 keypresses for given words' do
      test_cases = [
        ['hi', '44 444'],
        ['yes', '999337777'],
        ['foo  bar', '333666 6660 022 2777'],
        ['hello world', '4433555 555666096667775553']
      ]

      test_cases.each { |c| GoogleCodeJam.t9_spelling(c.first).should == c.last }
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

  describe '#speaking_in_tongues' do
    it 'returns a translated phrase' do
      test_cases = [
        ['y qee', 'a zoo'],
        ['ejp mysljylc kd kxveddknmc re jsicpdrysi', 'our language is impossible to understand'],
        ['rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd', 'there are twenty six factorial possibilities'],
        ['de kr kd eoya kw aej tysr re ujdr lkgc jv', 'so it is okay if you want to just give up']
      ]

      test_cases.each { |c| GoogleCodeJam.speaking_in_tongues(c[0]).should == c[1]}
    end
  end

  describe '#password_problem' do
    it 'returns keystrokes to return a correct password' do
      test_cases = [
        ['2 5', '0.6 0.6', '7.000000'],
        ['1 20', '1', '20.000000'],
        ['3 4', '1 0.9 0.1', '4.500000'],
        ['3 10', '0.940672 0.178028 0.820738', '12.000000']
      ]

      test_cases.each { |c| GoogleCodeJam.password_problem(c[0], c[1]).should == c[2] }
    end
  end
end