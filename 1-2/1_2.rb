file = File.open('input.txt')

input = file.to_a.map(&:to_i)

def method(input)
  values = [0]
  result = 0
  while values.size == values.uniq.size
    input.each do |x|
      result += x
      return result if values.include?(result)

      values << result
    end
  end
end

puts method(input)
