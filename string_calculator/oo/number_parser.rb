require_relative './string_splitter'

class NumberParser
  def initialize(number_string)
    @splitter = StringSplitter.new(number_string)
  end

  def numbers
    numbers = split_number_string
    convert_to_integers(numbers)
  end

  private

  def split_number_string
    delimiters = @splitter.delimiters.join('|')
    @splitter.body.split(/#{delimiters}/)
  end

  def convert_to_integers(numbers)
    numbers.map(&:to_i)
  end
end
