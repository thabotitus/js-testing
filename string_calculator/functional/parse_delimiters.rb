class ParseDelimiters
  class << self
    def delimiter_list(has_header, header)
      other_delimiters = if has_header
                           header_delimiters(header)
                         else
                           []
                         end
      [",","\n"] + other_delimiters
    end

    private

    def header_delimiters(header)
      raw_delimiters = header[2..-1]
      clean_delimiters = clean_left(clean_right(raw_delimiters))
      split_delimiters(clean_delimiters)
    end

    def clean_left(delimiters)
      if delimiters.start_with?('[')
        delimiters[1..-1]
      else
        delimiters
      end
    end

    def clean_right(delimiters)
      if delimiters.end_with?(']')
        delimiters[0..-2]
      else
        delimiters
      end
    end

    def split_delimiters(delimiters)
      delimiters.split('][')
    end
  end
end
