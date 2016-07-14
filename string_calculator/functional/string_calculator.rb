require_relative './number_parser'

class StringCalculator
  class << self
    def add(number_string)
      numbers = NumberParser.numbers(number_string)
      clean_numbers = clean(numbers)
      sum(clean_numbers)
    end

    private

    def clean(numbers)
      raise_on_negative(numbers)
      remove_too_large(numbers)
    end

    def raise_on_negative(numbers)
      negative_numbers = numbers.select {|n| n < 0}
      if negative_numbers.any?
        number_string = negative_numbers.join(',')
        raise "Negative numbers not allowed: [#{number_string}]"
      end
    end

    def remove_too_large(numbers)
      numbers.reject {|n| n > 1000}
    end

    def sum(numbers)
      numbers.inject(&:+) || 0
    end
  end
end
