require './lib/google_code_jam'

class GCJRunner
  def initialize(argv)
    filename = argv[0]

    if filename == nil
      puts 'need a filename'
      exit
    end

    @file = File.open(filename)
  end

  def reverse_words
    output = ''
    num_cases = @file.readline.chomp.to_i

    1.upto(num_cases) do |i|
      str = @file.readline.chomp
      output += "Case ##{i}: #{GoogleCodeJam.reverse_words(str)}\n"
    end

    output
  end

  def minimum_scalar_product
    output = ''
    num_cases = @file.readline.chomp.to_i

    1.upto(num_cases) do |i|
      num_vectors = @file.readline.chomp
      vector_a = @file.readline.chomp
      vector_b = @file.readline.chomp
      output += "Case ##{i}: #{GoogleCodeJam.minimum_scalar_product(num_vectors, vector_a, vector_b)}\n"
    end

    output
  end
end
