file = File.open('input.txt')

input = file.map(&:chars).flatten

def letter_count(input)
  result = []
  input.each do |letter|
    if result.empty?
      result << letter
    elsif (result.last.ord - letter.ord).abs == 32
      result.pop
    else
      result << letter
    end
  end
  result.size
end

print letter_count(input)
