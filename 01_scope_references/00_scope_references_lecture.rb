=begin
Bubble sort
[2, 8, 5, 2, 6]
The iteration is finished when we don't make any more swaps during an iteration
1st iteration
  1) [*2, *8, 5, 2, 6] -> [*2, *8, 5, 2, 6]
  2) [2, *8, *5, 2, 6] -> [2, *5, *8, 2, 6]
  3) [2, 5, *8, *2, 6] -> [2, 5, *2, *8, 6]
  4) [2, 5, 2, *8, *6] -> [2, 5, 2, *6, *8]

2nd iteration
  1) [*2, *5, 2, 6, 8] -> [*2, *5, 2, 6, 8]
  2) [2, *5, *2, 6, 8] -> [2, *2, *5, 6, 8]
  3) [2, 2, *5, *6, 8] -> [2, 2, *5, *6, 8]
  4) [2, 2, 5, *6, *8] -> [2, 2, 5, *6, *8]

3rd iteration
  1) [*2, *2, 5, 6, 8] -> [*2, *2, 5, 6, 8]
  2) [2, *2, *5, 6, 8] -> [2, *2, *5, 6, 8]
  3) [2, 2, *5, *6, 8] -> [2, 2, *5, *6, 8]
  4) [2, 2, 5, *6, *8] -> [2, 2, 5, *6, *8]
  Sorted! We know it's sorted because during this iteration
  we didn't do any more swaps
=end

def bubble_sort(arr)
  sorted = false

  while !sorted
    sorted = true
    
    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end

  arr
end

#Method variables
#Global variables
  $message = "hello"
  def say_hello
    p $message
  end

  say_hello  => "hello" 

  def say_hello
    $message = "hello"
  end

  say_hello 
  #Important! if we don't call the method say_hello first
  $message is not going to get printed 
  p $message => "hello"
#Constants, they exist in the Global Scope too
#We usually want the Constants outside methods, at the top of our Class
#Ruby Classes are Constants (Array, String, Hash)
#When defining a Class, we're creating a Class object assigned to a Constant
#The Constant becomes the Class name.

class People #People is the Constant and Class name.
  TEACHER = "Joe"
end
p People::TEACHER
FOOD = "pho"
p FOOD #=> "pho"

#Constants "can't be reassigned", but we can mutate them
#There is no way to prevent it from changing
FOOD = "ramen" #=>Warning, but still points to "ramen" now
FOOD[0] = "G" #=> "Gho"

#Unless you turn them into immutable object!
FOOD = "phorever".freeze
# FOOD << "o" #=> Error, can't modify frozen String
# FOOD = "hello" #=> Error, can't modify frozen String
p FOOD

#Blocks and conditionals don't have scopes
def say_bye
  message = "bye"

  3.times { p message }
end

say_bye #=> "bye""bye""bye"

if true
  drink = "macciato"
end

p drink #=>"macciato"