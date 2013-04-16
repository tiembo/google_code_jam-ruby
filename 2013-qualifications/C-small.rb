def is_palindrome?(int)
  l = int.to_s
  l == l.reverse
end

def is_int_sqrt?(int)
  a = Math.sqrt(int)
  b = a.to_i
  a == b ? b : false
end

def algorithm(line)
  numbers = []
  start_num, end_num = line.split(' ').map(&:to_i)

  count = 0
  start_num.upto(end_num) do |num|
    if is_palindrome?(num)
      if (i = is_int_sqrt?(num))
        if is_palindrome?(i)
          puts num
          numbers << num
          count += 1
        end
      end
    end
  end


  puts numbers
  count
end

file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  puts "Case ##{i}: #{algorithm(file.readline.chomp)}"
end