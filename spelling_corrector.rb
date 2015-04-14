text_file = File.readlines("./input.txt")
words = text_file.drop(2)

def compare(mis, op1, op2)
  misspelled_word = mis.split(//)
  option_1 = op1.split(//)
  option_2 = op2.split(//)
  op1_match = 0
  op2_match = 0

  misspelled_word.each do |l|
    option_1.each do |j|
      if l == j
        op1_match += 1
      end
    end
    option_2.each do |i|
      if l == i
        op2_match += 1
      end
    end

    if op1_match > op2_match
      return op1
    else
      return op2
    end
  end


end

37.times do |i|
  if words[i].length > 2 && words[i.next].length > 2 && words[i.next.next].length > 2
    puts compare(words[i], words[i.next], words[i.next.next])
  end
end