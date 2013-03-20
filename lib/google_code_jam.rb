class GoogleCodeJam
  class << self
    def reverse_words(string)
      string.split(' ').reverse.join(' ')
    end
  end
end