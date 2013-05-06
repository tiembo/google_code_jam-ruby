def algorithm(line1, line2)
  size, num_motes = line1.split.map(&:to_i)
  return num_motes if size == 1

  motes = line2.split.map(&:to_i).sort
  max_index = motes.length - 1

  actions = 0
  #while 1
  #  puts "size: #{size}, motes: #{motes.inspect}"
  #
  #  motes.delete_if {|m| m < size}
  #  break if motes.length == 0
  #
  #  #can_absorb_index = motes.index {|m| m < size}
  #  #if can_absorb_index
  #  #  size += motes.delete_at(can_absorb_index)
  #  #else
  #  #  temp_size = size
  #  #
  #  #  should_add = false
  #  #  temp_actions = 0
  #  #  motes.length.times do |i|
  #  #    temp_size += (temp_size - 1)
  #  #    temp_actions += 1
  #  #    if motes.count(temp_size) >= (i)
  #  #      should_add = true
  #  #      break
  #  #    end
  #  #  end
  #    # see if adding a mote of size - 1 will help
  #    i = motes.index {|m| m < (size + size - 1)}
  #  actions += 1
  #
  #    if i
  #    #if should_add
  #    #  actions += temp_actions
  #    #  size = temp_size
  #      motes << (size - 1)
  #      size += size - 1
  #    else
  #      max = motes.max
  #      max_index = motes.index {|m| m == max}
  #      motes.delete_at(max_index)
  #    end
  #  #end
  #end

  motes.each_with_index do |m, i|
    puts size
    if size > m
      size += m
    else
      while size <= m
        actions += 1
        size += (size - 1)
      end
    end
  end

  actions
end

file = File.open(ARGV[0])
num_cases = file.readline.chomp.to_i

1.upto(num_cases) do |i|
  line1 = file.readline.chomp
  line2 = file.readline.chomp
  puts "Case ##{i}: #{algorithm(line1, line2)}"
end