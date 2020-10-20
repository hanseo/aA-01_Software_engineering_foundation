def is_prime?(n)
  return false if n < 2
  return false if (2...n).any? { |factor| n % factor == 0 }

  true
end

def nth_prime(n)
  primes = []
  num = 2

  while primes.length < n
    primes << num if is_prime?(num)
    num += 1
  end

  primes.last
end

def prime_range(min, max)
  (min..max).select { |n| is_prime?(n) }
end