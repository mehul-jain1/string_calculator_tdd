class InputParser
  def self.parse(string_numbers)
    if string_numbers.start_with?("//")
      parts = string_numbers.split("\n", 2)
      delimiter_part = parts[0][2..-1]
      numbers = parts[1]  

      delimiters = delimiter_part.scan(/\[(.*?)\]/).flatten
      if delimiters.any?
        delimiter_regex = Regexp.union(delimiters)
        [numbers, delimiter_regex]
      else
        [numbers, delimiter_part]
      end
    else
      [string_numbers, /,|\n/]
    end
  end
end 