class StringCalculator
  def add(string_numbers)
    numbers, delimiter = parse_input(string_numbers)
    integers = numbers.split(delimiter).map(&:to_i)
    
    negatives = integers.select { |n| n < 0 }
    if negatives.any?
      raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
    end

    integers.reject { |n| n > 1000 }.sum
  end

  private

  def parse_input(string_numbers)
    if string_numbers.start_with?("//")
      parts = string_numbers.split("\n", 2)
      delimiter = parts[0][2]
      numbers = parts[1]
      [numbers, delimiter]
    else
      [string_numbers, /,|\n/]
    end
  end
end
