def proper_factors(num)
  (1...num).select { |factor| num % factor == 0 }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(nth)
  num = 6
  ideal_nums = []

  while ideal_nums.length < nth
    ideal_nums << num if perfect_number?(num)
    num += 1
  end

  ideal_nums
end