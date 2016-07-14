require_relative './parse_delimiters'

class NumberParser
  class << self
    def numbers(number_string)
      numbers = split_number_string(parse_delimiters(number_string),
                                    parse_body(number_string))
      convert_to_integers(numbers)
    end

    private

    def split_number_string(delimiters, body)
      delimiters = delimiters.join('|')
      body.split(/#{delimiters}/)
    end

    def parse_delimiters(number_string)
      ParseDelimiters.delimiter_list(header?(number_string),
                                     header(number_string))
    end

    def header?(number_string)
      number_string.start_with?('//')
    end

    def header(number_string)
      number_string.split("\n")[0]
    end

    def parse_body(number_string)
      if header?(number_string)
        number_string.split("\n",2)[1]
      else
        number_string
      end
    end

    def convert_to_integers(numbers)
      numbers.map(&:to_i)
    end
  end
end
