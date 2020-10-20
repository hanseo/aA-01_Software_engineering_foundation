str = "hello"
sym = :hello
str == sym

str[0] = "x"
#sym[0] = "x"
=begin
  symbols are immutable
  Symbols only need to be created once cause we can be certain 
  that it wont change over the course of the program.
  it's more EFFCIENT FASTEr to compare symbols thatn strings
  More memory strings
  object_id
=end

my_hash = {
  :name => "John",
  :color => "blue"
}

another_hash = {
  name: "J",
  color: "green"
}

#Default arguments
def repeat(message, num = 1)
  message * num
end

p repeat("hi")
p repeat("hi", 3)

def greet(person_1, person_2 = nil)
  if person_2.nil?
    "Hey " + person_1
  else
    "Hey " + person_1 + " and " + person_2
  end
end

p greet("Joe", "Jay")
p greet("Jay")

#When passing hashes as arguments to method, braces 
#can be omitted
def method(hash)
  p hash
end
method("a" => "A", "b" => "B", "c" => "C")
method({"A" => "a", "B" => "b"})

def modify_str(str, options)
  str.upcase! if options["upper"]
  p str * options["repeats"]
end

#more readable without braces
modify_str("bye", {"upper" => true, "repeats" => 3})
modify_str("bye", "upper" => true, "repeats" => 2)

#default arguments + readability 
def modif_str(str, options = {"upper" => true, "repeats" => 5})
  p str.upcase * options["repeats"] if options["upper"]
end

modif_str("bye")
modif_str("bye", "upper" => true, "repeats" => 2)

#splat operator *
#To add additional args
def meth(arg_1, *arg_2)
  p arg_1
  p arg_2
end
meth("a", "b", "c")
meth("a") #arg_2 prints an empty array

#To decompose an array
def greetings(first_name, sec_name)
  p "Hey " + first_name + ", your second name is " + sec_name
end

names = ["Joe", "Jay"]
greetings(*names)

arr_1 = ["a", "b"]
arr_2 = ["d", "e"]
#arr_3 = [arr_1, "c", arr_2].flatten
arr_3 = [*arr_1, "c", *arr_2]
p arr_3

#Double splat ** To decompse a Hash
#only works when keys aree symbols
old_hash = { a: 1, b: 2 }

new_hash = { **old_hash, c: 3 }
=begin
new_hash = { c: 3 }
old_hash.each do |k, v|
  new_hash[k] = v
end
=end
p new_hash

#Inject or Reduce
#Should accept 2 parameters accumulator and current element
#Acc will change over time & the block retutns the accumulator after one iteration

p [1, 5, 34].inject { |acc, el| acc + el }
#useful to find the min value of array
#whatever it returns becomes the new acc
[11, 5, 3, 7].inject do |acc, el|
  if el < acc
    el
  else
    acc
  end
end
#in one line
p [11, 5, 3, 7].inject { |acc, el| el < acc ? el : acc }

#Inject w/ default accumulator
p [11, 4, 54, 1].inject(100) { |acc, el| acc + el }
p [11, 4, 54, 1].inject(2) { |acc, el| el.even? ? acc + el : acc }

#Difference .each_char vs chars.each
#chars.each creates an array and is slower than .each_char 
