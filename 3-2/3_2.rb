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
  getting_claims(input, fabric)
end

def getting_claims(input, fabric)
  sorted_claims = []
  single_claim = []
  input.each do |claim|
    (claim[2]...claim[2] + claim[4]).each do |i|
      (claim[1]...claim[1] + claim[3]).each do |k|
        single_claim << fabric[i][k]
      end
    end
    sorted_claims << single_claim
    single_claim = []
  end
  claim_id(sorted_claims)
end

def claim_id(sorted_claims)
  sorted_claims.each do |claim|
    return sorted_claims.index(claim) + 1 if claim.all? { |square| square == 1 }
  end
end

print adding_all_layers(input, fabric)
