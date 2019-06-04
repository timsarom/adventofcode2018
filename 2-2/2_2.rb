file = File.open('input.txt')

input = file.map do |string|
  string.split(//)
end

def method(input)
  (0..input[0].length).each do |i|
    check_array = []
    input.each do |str|
      copy = str.dup
      copy.delete_at(i)
      check_array << copy
    end
    check_array.each { |arr| return arr.join if check_array.count(arr) == 2 }
  end
end

print method(input)
