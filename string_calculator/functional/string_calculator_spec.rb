require_relative './string_calculator'

describe StringCalculator do
  def calc(number_string)
    StringCalculator.add(number_string)
  end

  it 'returns 0 when empty' do
    expect(calc('')).to eq 0
  end

  it 'returns the number for just a number' do
    expect(calc('2')).to eq 2
  end

  it 'returns the sum of 2 numbers' do
    expect(calc('3,2')).to eq 5
  end

  it 'returns the sum of any number of numbers' do
    expect(calc('3,2,1,10')).to eq 16
  end

  it 'handles newline as a separator' do
    expect(calc("3\n2")).to eq 5
  end

  it 'handles defining another separator' do
    expect(calc("//;\n3;2")).to eq 5
  end

  it 'handles defining another separator' do
    expect(calc("//;\n3;2")).to eq 5
  end

  it 'throws an exception for a negative number' do
    expect{ calc("3,-2") }.to raise_exception('Negative numbers not allowed: [-2]')
  end

  it 'throws an exception for multiple negative numbers' do
    expect{ calc("3,-2,5,-10,-1") }.to raise_exception('Negative numbers not allowed: [-2,-10,-1]')
  end

  it 'ignores numbers greater than 1000' do
    expect(calc("3,1001,5")).to eq 8
  end

  it 'handles multi-char separators' do
    expect(calc("//[;|;]\n3;|;2")).to eq 5
  end

  it 'handles multiple multi-char separators' do
    expect(calc("//[;|;][xx]\n3;|;2xx5")).to eq 10
  end
end

