file = File.open('input.txt')

input = file.map { |x| x.gsub(/\D/, ' ').split.map(&:to_i) }

matrix = Array.new(400) { Array.new(400, 0) }

def matrix_fill(input, matrix)
  (0..matrix.size - 1).each do |j|
    (0..matrix[0].size - 1).each do |i|
      num = input.map { |arr| (j - arr[0]).abs + (i - arr[1]).abs }
      matrix[i][j] = if num.count { |n| n == num.min } == 1
                       num.index(num.min) + 1
                     else
                       0
                     end
    end
  end
  find_count(matrix)
end

def find_count(matrix)
  final = matrix.flatten - matrix.first - matrix.last - matrix.transpose.first - matrix.transpose.last
  final.map { |num| final.count(num) }.max
end

print matrix_fill(input, matrix)
