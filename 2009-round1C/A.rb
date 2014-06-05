def algorithm(line1)
  char_mapping = {"#{line1[0]}" => 1} # first mapped character should be 1
  next_mapping = 0 # increment: 0, 2, 3, 4, ...

  line1.each_char do |char|
    if char_mapping[char].nil?
      char_mapping[char] = next_mapping
      next_mapping == 0 ? next_mapping = 2 : next_mapping += 1
    end
  end

  result = 0
  base = (char_mapping.length < 2 ? 2 : char_mapping.length)

  str_len = line1.size
  line1.split('').each_with_index do |char, i|
    result += char_mapping[char] * base ** (str_len - 1 - i)
  end
  result
end

file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  line1 = file.readline.chomp
  puts "Case ##{i}: #{algorithm(line1)}"
end
