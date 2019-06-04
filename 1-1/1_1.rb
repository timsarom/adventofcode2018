file = File.open('input.txt')

input = file

puts input.map(&:to_i).sum
