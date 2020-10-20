def partition(arr, num)
  first = arr.select { |ele| ele < num }
  second = arr.select { |ele| ele >= num }

  [first, second]
end

def merge(hash_1, hash_2)
  new_hash = {}

  hash_1.each { |k, v| new_hash[k] = v }
  hash_2.each { |k, v| new_hash[k] = v }
  
  new_hash
end

def censor(str, arr)
  vowels = "aeiou"

  new_str = str.split.map do |word|
    if arr.include?(word.downcase)
      curses = word.chars.map do |char|
        vowels.include?(char.downcase) ? "*" : char
      end
      curses.join("")
    else
      word
    end
  end

  new_str.join(" ")
end

def power_of_two?(num)
  Math.log2(num) % 1 == 0
end