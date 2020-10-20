=begin
Blocks
A block is code that is passed into a method to be executed.
There are 2 ways of passing block into a method ( in the example: map).
- {...}
  e.g 
  [1, 2, 3].map { |num| -(num * 2) } #=> [-2, -4, -6]

- do...end    
  e.g
  [1, 2, 3].map do |num|
    doubled = num * 2
    -doubled
  end
  
Blocks are similar to methods, both contain lines of code and take parameters.
However, the keyword "return" belongs to methods, not blocks.
e.g

#Correct
def double(arr)
  arr.map { |param| param * 2 } 
end

double([1, 2, 3]) #=> [2, 4, 6]

#Incorrect
def double(arr)
  arr.map { |param| return param * 2 }
end

double([1, 2, 3]) #=> [2]

#Using Methods as Blocks
array.method { |block_param| block_param.method }
array.method(&:method)

["a", "b", "c"].map { |str| str.upcase } #=> ["A", "B", "C"]
["a", "b", "c"].map(&:upcase)
:upcase is a symbol referring to String#upcase method.
We use "&" to convert the object into a block, that way the method can receive
the block, because methods cannot pass methods.

[1, 2, 5].select { |num| num.odd? } #=> [1, 5]
[1, 2, 5].select(&:odd?)

end