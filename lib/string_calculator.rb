require_relative "input_parser"

class StringCalculator
  def calculate(string_numbers)
    numbers, delimiter = InputParser.parse(string_numbers)
    integers = numbers.split(delimiter).map(&:to_i)
    
    validate_no_negatives(integers)
    filtered_integers = filter_large_numbers(integers)
    
    operation = get_operation(delimiter)
    send(operation, filtered_integers)
  end

  private

  def validate_no_negatives(integers)
    negatives = integers.select { |n| n < 0 }
    if negatives.any?
      raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
    end
  end

  def filter_large_numbers(integers)
    integers.reject { |n| n > 1000 }
  end

  def get_operation(delimiter)
    if delimiter.to_s.include?('*')
      :multiply
    else
      :add
    end
  end

  def multiply(integers)
    return 0 if integers.empty?
    integers.reduce(1, :*)
  end

  def add(integers)
    integers.sum
  end
end
