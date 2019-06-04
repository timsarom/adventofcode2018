file = File.open('input.txt')

input = file
twos = 0
threes = 0

input.each do |string|
  if string.split(//).any? { |x| string.count(x) == 3 } &&
     string.split(//).any? { |x| string.count(x) == 2 }
    twos += 1
    threes += 1
  elsif string.split(//).any? { |x| string.count(x) == 2 }
    twos += 1
  elsif string.split(//).any? { |x| string.count(x) == 3 }
    threes += 1
  end
end

result = twos * threes
print result
