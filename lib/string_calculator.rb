class StringCalculator
  def add(string_numbers)
    numbers, delimiter = parse_input(string_numbers)
    numbers.split(delimiter).map(&:to_i).sum
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
