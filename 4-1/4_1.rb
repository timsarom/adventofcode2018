file = File.open('input.txt')

input = file

ordered = input.sort_by { |str| str[/\d{4}-\d{2}-\d{2} \d{2}:\d{2}/] }

hash = Hash.new { |h, k| h[k] = Array.new(60, 0) }

def sorted_hash(ordered, hash)
  guards = []
  (0..ordered.size - 2).each do |i|
    starts_shift = ordered[i].match(/#\d+ begins shift/)
    falls_asleep = ordered[i].match(/falls asleep/)
    guard_id = ordered[i].scan(/#\d+/)
    time = ordered[i].scan(/\d{2}:\d{2}/)[0].split(':').map(&:to_i)
    next_time = ordered[i + 1].scan(/\d{2}:\d{2}/)[0].split(':').map(&:to_i)

    guards << guard_id if starts_shift

    if falls_asleep
      if time[0] != 0
        (time[1]...60).each do |k|
          hash[guards.last][k] += 1
        end
        (0...next_time[1]).each do |k|
          hash[guards.last][k] += 1
        end
      elsif time[1] < next_time[1]
        (time[1]...next_time[1]).each do |k|
          hash[guards.last][k] += 1
        end
      else
        (0...next_time[1]).each do |k|
          hash[guards.last][k] += 1
        end
      end
    end
  end
  most_sleep(hash)
end

def most_sleep(hash)
  most_sleep_guard = hash.max_by { |_k, v| v.sum }
  print most_sleep_guard.flatten[0].scan(/\d+/)[0].to_i *
        most_sleep_guard[1].index(most_sleep_guard[1].max)
end

sorted_hash(ordered, hash)
