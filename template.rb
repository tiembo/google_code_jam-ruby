def algorithm(line1)
end

file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  line1 = file.readline.chomp
  puts "Case ##{i}: #{algorithm(line1)}"
end