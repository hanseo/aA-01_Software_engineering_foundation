def mersenne_prime(nth)
  mersenne = 0
  x = 0
  i = 0
  while i < nth
    mersenne = 2 ** x - 1
    i += 1 if is_prime?(mersenne)
    x += 1
  end

  mersenne
end

def is_prime?(n)
  return false if n < 2
  (2...n).none? { |f| n % f ==  0 }
end


#p mersenne_prime(1) # 3
#p mersenne_prime(2) # 7
#p mersenne_prime(3) # 31
#p mersenne_prime(4) # 127
#p mersenne_prime(6) # 131071

def triangular_word?(w)
  i = 1
  s = word_sum(w)
  n = 0

  while n < s
    n = (i * (i + 1)) / 2
    i += 1
  end

  n == s
end

def word_sum(w)
  alpha = ("a".."z").to_a
  w.chars.map { |char| alpha.index(char) + 1 }.sum
end

#p triangular_word?('abc')       # true
#p triangular_word?('ba')        # true
#p triangular_word?('lovely')    # true
#p triangular_word?('question')  # true
#p triangular_word?('aa')        # false
#p triangular_word?('cd')        # false
#p triangular_word?('cat')       # false
#p triangular_word?('sink')      # false

def consecutive_collapse(arr)
  new_arr = arr
  i = 0

  while i < new_arr.length-1
    if new_arr[i] - new_arr[i + 1] == -1 || new_arr[i] - new_arr[i + 1] == 1
      if i == 0
        new_arr = new_arr[i+2..-1]
      else  
        new_arr = new_arr[0...i] + new_arr[i+2..-1]
      end
      i = 0 
    else
      i += 1
    end
  end

  new_arr
end

#p consecutive_collapse([3, 4, 1])                     # [1]
#p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
#p consecutive_collapse([9, 8, 2])                     # [2]
#p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
#p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
#p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
#p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
#p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(arr, n)
  arr.map do |el|
    m = []

    while m.length < n.abs
      el = n > 0 ? el + 1 : el - 1

      if el < 2
        m << nil
      else
        m << el if is_prime?(el)  
      end  
    end

    m[-1]
  end
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]