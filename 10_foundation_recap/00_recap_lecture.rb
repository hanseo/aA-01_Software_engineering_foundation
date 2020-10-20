=begin
Spaceship operator <=>
a <=> b ; returns either -1, 0, 1 
  -1 if a < b
  0 if a == b
  1 if a > b
  
when we compare strings, we don't return the longest
  but alphabetically greater:

  "abcd" <=> "abcd"     #=> 0, when they're identical
  "abcd" <=> "abcde"    #=> -1, we compare the first letter
  that is not identical, so: "d" < "e" in binary

  "horse" <=> "apple" #=> 1, "h" > "a" in binary, length does not affect the result
  "abc" <=> "ABC"     #=> 1, "a" > "A" in binary, lowercases > capitalized version
  "a" <=> "z"         #=> -1, "a" < "z" in binary
  "categorically" <=> "category"  #=> -1, "i" < "y" in binary, again, length does
  not affect result.
  "z" <=> "apple"     #=> 1, "z" > "a"
=end

p 7 <=> 2 #=> 1
p 7 <=> 7 #=> 0
p 7 <=> 10 #=> -1
p (-7) <=> 2 #=> -1

=begin
#max & #max_by
arr = ["albatross", "dog", "horse", "fish", "antelope", "zzzzzzzz"]
arr.max  #=> "zzzzzzzz"
arr.max { |el_1, el_2| el_1.length <=> el_2.length } #=> "albatross"
arr.max_by { |el| el.length } #=>"albatrosss"
arr.max_by(&:length)          #=>"albatrosss"

arr = ["bc", "bbc", "bde", "fde"]
p arr.max_by(&:length) #=> "bbc", if there's a tie, it will return the first value.

=end

=begin
Nil as Falsey Notes  
  "nil" and "false" are the only falsey values (in Ruby)
  everything else is truthy


=end
val = nil
p val ? "it's true" : "it's false" #=> "it's false"

=begin
 OR 
 a || b
if a is true; returns a
if a is falsey; returns b
=end

p true || 42          # => true
p 42 || true          # => 42
p false || 42         # => 42
p 42 || false         # => 42
p false || "hello"    # => "hello"
p nil || "hello"      # => "hello"
p "hi" || "hello"     # => "hi"
p 0 || true           # => 0
p false || nil        # => nil


# || used in Default Arguments
def greet(person = nil)
  if person.nil?
    person = "you"
  end

  p "hey " + person
end

greet #=> "hey you"
greet("James") #=> "hey James"

def greet_refactored(person = nil)
  person = person || "you"
  p "hey " + person
end

greet_refactored
greet_refactored("Jay")

def even_more_refactored(person = nil)
  person ||= "you"
  p "hey " + person
end

even_more_refactored
even_more_refactored("John")

def also_refactored(person = "you")
  p "hey " + person
end

also_refactored
also_refactored("jan")

# ||= for Default Procs

def call_proc(val, &proc)
  proc ||= Proc.new { |data| data + " you" }
  proc.call(val)
end

p call_proc("hey")
p call_proc("programmers") { |data| data * 3 }
p call_proc("code") { |data| "--" + data.capitalize + "--" }

# ||=  as Lazy initialization
#Lazy initialization is used to classes and it's a design strategy 
#where we delay the creation of an object until it's needed.

#In the lower example, @name & @chefs must be assigned immediately
#However, @menu is not needed right away, and since it's a long array
#it will take a lot of stack/memory
#So initializing Restaurant with @menu, will slow down the process.

class Restaurant
  attr_accessor :name, :chefs, :menu

  def initialize(name, chefs)
    @name = name
    @chefs = chefs
    @menu = ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
  end
end

my_restaurant = Restaurant.new("My Restaurant", ["Marta", "Jon", "Soon-Mi"])

#Refactored version
class Refactored_Restaurant
  attr_accessor :name, :chefs, :menu

  def initialize(name, chefs)
    @name = name
    @chefs = chefs
  end

  def menu
    @menu ||= ["sammies", "big ol' cookies", "bean blankies", "chicky catch", "super water"]
  end
  #in the case, that we haven't assigned any values for menu
end

#this way, separating #menu getter method we will only create this object
#when we need it
refactored_rest = Refactored_Restaurant.new("My Refactored Restaurant", ["Marta", "Jon", "Soon-Mi"])
p refactored_rest #=> @name, @chefs
p refactored_rest.menu #=> ["sammies, "big ol'....,etc]
p refactored_rest #=> @name, @chef, @menu 