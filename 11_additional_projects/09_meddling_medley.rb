def duos(str)
  count = 0
  i = 0

  while i < str.length
    count += 1 if str[i] == str[i + 1]
    i += 1
  end

  count
end

#p duos('bootcamp')      # 1
#p duos('wxxyzz')        # 2
#p duos('hoooraay')      # 3
#p duos('dinosaurs')     # 0
#p duos('e')             # 0

def sentence_swap(str, hash)
  str.split.map { |w| hash[w] ||= w }.join(" ")
end

=begin
p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'
=end

def hash_mapped(hash, prc, &blck)
  new_hash = {}

  hash.each { |k, v| new_hash[blck.call(k)] = prc.call(v) }

  new_hash
end

=begin
double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}
=end

def counted_characters(str)
  arr = str.split("")
  arr.select { |c| arr.count(c) > 2 }.uniq
end

=begin
p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []
=end

def triplet_true?(str)
  i = 0

  while i < str.length
    return true if str[i] == str[i + 1] && str[i + 1] == str[i + 2]

    i += 1
  end

  false
end

=begin
p triplet_true?('caaabb')        # true
p triplet_true?('terrrrrible')   # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false
=end

def energetic_encoding(str, hash)
  str.split.map do |w|
    w.split("").map { |c| hash[c] ||= "?" }.join
  end.join(" ")
end

=begin
p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'
=end

def uncompress(str)
  l = []
  n = []
  uncompressed = ""

  str.split("").each.with_index do |letter, i|
    i.even? ? l << letter : n << letter.to_i
  end
  
  l.each.with_index do |c, i|
    uncompressed += c * n[i]
  end

  uncompressed
end

#p uncompress('a2b4c1') # 'aabbbbc'
#p uncompress('b1o2t1') # 'boot'
#p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prcs)
  arr.select do |n|
    prcs.all? { |prc| prc.call(n)} 
  end
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
#p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(str)
  vowels = "aeiou"

  str.split.map do |w|
    if w.length < 3
      w
    elsif vowels.include?(w[0].downcase) 
      w += "yay"
    else
      rotate(w) + "ay"
    end
  end.join(" ")
end

def rotate(word)
  vowels = "aeiou"
  arr = word.split("")

  until vowels.include?(arr[0])
    last_w = arr.shift
    arr << last_w
  end

  word.capitalize == word ? arr.join.capitalize : arr.join
end

#p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
#p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
#p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
#p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
#p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(str)
  str.split.map do |w|
    new_w = w.length < 3 ? w : revert(w)
    w == w.capitalize ? new_w.capitalize : new_w
  end.join(" ")
end

def revert(w)
  vowels = "AEIOUaeiou"

  return w * 2 if vowels.include?(w[-1])
  
  (1..w.length).each do |i|
    if vowels.include?(w[-i])
      return w + w[-i..-1]
    end
  end
end

=begin
p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"
=end

def disjunct_select(arr, *prcs)
  arr.select do |el|
    prcs.any? { |prc| prc.call(el) }
  end
end

=begin
longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]
=end

def alternating_vowel(str)
  vowels = "aeiou"

  str.split.map.with_index do |w, i|
    i.even? ? missing_vowels(w) : missing_vowels(w.reverse).reverse
  end.join(" ")
end

def missing_vowels(w)
  vowels = "aeiou"

  (0...w.length).each do |i|
    if vowels.include?(w[i])
      return w[0...i] + w[i + 1..-1]
    end
  end

  w
end

=begin
p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"
=end

def silly_talk(str)
  str.split.map do |w|
    new_w = translate(w)
    w.capitalize == w ? new_w.capitalize : new_w
  end.join(" ")
end

def translate(w)
  vowels = "AEIOUaeiou"
  new_w = ""

  return w += w[-1] if vowels.include?(w[-1])

  w.each_char do |c|
    if vowels.include?(c)
      new_w += c + "b" + c
    else
      new_w += c
    end
  end

  new_w
end

=begin
p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"
=end

def compress(str)
  new_w = ""

  i = 0
  while i < str.length
    count = 1
    while str[i] == str[i + 1]
      count += 1
      i += 1
    end
    
    if count > 1
      new_w += str[i] + count.to_s
    else
      new_w += str[i]
    end

    i += 1
  end

  new_w
end

=begin
p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
=end