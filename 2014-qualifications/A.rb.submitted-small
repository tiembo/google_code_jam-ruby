file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  i1 = file.readline.chomp.to_i
  ary1 = []
  4.times {ary1 << file.readline.chomp.split(' ')}
  row1 = ary1[i1 - 1]

  i2 = file.readline.chomp.to_i
  ary2 = []
  4.times {ary2 << file.readline.chomp.split(' ')}
  row2 = ary2[i2 - 1]

  matches = row1 & row2

  result = case matches.count
           when 0 then 'Volunteer cheated!'
           when 1 then matches.first
           else 'Bad magician!'
           end
  puts "Case ##{i}: #{result}"
end
