def algorithm(c, f, x)
  c = c.to_f
  f = f.to_f
  x = x.to_f
  n = 0
  base = 0
  best = x / (2 + n * f)
  n = 1

  while true do
    base += c / (2 + (n - 1) * f)
    s = base + x / (2 + n * f)
    s < best ? best = s : break
    n += 1
  end
  best
end

file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  c, f, x = file.readline.chomp.split(' ')
  puts "Case ##{i}: #{sprintf('%0.07f', algorithm(c,f,x))}"
end
