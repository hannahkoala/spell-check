class Word
  def initialize(file)
    @lines = File.readlines(file)
    @case_count = @lines[0].to_i
    @lines = @lines.drop(2)
    group_words
  end

  def group_words
    @case_count.times do |i|
      @words = []
      @index = i * 4
      @words = @lines[@index]
      @candidates = @lines[@index + 1..@lines.length]
      compare(@words, @candidates)
    end
  end

  def compare(word, candidate)
    best_match = nil
    best_score = 0
    candidate.each do |c|
      score = test_candidate(word, candidate)
      if score > best_score
        best_score = score
        best_match = c
      end
    end
    puts best_match
  end

  def test_candidate(word, candidate)
    candidate_score = 0

    word.each_char do |word_l|
      candidate.each do |cand|
        cand.each_char do |cand_l|
          if cand_l == word_l
            candidate_score += 1
          end
        end
      end
    end
    candidate_score
  end

end

puts "Enter the location of the next file you would like to test, or enter 'examp' for default example:"
input = gets.to_s.chomp
if input == "examp"
  Word.new("./input.txt")
else
  Word.new(input)
end