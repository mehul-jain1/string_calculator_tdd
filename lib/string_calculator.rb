require_relative "input_parser"

class StringCalculator
  def add(string_numbers)
    numbers, delimiter = InputParser.parse(string_numbers)
    integers = numbers.split(delimiter).map(&:to_i)
    
    negatives = integers.select { |n| n < 0 }
    if negatives.any?
      raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
    end

    integers.reject { |n| n > 1000 }.sum
  end
end
