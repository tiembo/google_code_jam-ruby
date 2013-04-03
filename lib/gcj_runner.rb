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

  def t9_spelling
    output = ''
    num_cases = @file.readline.chomp.to_i

    1.upto(num_cases) do |i|
      str = @file.readline.chomp
      output += "Case ##{i}: #{GoogleCodeJam.t9_spelling(str)}\n"
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

  def speaking_in_tongues
    output = ''
    num_cases = @file.readline.chomp.to_i

    1.upto(num_cases) do |i|
      line = @file.readline.chomp
      output += "Case ##{i}: #{GoogleCodeJam.speaking_in_tongues(line)}\n"
    end

    output
  end

  def recycled_numbers
    output = ''
    num_cases = @file.readline.chomp.to_i

    1.upto(num_cases) do |i|
      line = @file.readline.chomp
      output += "Case ##{i}: #{GoogleCodeJam.recycled_numbers(line)}\n"
    end

    output
  end

  def password_problem
    output = ''
    num_cases = @file.readline.chomp.to_i

    1.upto(num_cases) do |i|
      line1 = @file.readline.chomp
      line2 = @file.readline.chomp
      output += "Case ##{i}: #{GoogleCodeJam.password_problem(line1, line2)}\n"
    end

    output
  end
end
