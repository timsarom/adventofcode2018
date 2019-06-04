letters = {}
File.readlines('input.txt').each do |l|
  i = l[36]
  j = l[5]
  letters[i] ||= []
 	letters[j] ||= []
  letters[i] << j
end

result = ''
until letters.empty?
  e = letters.select { |_k, v| v.empty? }.keys.min
  letters.delete(e)
  letters.each { |_k, v| v.delete(e) }
  result += e
end
puts result