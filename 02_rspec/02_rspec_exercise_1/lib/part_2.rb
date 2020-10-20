def hipsterfy(word)
  vowels = "aeiou"
  
  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      return word[0...i] + word[i + 1..-1]
    end

    i -= 1
  end

  word
end

def vowel_counts(str)
  vowels = "aeiou"
  counts = Hash.new(0)
  
  str.downcase.each_char do |char|
    counts[char] += 1 if vowels.include?(char)
  end

  counts
end

def caesar_cipher(message, n)
  alphabet = ("a".."z").to_a
  new_str = ""

  message.each_char do |char|
    if alphabet.include?(char)
      i = alphabet.index(char)
      new_str += alphabet[(i + n) % alphabet.length]
    else
      new_str += char
    end
  end
  
  new_str
end