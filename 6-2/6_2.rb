file = File.open('input.txt')

input = file.map { |x| x.gsub(/\D/, ' ').split.map(&:to_i) }

matrix = Array.new(400) { Array.new(400, 0) }

def matrix_fill(input, matrix)
  (0..matrix.size - 1).each do |j|
    (0..matrix[0].size - 1).each do |i|
      cord = input.map { |arr| (arr[0] - j).abs + (arr[1] - i).abs }.sum
      matrix[i][j] = 1 if cord < 10_000
    end
  end
  find_count(matrix)
end

def find_count(matrix)
  matrix.flatten.count { |num| num > 0 }
end

print matrix_fill(input, matrix)
