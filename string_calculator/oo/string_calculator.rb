require_relative './number_parser'

class StringCalculator
  def initialize(number_string)
    @parser = NumberParser.new(number_string)
  end

  def add
    @numbers = @parser.numbers
    clean_numbers
    sum_numbers
  end

  private

  def clean_numbers
    raise_on_negative_numbers
    remove_numbers_too_large
  end

  def raise_on_negative_numbers
    negative_numbers = @numbers.select {|n| n < 0}
    if negative_numbers.any?
      number_string = negative_numbers.join(',')
      raise "Negative numbers not allowed: [#{number_string}]"
    end
  end

  def remove_numbers_too_large
    @numbers = @numbers.reject {|n| n > 1000}
  end

  def sum_numbers
    @numbers.inject(&:+) || 0
  end
end
