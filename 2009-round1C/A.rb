def algorithm(line1)

  # process first character
  char_mapping = {"#{line1[0]}" => 1} # first mapped character should be 1
  decoded_string = ''
  next_mapping = 0 # increment: 0, 2, 3, 4, ...

  line1.split('').each do |char|
    if char_mapping[char].nil?
      char_mapping[char] = next_mapping
      next_mapping == 0 ? next_mapping = 2 : next_mapping += 1
    end

    decoded_string += char_mapping[char].to_s
  end

  base = char_mapping.length
  base = 2 if base < 2
  decoded_string.to_i(base)
end

file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  line1 = file.readline.chomp
  puts "Case ##{i}: #{algorithm(line1)}"
end
