class InputParser
  def self.parse(string_numbers)
    if string_numbers.start_with?("//")
      parts = string_numbers.split("\n", 2)
      delimiter_part = parts[0][2..-1]
      numbers = parts[1]

      if delimiter_part.start_with?('[') && delimiter_part.end_with?(']')
        delimiter = delimiter_part[1..-2]
      else
        delimiter = delimiter_part
      end

      [numbers, delimiter]
    else
      [string_numbers, /,|\n/]
    end
  end
end 