file = File.open('input.txt')

input = file.map(&:chars).flatten

arr = ('a'..'z').to_a

def letter_count(input, arr)
  result = []
  size = []
  arr.each do |let|
    wo_one_letter = input - let.chars - let.capitalize!.chars
    wo_one_letter.each do |letter|
      if result.empty?
        result << letter
      elsif (result.last.ord - letter.ord).abs == 32
        result.pop
      else
        result << letter
      end
    end
    size << result.size
    result = []
  end
  size.min
end

print letter_count(input, arr)
