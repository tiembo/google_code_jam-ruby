def get_winner(line)
  u = line.uniq.sort

  return 'X' if [['X'], ['T','X']].include?(u)
  return 'O' if [['O'], ['O','T']].include?(u)
  nil
end

def algorithm(lines)

  lines.each do |l|
     if (w = get_winner(l))
       return w + ' won'
     end
  end

  diag1 = []
  diag2 = []

  0.upto(3) do |i|
    aa = lines.map{|l| l[i]}
    if (w = get_winner(aa))
      return w + ' won'
    end

    diag1 << lines[i][i]
    diag2 << lines[i][3-i]
  end

  if (w = get_winner(diag1))
    return w + ' won'
  end

  if (w = get_winner(diag2))
    return w + ' won'
  end

  return 'Draw' unless lines.flatten.include?('.')

  'Game has not completed'
end

file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  lines = []
  4.times {lines << file.readline.chomp.split('')}
  file.readline # empty line
  puts "Case ##{i}: #{algorithm(lines)}"
end