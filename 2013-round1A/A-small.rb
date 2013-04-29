def algorithm(line1)
  r, t = line1.split.map(&:to_i)

  rings = 1
  painted = 2 * r + 1

  while 1
    painted += 2 * (r + 2 * rings) + 1
    if painted > t
      break
    else
      rings += 1
    end
  end

  rings
end

file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  line1 = file.readline.chomp
  puts "Case ##{i}: #{algorithm(line1)}"
end