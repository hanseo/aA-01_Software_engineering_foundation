# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  num.downto(2).each do |divisor|
    return divisor if num % divisor == 0 && is_prime?(divisor)
  end
end

def is_prime?(num)
  return false if num < 2

  (2...num).none? { |factor| num % factor == 0 }
end

def unique_chars?(str)
  str.chars.all? { |char| str.count(char) < 2 }
end

def dupe_indices(arr)
  new_hash = Hash.new([])
  #option B new_hash = Hash.new( { |k,v| hash[k] = []})
  arr.each_with_index do |char, i|
    new_hash[char] += [i] if arr.count(char) > 1
    #if we did option B, new_hash[char] << i if arr.coun(char) > 1
  end

  new_hash
end

def ana_array(arr_1, arr_2)
  return false if arr_1.length != arr_2.length

  arr_1.each do |char|
    return false if !arr_2.include?(char)
  end

  arr_2.each do |char|
    return false if !arr_1.include?(char)
  end

  true
end