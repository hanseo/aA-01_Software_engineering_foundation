def palindrome?(str)
  reversed = []

  str.each_char do |char|
    reversed.unshift(char)
  end

  str == reversed.join("")
end

def substrings(str)
  subs = []
  (0...str.length).each do |start_idx|
    (start_idx...str.length).each do |end_idx|
      subs << str[start_idx..end_idx]
    end
  end

  subs
end

def palindrome_substrings(str)
  substrings(str).select { |words| words.length > 1 && palindrome?(words) }
end