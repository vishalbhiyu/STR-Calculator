class StringCalculator
    def self.add(numbers)
      return 0 if numbers.empty?
  
      delimiter = ",|\n"
      if numbers.start_with?("//")
        delimiter_section, numbers = numbers.split("\n", 2)
        delimiters = delimiter_section[2..-1].scan(/\[([^\]]+)\]|./).flatten.compact
        delimiter = delimiters.map { |d| Regexp.escape(d) }.join("|")
      end
  
      num_list = numbers.split(/#{delimiter}/).map(&:to_i)
  
      negatives = num_list.select { |num| num < 0 }
      raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  
      num_list.reject { |num| num > 1000 }.sum
    end
  end
  