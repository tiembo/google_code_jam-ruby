class GoogleCodeJam
  class << self
    def reverse_words(string)
      string.split(' ').reverse.join(' ')
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