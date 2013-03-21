class GoogleCodeJam
  class << self
    def reverse_words(string)
      string.split(' ').reverse.join(' ')
    end

    def t9_spelling(string)
      mapping = {
        'a' => '2', 'b' => '22', 'c' => '222',
        'd' => '3', 'e' => '33', 'f' => '333',
        'g' => '4', 'h' => '44', 'i' => '444',
        'j' => '5', 'k' => '55', 'l' => '555',
        'm' => '6', 'n' => '66', 'o' => '666',
        'p' => '7', 'q' => '77', 'r' => '777', 's' => '7777',
        't' => '8', 'u' => '88', 'v' => '888',
        'w' => '9', 'x' => '99', 'y' => '999', 'z' => '9999',
        ' ' => '0',
      }

      previous_char = string[0]
      output = mapping[previous_char]
      1.upto(string.length - 1) do |i|
        char = string[i]
        mapping[char][0] == mapping[previous_char][0] ? output += ' ' : previous_char = char
        output += mapping[char].to_s
      end
      output
    end

    def minimum_scalar_product(num_vectors, vector_a_str, vector_b_str)
      vector_a = vector_a_str.split(' ').map(&:to_i).sort
      vector_b = vector_b_str.split(' ').map(&:to_i).sort.reverse

      sum = 0
      1.upto(num_vectors.to_i) do |i|
        sum += vector_a[i-1].to_i * vector_b[i-1].to_i
      end

      sum
    end
  end
end