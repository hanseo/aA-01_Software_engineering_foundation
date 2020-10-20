def element_count(arr)
  hash = {}

  arr.each do |ele|
    hash[ele] = arr.count(ele)
  end

  hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |char, i|
    str[i] = hash[char] || char
  end
end

def product_inject(arr)
  arr.inject(:*)
end