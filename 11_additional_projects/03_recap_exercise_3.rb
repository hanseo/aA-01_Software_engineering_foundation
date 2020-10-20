def no_dupes?(arr)
  arr.select { |ele| arr.count(ele) < 2 }
end

def no_consecutive_repeats?(arr)
  arr.each.with_index do |ele, i|
    return false if ele == arr[i + 1]
  end

  true
end

def char_indices(str)
  chars = Hash.new { |h, k| h[k] = [] }

  str.each_char.with_index do |char, i|
    chars[char] << i
  end

  chars
end

def longest_streak(str)
  arr = str.split("")

  arr.select do |char|
    arr.inject do |acc, el|
      if (arr.count(acc) <=> arr.count(el)) == 1
        acc
      else
        el
      end
    end == char
  end.join("")
end

def bi_prime?(num)
  primes = (2...num).select { |n| prime?(n) }

  primes.each do |multiple_1|
    primes.each do |multiple_2|
      return true if multiple_1 * multiple_2 == num
    end
  end

  false
end

def prime?(n)
  return false if n < 2

  (2...n).each do |factor|
    if n % factor == 0
      return false
    end
  end

  true
end

def vigenere_cipher(message, keys)
  alphabet = ("a".."z").to_a
  new_word = ""

  message.each_char.with_index do |char,i|
    char_i = alphabet.index(char)
    key_i = keys[i % keys.length]

    new_word += alphabet[(char_i + key_i) % alphabet.length]
  end

  new_word
end

def vowel_rotate(str)
  vowels = "aeiou"

  str.chars.map.with_index do |char, i|
    if vowels.include?(char)
      prev = i - 1
      until vowels.include?(str[prev])
        prev -= 1
      end
      str[prev]      
    else
      char
    end
  end.join("")
end

class String
  def select(&prc)
    new_str = ""

    if prc != nil
      self.chars do |el|
        new_str += el if prc.call(el)
      end
    end
    
    new_str
  end

  def map!(&prc)
    self.each_char.with_index do |el, i|
      self[i] = prc.call(el, i)
    end
  end
end


def multiply(a, b)
  return -a if b == -1 
  return a if b == 1 
  return 0 if b == 0
  
  if b > 0
    multiply(a, b - 1) + multiply(a, 1)
  else
    multiply(a, b + 1) + multiply(a, -1)
  end
end
 
def lucas_sequence(num)
  return [2, 1] if num == 2
  return [2] if num == 1
  return [] if num == 0

  lucas_sequence(num - 1) << lucas_sequence(num - 1)[-1] + lucas_sequence(num - 2)[-1]
end

def prime_factorization(num)
  (2...num).each do |factor|
    if num % factor == 0 
      new_num = num / factor
        
      return [*prime_factorization(factor), *prime_factorization(new_num)]
    end
  end

  [num]
end

