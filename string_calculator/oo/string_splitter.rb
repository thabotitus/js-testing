class StringSplitter
  def initialize(number_string)
    @number_string = number_string
  end

  def delimiters
    delimiters = []
    if header?
      delimiters = add_header_delimiters
    end
    delimiters << ","
    delimiters << "\n"
    delimiters
  end

  def body
    if header?
      @number_string.split("\n",2)[1]
    else
      @number_string
    end
  end

  private

  def header?
    @number_string.start_with?('//')
  end

  def add_header_delimiters
    delimiter = header[2..-1]
    if delimiter.start_with?('[')
      delimiter = delimiter[1..-1]
    end
    if delimiter.end_with?(']')
      delimiter = delimiter[0..-2]
    end
    delimiter.split('][')
  end

  def header
    @number_string.split("\n")[0]
  end
end
