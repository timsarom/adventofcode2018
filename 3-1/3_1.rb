file = File.open('input.txt')

input = file.map do |line|
  line.gsub(/\D/, ' ').split
end

input.map! { |line| line.map!(&:to_i) }

fabric = Array.new(1000) { Array.new(1000, 0) }

def adding_all_layers(input, fabric)
  input.each do |claim|
    (claim[2]...claim[2] + claim[4]).each do |i|
      (claim[1]...claim[1] + claim[3]).each do |k|
        fabric[i][k] += 1
      end
    end
  end
  square_count(fabric)
end

def square_count(fabric)
  count = 0
  fabric.each do |row|
    row.each do |square|
      count += 1 if square >= 2
    end
  end
  print count
end

adding_all_layers(input, fabric)
