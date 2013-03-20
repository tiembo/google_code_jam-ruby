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
    num_cases = @file.readline.chomp.to_i

    1.upto(num_cases) do |i|
      str = @file.readline.chomp
      puts "Case ##{i}: "  + GoogleCodeJam.reverse_words(str)
    end
  end

  def minimum_scalar_product
    num_cases = @file.readline.chomp.to_i

    1.upto(num_cases) do |i|
      num_vectors = @file.readline.chomp
      vector_a = @file.readline.chomp
      vector_b = @file.readline.chomp
      puts "Case ##{i}: #{GoogleCodeJam.minimum_scalar_product(num_vectors, vector_a, vector_b)}"
    end
  end
end
