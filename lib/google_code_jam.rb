class GoogleCodeJam
  class << self
    def reverse_words(string)
      string.split(' ').reverse.join(' ')
    end

    def t9_spelling(string)
      mapping = {
        'a' => '2', 'b' => '22', 'c' => '222',
        'd' => '3', 'e' => '33', 'f' => '333',
        'g' => '4', 'h' => '44', 'i' => '444',
        'j' => '5', 'k' => '55', 'l' => '555',
        'm' => '6', 'n' => '66', 'o' => '666',
        'p' => '7', 'q' => '77', 'r' => '777', 's' => '7777',
        't' => '8', 'u' => '88', 'v' => '888',
        'w' => '9', 'x' => '99', 'y' => '999', 'z' => '9999',
        ' ' => '0',
      }

      previous_char = string[0]
      output = mapping[previous_char]
      1.upto(string.length - 1) do |i|
        char = string[i]
        mapping[char][0] == mapping[previous_char][0] ? output += ' ' : previous_char = char
        output += mapping[char].to_s
      end
      output
    end

    def minimum_scalar_product(num_vectors, vector_a_str, vector_b_str)
      vector_a = vector_a_str.split(' ').map(&:to_i).sort
      vector_b = vector_b_str.split(' ').map(&:to_i).sort.reverse

      sum = 0
      1.upto(num_vectors.to_i) do |i|
        sum += vector_a[i-1].to_i * vector_b[i-1].to_i
      end

      sum
    end

    def speaking_in_tongues(line)
      mapping = {
        'a' => 'y', 'b' => 'h', 'c' => 'e', 'd' => 's', 'e' => 'o',
        'f' => 'c', 'g' => 'v', 'h' => 'x', 'i' => 'd', 'j' => 'u',
        'k' => 'i', 'l' => 'g', 'm' => 'l', 'n' => 'b', 'o' => 'k',
        'p' => 'r', 'q' => 'z', 'r' => 't', 's' => 'n', 't' => 'w',
        'u' => 'j', 'v' => 'p', 'w' => 'f', 'x' => 'm', 'y' => 'a',
        'z' => 'q', ' ' => ' '
      }
      result = ''
      line.each_char do |char|
        result += mapping[char]
      end
      result
    end

    def dancing_with_the_googlers(line)

      # returns [normal, surprising] scores for a given total
      def find_scores(total_score)
        return [[0,0,0], nil] if total_score == '0'
        return [[0,0,1], nil] if total_score == '1'
        return [[9,10,10], nil] if total_score == '29'
        return [[10,10,10], nil] if total_score == '30'

        ts = total_score.to_i
        remainder = ts % 3
        div = ts / 3
        if remainder == 0
          [[div,div,div],[div-1,div,div+1]]
        elsif remainder == 1
          [[div,div,div+1],[div-1,div+1,div+1]]
        else # remainder == 2
          [[div,div+1,div+1],[div,div,div+2]]
        end
      end

      values = line.split
      #num_googlers = values[0].to_i # value not used
      num_surprising_scores = values[1].to_i
      best_result_of_at_least = values[2].to_i
      scores = values[3..values.length - 1]

      num_better_than_least = 0

      scores.each do |s|
        normal_score, surprising_score = find_scores(s)

        if normal_score.any? {|a| a >= best_result_of_at_least}
          num_better_than_least += 1
        elsif (surprising_score != nil) && (num_surprising_scores > 0) && (surprising_score.any? {|a| a >= best_result_of_at_least})
          num_better_than_least += 1
          num_surprising_scores -= 1
        end
      end

      num_better_than_least
    end

    def recycled_numbers(line)
      start_num, end_num = line.split.map(&:to_i)
      num_digits = start_num.to_s.length

      evaluated_numbers = {} # keys as integers are slower than keys as strings
      count = 0
      start_num.upto(end_num) do |n|
        num = n.to_s
        next if evaluated_numbers[num]

        # this check is expensive and unecessary - skip
        #next if num.split('').uniq.count == 1

        evaluated_numbers[num] = true

        ary = num.split('')
        increment = 1
        1.upto(num_digits - 1) do |i|
          num_string = ary.rotate(i).join

          # for numbers such as 1212
          if evaluated_numbers[num_string]
            next
          else
            evaluated_numbers[num_string] = true

            # faster here than as another conditional for parent if statement
            if num_string[0] != '0' # faster than num_string.length == num_digits for large number ranges
              num = num_string.to_i

              # comparison of number here is slightly faster than comparing strings
              if num >= start_num && num <= end_num
                count += increment
                increment += 1
              end
            end
          end
        end
      end

      count
    end

    def password_problem(line1, line2)
      pressed_keystrokes, password_length = line1.split.map(&:to_i)
      probabilities = line2.split.map(&:to_f)
      correct_password_keystrokes = password_length + 1
      keystrokes = 1 + correct_password_keystrokes # start with the case where we press enter right away

      percentage_right = 1.0
      num_backspaces = pressed_keystrokes

      # don't care about the case where we backspace to erase the entire word -
      # pressing enter to immediately start over will always be a lower keypress
      probabilities.each do |p|
        num_backspaces -= 1
        percentage_right *= p
        probability_for_num_backspaces = num_backspaces * 2 +                                   # backspace + forward space keypresses
                                         (correct_password_keystrokes - pressed_keystrokes) +   # for completion of word
                                         (1 - percentage_right) * (correct_password_keystrokes) # for probability of getting word correct
        keystrokes = [keystrokes, probability_for_num_backspaces].min
      end

      '%0.6f' % keystrokes
    end
  end
end