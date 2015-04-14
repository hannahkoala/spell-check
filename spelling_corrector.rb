words = File.readlines("./input.txt")

numberEntries = parseInt words[0]

numberEntries.times do |i|
  index = i * 4
  misspelled_word = words[index + 1]
  candidates = [words[index + 2], words[index + 3]]
  puts compare(misspelled_word, candidates)
end

def compare(misspelled_word, candidates)
  best_candidate = nil
  best_candidate_score = 0
  candidates.each do |candidate|
    score = test_candidate misspelled_word, candidate
    if score > best_candidate_score
      best_candidate_score = score
      best_candidate = candidate
  end
  return best_candidate
end

def test_candidate(misspelled_word, candidate) 
  score = 0
  misspelled_word.each_char do |l|
    candidate.each_char do |j|
      if l == j
        score += 1
      end
    end
  end
  return score
end
