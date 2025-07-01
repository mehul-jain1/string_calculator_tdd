require "minitest/autorun"
require_relative "../lib/string_calculator"

class TestStringCalculator < Minitest::Test
  def test_calculate_empty_string_returns_zero
    calculator = StringCalculator.new
    assert_equal 0, calculator.calculate("")
  end

  def test_calculate_single_number_returns_number
    calculator = StringCalculator.new
    assert_equal 1, calculator.calculate("1")
  end

  def test_calculate_two_numbers_returns_sum
    calculator = StringCalculator.new
    assert_equal 6, calculator.calculate("1,5")
  end

  def test_calculate_multiple_numbers_returns_sum
    calculator = StringCalculator.new
    assert_equal 15, calculator.calculate("1,2,3,4,5")
  end

  def test_calculate_newline_as_delimiter
    calculator = StringCalculator.new
    assert_equal 6, calculator.calculate("1\n2,3")
  end

  def test_calculate_custom_delimiter
    calculator = StringCalculator.new
    assert_equal 3, calculator.calculate("//;\n1;2")
  end

  def test_calculate_negative_number_throws_exception
    calculator = StringCalculator.new
    exception = assert_raises(ArgumentError) { calculator.calculate("-1,2,-3") }
    assert_equal "negatives not allowed: -1, -3", exception.message
  end

  def test_calculate_ignores_numbers_bigger_than_1000
    calculator = StringCalculator.new
    assert_equal 2, calculator.calculate("2,1001")
    assert_equal 1001, calculator.calculate("1000,1")
  end

  def test_calculate_custom_delimiter_any_length
    calculator = StringCalculator.new
    assert_equal 6, calculator.calculate("//[***]\n1***2***3")
  end

  def test_calculate_multiple_custom_delimiters
    calculator = StringCalculator.new
    assert_equal 6, calculator.calculate("//[*][%]\n1*2%3")
  end

  def test_calculate_multiple_long_custom_delimiters
    calculator = StringCalculator.new
    assert_equal 6, calculator.calculate("//[**][%%]\n1**2%%3")
  end

  def test_calculate_multiply_with_star_delimiter
    calculator = StringCalculator.new
    assert_equal 6, calculator.calculate("//[*]\n2*3")
    assert_equal 24, calculator.calculate("//[*]\n2*3*4")
  end

  def test_calculate_multiply_handles_empty_string
    calculator = StringCalculator.new
    assert_equal 0, calculator.calculate("//[*]\n")
  end

  def test_calculate_multiply_ignores_numbers_bigger_than_1000
    calculator = StringCalculator.new
    assert_equal 6, calculator.calculate("//[*]\n2*3*1001")
  end

  def test_calculate_multiply_throws_exception_for_negatives
    calculator = StringCalculator.new
    exception = assert_raises(ArgumentError) { calculator.calculate("//[*]\n-2*3*-4") }
    assert_equal "negatives not allowed: -2, -4", exception.message
  end
end
