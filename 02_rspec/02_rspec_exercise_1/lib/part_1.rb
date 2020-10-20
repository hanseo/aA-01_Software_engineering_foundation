def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(arr)
  arr.sum / arr.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(str)
  new_str = str.split
  new_str.map { |word| new_str.index(word).even? ? word.upcase : word.downcase }.join(" ")
end