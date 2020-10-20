=begin
  
  
=end

def factorial(n)
  (1..n).inject { |acc, el| acc * el }
end

p factorial(5) #=> 120

def recursive_factorial(n)
  #base case
  return 1 if n == 1
  #recursive case
  recursive_factorial(n - 1) * n
end

p recursive_factorial(5) #120

#Recursive fibonacci
#fib nums = 1, 1, (1+1) = 2, 2 +1 = 3, 2 + 3 = 5, 5 + 3 = 8...

def fib(n)
  arr = [1, 1]
  until arr.length == n 
    arr << arr[-1] + arr[-2]
  end

  arr
end

p fib(5)

def recursive_fib(n)
  #base case
  return 1 if n == 2 || n == 1

  #recursive case
  recursive_fib(n - 1) + recursive_fib(n - 2)
end

p recursive_fib(5)
p recursive_fib(4)
p recursive_fib(3)
p recursive_fib(2)
p recursive_fib(1)